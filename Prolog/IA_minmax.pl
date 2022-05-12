%inclu tous les prédicats définis dans gamelogic.pl
:- consult(gamelogic).
:- use_module(library(lists)).
%utilisé par trouvermeilleureval pour la position dans le vecteur d'évaluation par rapport au coureur devant le choix



%Une fonction de transition
%-------
%☞ Trans : S × A → S
%transition (état1, état2, action):- ok si ? selon action !!
%--> slide from 615->618 (exemples implémentation)

%Pour chaque action 1-> vérification pas dans Passetour
    %                2-> vérification dans passe tour et exécution de  miseajourpassetourdelete(Listepassetour,Coureur,Nouvlistepassetour)
transition(jeu(_,Passetour,Positions,Faux,Listetas,Valtour,Ordre),jeu(_,Passetour,Resultatction,Faux,_,Nouvvaltour,Ordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
  Valtour =\= 12, not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,jeu(_,Passetour,Positions,Faux,Listetas,_),Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition)), Nouvvaltour is Valtour +1.

transition(jeu(_,Passetour,Positions,Faux,Listetas,12,Ordre),jeu(_,Passetour,Resultatction,Faux,_,1,Nouvordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,jeu(_,Passetour,Positions,Faux,Listetas,_),Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition)), ordre(jeu(_,_,Resultatction,_,_),Phase, Nouvordre).


transition(jeu(_,Passetour,Positions,Faux,_,Valtour,Ordre),jeu(_,Passetour,Resultatction,Vrai_,Nouvvaltour,Ordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition)))

transition(jeu(_,Passetour,Positions,Faux,_,12,Ordre),jeu(_,Passetour,Resultatction,Vrai,_,1,Nouvordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition))),, ordre(jeu(_,_,Resultatction,_,_),Phase, Nouvordre).


transition(jeu(Deckcartes,Passetour,Positions,Faux,_,Valtour,Ordre),jeu(_,Passetour,Resultatction,Faux,_,Nouvvaltour,Ordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase))


transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Passetour,Resultatction,Vrai,_,_),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase)),apasselignearrivee(Nomcoureur,Idnouvellecase)



%Cas où il y a une chute débutant là où le coureur arrive

transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

  %Remise à jour ordre
  transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).
  %Remise à jour ordre
transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
        not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

transition(jeu(_,_,Deckcartes,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs)
    ,chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).
  %Remise à jour ordre
transition(jeu(_,_,Deckcartes,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),
  chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),
    chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte),apasselignearrivee(Nomcoureur,Idnouvellecase)
%Remise à jour ordre
transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Positions, Valeurcarteseconde,Nouvposition)):-
        not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),
        chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte),apasselignearrivee(Nomcoureur,Idnouvellecase)
    %Remise à jour ordre,apasselignearrivee(Nomcoureur,Idnouvellecase)


%Cas où dans Passetour
transition(jeu(_,_,_,Passetour,_,_),jeu(_,_,_,Nouvellepassetour,_,_),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,_,_,_)):-
    member(Nomcoureur,Passetour),miseajourpassetourdelete(Passetour,Nomcoureur,Nouvellepassetour)
%Remise à jour ordre
transition(jeu(_,_,_,Passetour,_,_),jeu(_,_,_,Nouvellepassetour,_,_),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,_,_,_)):-
    member(Nomcoureur,Passetour),miseajourpassetourdelete(Passetour,Nomcoureur,Nouvellepassetour)


%miseàjourposition
transition(jeu(_,_,),jeu(_,_,),action(aspiration,Coureur)):-

transition(jeu(_,_,),jeu(_,_,),action(mouvementlibre,Coureur))



%Fonction d'évaluation
%idée (minimiser le temps total (condition pour gagner))
%-------------------------------------
%choisir action qui permet:
%   - d'arriver le plus vite à la ligne d'arrivée
%   - de minimiser la distance entre le coureur (de qui c'est le tour) et la ligne d'arrivée)
%ou si état est final (calcul de son utilité)
%---------------------------------------------------------------------
trouveeval(jeu(_,_,Positions,_,_,_,_,Listetemps), Vecteurresultateval):-
  finjeu(Positions), util(Listetemps, Vecteurresultateval).

trouveeval(jeu(_,_,Positions,_,_,_,_,Listetemps), Vecteurresultateval):-
  findall(Valeureval, (coureurs(Coureurs), member(Nomcoureur,Coureurs), trouver_position(Nomcoureur,Positions, Idcase), numero(Idcase, Numcase), Valeureval is 95- Numcase), Listeeval), append(Listeeval,[eval],Vecteurresultateval).




%Un ensemble Act d’actions
%-----------
%☞ dépendant des joueurs(passetour,position,carte secondes en leur poSITION, tour
%et des configurations(repris dans état)
%☞ Actions : S × P → Act (où P ici signifie les Joueurs et Coureurs) --> sous-états?

actionposs(Nomcoureur, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Listeaction):-
  findall(Actionposs,(transition(jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),jeu(Nouvdeck,Nouvpassetour,Nouvpositions,Nouvapasseligne,Nouvtascartes,Nouvnumordre,Nouvordre),estletourde(Nomcoureur, Ordre,Numordre, _),Actionposs)),Listeaction).


/* Différentes choses à implémenter/décider

  - Générer l’arbre du jeu jusqu’aux états terminaux
  - Déterminer l’utilité des états terminaux
  - Remonter l’arbre en appliquant alternativement min et max
  - évaluer La valeur au noeud racine (laquelle détermine le meilleur coup/la plus haute utilité)

--> Ceci peut se faire par une stratégie en profondeur d’abord.
*/

%Utiliser la fonction terminale (selon que tous les coureurs aient passé la ligne d'arrivée)


%Valeur utilité (si état est terminal) :
%   - +10 (temps total plus petit que celui de tous les autres) (gagné)
%   - +5 (égalité en temps total le plus petit (avec 1 joueur)) (gagné)?
%   - +2 (égalité  en temps total le plus petit (avec 2 joueurs)) (gagné)?
%   - +1 (égalité  en temps total le plus petit (avec 3 joueurs)) (gagné)?
%   - +0 (temps total plus petit qu'un autre (perdu))


%Util(Etat+,[Valeurutiljoueur1,Valeurutiljoueur2,Valeurutiljoueur3,Valeurutiljoueur4])

util( jeu(_,_,_,_,_,_,_,Listetemps),[10,10,10,0,0,0,0,0,0,0,0,0,util]):-
  gagnant(Listetemps,italie).
util(jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,10,10,10,0,0,0,0,0,0,util]):-
  gagnant(Listetemps,hollande).
util(jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,0,0,0,10,10,10,0,0,0,util]):-
  gagnant(Listetemps,belgique).
util(jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,0,0,0,0,0,0,10,10,10,util]):-
  gagnant(Listetemps,allemagne).
%joueur 2 et 1 with smallest time (revoir predicat dans gamelogic )
util( jeu(_,_,_,_,_,_,_,Listetemps),[5,5,5,5,5,5,0,0,0,0,0,0,util]):-
  deuxgagnant(Listetemps,italie,hollande).
util( jeu(_,_,_,_,_,_,_,Listetemps),[5,5,5,0,0,0,5,5,5,0,0,0,util]):-
  deuxgagnant(Listetemps,italie,belgique).
util(jeu(_,_,_,_,_,_,_,Listetemps),[5,5,5,0,0,0,0,0,0,5,5,5,util]):-
  deuxgagnant(Listetemps,italie,allemagne).
util(jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,5,5,5,5,5,5,0,0,0,util]):-
  deuxgagnant(Listetemps,hollande,belgique).
util( jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,0,0,0,5,5,5,5,5,5,util]):-
  deuxgagnant(Listetemps,belgique,allemagne).
util( jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,5,5,5,0,0,0,5,5,5,util]):-
    deuxgagnant(Listetemps,hollande,allemagne)
%joueur 1 2 3 with smallest time
util(jeu(_,_,_,_,_,_,_,Listetemps),[2,2,2,2,2,2,2,2,2,0,0,0,util]):-
  troisgagnant(Listetemps,italie,hollande,belgique).
util(jeu(_,_,_,_,_,_,_,Listetemps),[2,2,2,0,0,0,2,2,2,2,2,2,util]):-
  troisgagnant(Listetemps,italie,belgique,allemagne).
util(jeu(_,_,_,_,_,_,_,Listetemps),[0,0,0,2,2,2,2,2,2,2,2,2,util]):-
  troisgagnant(Listetemps,hollande,belgique,allemagne).
util(jeu(_,_,_,_,_,_,_,Listetemps),[2,2,2,2,2,2,0,0,0,2,2,2,util]):-
  troisgagnant(Listetemps,italie,hollande,allemagne).


% joueurs 1 2 3 4 avec même temps total (match nul)
util(jeu(_,_,_,_,_,_,_,Listetemps),[1,1,1,1,1,1,1,1,1,1,1,1,util]):-
  quatregagnant(Listetemps,italie,hollande,belgique,allemagne).




%Calcul du coup optimal.
%minimax(Etat, Actionchoisie, Profondeur)

minimax(jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Actionchoisie,Profondeur):-
  esttourde(Nomcoureur,Numordre, Ordre,_), coureurdejoueur(hollande,Listecoureurhollande), member(Nomcoureur,Listecoureurhollande),minimax(Profondeur,jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Nomcoureur, _, Actionchoisie).

%Définition de l'algorithme minimax (récursif)
%minimax(+Profondeur, +Etatactuel, +Coureurdontcestletour, -Meilleurvecteur, -Meilleuraction)
%Cas "le plus profond récursivement" calcul du vecteur d'évaluation où d'utilité si l'état actuel est terminal
minimax(0, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Nomcoureur,Vecteureval ,_):-
  esttourde(Nomcoureur,Numordre, Ordre,Prochaincoureur),trouveeval(Etatactuel,Vecteureval).
%Cas récursif
minimax(Profondeur,jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Nomcoureur,Vecteur, Actionchoisie):-
  Profondeur>0, Profondeur1 is Profondeur - 1,​esttourde(Nomcoureur,Numordre, Ordre,Prochaincoureur),actionposs(Nomcoureur, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Listeaction), length(Listeaction, Taille) , Taille > 0,
   minimax(Listeaction, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre), Profondeur1, Nomcoureur, [95,95,95,95,95,95,95,95,95,95,95,95], nil,Vecteur, Actionchoisie).​

/* minimax(+Actions,+Etatactuel,+Profondeur,+Coureurdontcestletour,+Vecteur0,+Action0,-Meilleurvecteur,-Meilleuraction)​

  Choisit le meilleur mouvement de la liste Actions de l'état actuel​
  Action0 enregistre la meilleur action trouvée jusqu'à maintenant et son vecteur correspondant
   */

minimax([], _, _, _, Vecteur, Meilleuraction,  Vecteur, Meilleuraction).
minimax([Actionposs|Actionsposs],jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur,Coureur, Vecteur0,Action0,Meilleurvecteur,Meilleuraction):-​

      transition(jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Etatarrivee,estletourde(Nomcoureur,Ordre,Valtour,Prochaincoureur),Actionposs), ​


      minimax(Profondeur, Etatarrivee, Prochaincoureur,Vecteurprochaincoureur,Actionprochaincoureur), ​

      trouveridcoureur(Nomcoureur, Idcoureur), nth0(Idcoureur,Valeur1,Vecteurprochaincoureur), nth0(Idcoureur,Valeur2,Vecteur0),
      ( Valeur1< Valeur2 ->        ​

        minimax(Actionsposs,jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur,Nomcoureur, Vecteur ,Action ,Meilleurvecteur,Meilleuraction).​

      ; minimax(Actionsposs,jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Profondeur,Nomcoureur, Vecteur0,Action0,Meilleurvecteur,Meilleuraction).​

      ). ​
