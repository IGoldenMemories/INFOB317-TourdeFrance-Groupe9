:- consult(gamelogic).
:- consult(ia_minmax).
:- use_module(library(lists)).

calculsommevecteur(Vecteur,Somme):-
  sum_list(Vecteur, Somme).


alph_bet(Etatactuel, Actionchoisie, Profondeur) :-
  alph_bet(Profondeur, Etatactuel,Nomcoureur, 0, 1140, _, Actionchoisie).

/* alph_bet(+Profondeur, +Etatactuel, +Nomcoureur, +Alpha, +Beta, -Meilleurvecteur, -Meilleuraction) :-​

          Choisit la meilleur action depuis l'état actuel de jeu
          en utilisant l'algorithme alpha beta en recherche en profondeur limitée ​
          0-> borne inférieure/ tous les coureurs ont atteint la ligne d'arrivée
          1140 --> borne supérieure/ tous les coureurs se trouvent sur la ligne de départ

  */​

%Cas profondeur maximale calcul du vecteur d'évaluation ou d'utilité si état terminal
alph_bet(0, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Nomcoureur, _, _, Vecteureval, _) :- ​

      esttourde(Nomcoureur,Numordre, Ordre,Prochaincoureur),trouveeval(Etatactuel,Vecteureval).


alph_bet(Profondeur, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre), Nomcoureur, Alpha, Beta, Vecteur, Action) :-​
  Profondeur > 0, ​

  Profondeur1 is Profondeur- 1,​

  actionposs(Nomcoureur, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Listeaction),
   ​
  alph_bet(Listeaction, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur1, Nomcoureur, Alpha, Beta, nil, Vecteur, Action).​

      ​
/* alphabeta(+Listeactionsposs,+Etatactuel,+Profondeur,+Coureurdontcestletour,+Vecteurcourant,+Actioncourante,-Meilleurvecteur,-Meilleuraction)
      Choisis la meilleure action depuis la liste Listeactionposs par rapport à l'état de jeu actuel
      en utilisant l'algorithme d'élagage alpha-beta en profondeur limitée
      Coureurdontcestletour indique le coureur dont c'est le tour (celui qui sélectionne le vecteur maximisant son utilité/évaluation (ici mininmisant voir Fonction d'évaluation))
      Actioncourante correspond à la "meilleure" action trouvée pour l'instant (dont le vecteur correspondant est Vecteurcourant) .*/

alphabeta([], _, _, _, Meilleurvecteur, Meilleuraction,  Meilleurvecteur, Meilleuraction).

alphabeta([Action|Actions],jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur,Nomcoureur, Vecteur0,Action0,Meilleurvecteur,Meilleuraction):-

  transition(jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Etatarrivee,estletourde(Nomcoureur,Ordre,Valtour,Prochaincoureur),Action), ​
  alph_bet(Profondeur, Etatarrivee, Prochaincoureur,Alpha,Beta, Vecteuraverifier, Actionprochaincoureur),

  Vecteur is Vecteuraverifier, calculsommevecteur(Vecteur,Sommevecteur),
  ( Sommevecteur >= Beta ->​
      alph_bet(Actions,jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur,Nomcoureur,Alpha,Beta,Action0,Meilleurvecteur,Meilleuraction)​
      ;   alph_bet(Actions,jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur,Nomcoureur,Alpha,Sommevecteur,Action ,Meilleurvecteur,Meilleuraction)
    ).​
