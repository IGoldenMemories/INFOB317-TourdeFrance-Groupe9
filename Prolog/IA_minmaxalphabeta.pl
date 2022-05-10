:- consult(gamelogic).
:- consult(ia_minmax).
:- use_module(library(lists)).

calculsommevecteur(Vecteur,Somme):-
  sum_list(Vecteur, Somme).


/* alphabeta(+Listeactionsposs,+Etatactuel,+Profondeur,+Coureurdontcestletour,+Vecteurcourant,+Actioncourante,-Meilleurvecteur,-Meilleuraction)
      Choisis la meilleure action depuis la liste Listeactionposs par rapport à l'état de jeu actuel
      en utilisant l'algorithme d'élagage alpha-beta
      Coureurdontcestletour indique le coureur dont c'est le tour (celui qui sélectionne le vecteur maximisant son utilité/évaluation (ici mininmisant voir Fonction d'évaluation))
      Actioncourante correspond à la "meilleure" action trouvée pour l'instant (dont le vecteur correspondant est Vecteurcourant .*/

alphabeta([], _, _, _, Meilleurvecteur, Meilleuraction,  Meilleurvecteur, Meilleuraction).

alphabeta([Action|Actions],jeu(_,_,_,_,_,_,Ordre),Profondeur,Nomcoureur, Vecteur0,Action0,Meilleurvecteur,Meilleuraction):-
      transition(jeu(_,_,_,_,_,_,Ordre),jeu(_,_,_,_,_,_,Nouvordre),esttourde(Nomcoureur,Nouvordre,Prochaincoureur),Action),
      minimax(Profondeur, jeu(_,_,_,_,_,_,Nouvordre),Prochaincoureur, Vecteurprochaincoureur,Actionprochaincoureur),
      Vecteur is Vecteurprochaincoureur, calculsommevecteur(Vecteur,Sommevecteur), calculsommevecteur(Vecteur0,Sommevecteur0),
      %Calcul somme des valeurs eval à faire ici + eval < alors ok , > alors dropp
      ( Sommevecteur < Sommevecteur0 ->
        alphabeta(Actions,jeu(_,_,_,_,_,_,Ordre),Profondeur,Nomcoureur, Vecteur ,Action,Meilleurvecteur,Meilleuraction).
      ; alphabeta(Actions,jeu(_,_,_,_,_,_,Ordre),Profondeur,Nomcoureur,Vecteur0,Action0,Meilleurvecteur,Meilleuraction).
      ).
