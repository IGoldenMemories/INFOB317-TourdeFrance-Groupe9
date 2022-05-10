%inclu tous les prédicats définis dans gamelogic.pl
:- consult(gamelogic).

%utilisé par trouvermeilleureval pour la position dans le vecteur d'évaluation par rapport au coureur devant le choix



%Une fonction de transition
%-------
%☞ Trans : S × A → S
%transition (état1, état2, action):- ok si ? selon action !!
%--> slide from 615->618 (exemples implémentation)

%Pour chaque action 1-> vérification pas dans Passetour
    %                2-> vérification dans passe tour et exécution de  miseajourpassetourdelete(Listepassetour,Coureur,Nouvlistepassetour)
transition(jeu(_,Passetour,Positions,Faux,Listetas,Valtour,Ordre),jeu(_,Passetour,Resultatction,Faux,_,Nouvvaltour,Ordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  Valtour =\= 12, not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,jeu(_,Passetour,Positions,Faux,Listetas,_),Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition)), Nouvvaltour is Valtour +1.

transition(jeu(_,Passetour,Positions,Faux,Listetas,12,Ordre),jeu(_,Passetour,Resultatction,Faux,_,1,Nouvordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,jeu(_,Passetour,Positions,Faux,Listetas,_),Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition)), ordre(jeu(_,_,Resultatction,_,_),Phase, Nouvordre).


transition(jeu(_,Passetour,Positions,Faux,_,Valtour,Ordre),jeu(_,Passetour,Resultatction,Vrai_,Nouvvaltour,Ordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition)))

transition(jeu(_,Passetour,Positions,Faux,_,12,Ordre),jeu(_,Passetour,Resultatction,Vrai,_,1,Nouvordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Positions, Coureurs,Nouvposition))),, ordre(jeu(_,_,Resultatction,_,_),Phase, Nouvordre).


transition(jeu(Deckcartes,Passetour,Positions,Faux,_,Valtour,Ordre),jeu(_,Passetour,Resultatction,Faux,_,Nouvvaltour,Ordre),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase))


transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Passetour,Resultatction,Vrai,_,_),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase)),apasselignearrivee(Nomcoureur,Idnouvellecase)



%Cas où il y a une chute débutant là où le coureur arrive

transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

  %Remise à jour ordre
  transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).
  %Remise à jour ordre
transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
        not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

transition(jeu(_,_,Deckcartes,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs)
    ,chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).
  %Remise à jour ordre
transition(jeu(_,_,Deckcartes,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),
  chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte).

transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),
    chute(Positions, Coureurs,Nouvposition)),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte),apasselignearrivee(Nomcoureur,Idnouvellecase)
%Remise à jour ordre
transition(jeu(_,Passetour,Positions,Faux,_,_),jeu(_,Nouvlistepassetour,Resultatction,Vrai,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordre,Valtour,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
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
trouveeval(jeu(_,_,Positions,_,_,_,_), Listeeval):-
  findall(Valeureval, (coureurs(Coureurs), member(Nomcoureur,Coureurs), trouver_position(Nomcoureur,Positions, Idcase), numero(Idcase, Numcase), Valeureval is 95- Numcase), Listeeval).




%Un ensemble Act d’actions
%-----------
%☞ dépendant des joueurs(passetour,position,carte secondes en leur poSITION, tour
%et des configurations(repris dans état)
%☞ Actions : S × P → Act (où P ici signifie les Joueurs et Coureurs) --> sous-états?

actionposs(Nomcoureur, jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),Listeaction):-
  findall([jeu(Nouvdeck,Nouvpassetour,Nouvpositions,Nouvapasseligne,Nouvtascartes,Nouvnumordre,Nouvordre),Actionposs, Vectoreval], (transition(jeu(Deck,Passetour,Positions,Apasseligne,Tascartes,Numordre,Ordre),jeu(Nouvdeck,Nouvpassetour,Nouvpositions,Nouvapasseligne,Nouvtascartes,Nouvnumordre,Nouvordre),estletourde(Nomcoureur, Ordre, _),Actionposs), trouveeval(jeu(Nouvdeck,Nouvpassetour,Nouvpositions,Nouvapasseligne,Nouvtascartes,Nouvnumordre,Nouvordre), Vectoreval)).

% Sélection de l'action minimisant la valeur d'évaluation pour Nomcoureur dans les vecteurs d'évaluations de toutes ses actions possibles
trouvermeilleureeval(Nomcoureur,Listeaction, Actionchoisie ,Vectoraverif):-
  trouveridcoureur(Nomcoureur, Idcoureur), findall(Valposs, (member(X, Listaction), nth0(2, Vector, X), nth0(Idcoureur, Valposs, Vector)), Listvalposs), min_list(Listvalposs,Minimum),
   nth0(Y,Sousliste, Listeaction), nth0(2, Vectoraverif, Sousliste), nth0(Idcoureur, Minimum, Vectoraverif), nth0(1, Actionchoisie, Sousliste).



/* Différentes choses à implémenter/décider

  - Générer l’arbre du jeu jusqu’aux états terminaux
  - Déterminer l’utilité des états terminaux
  - Remonter l’arbre en appliquant alternativement min et max
  - évaluer La valeur au noeud racine (laquelle détermine le meilleur coup/la plus haute utilité)

--> Ceci peut se faire par une stratégie en profondeur d’abord.
*/

%Utiliser la fonction terminale (selon que tous les coureurs aient passé la ligne d'arrivée)


%Valeur utilité (si état est terminal) : A ECLAIRCIR
%   - +10 (temps total plus petit que celui de tous les autres) (gagné)
%   - +5 (égalité en temps total le plus petit (avec 1 joueur)) (gagné)?
%   - +2 (égalité  en temps total le plus petit (avec 2 joueurs)) (gagné)?
%   - +1 (égalité  en temps total le plus petit (avec 3 joueurs)) (gagné)?
%   - +0 (temps total plus petit qu'un autre (perdu))

%PAS VALEUR UNIQUE RETOURNée --> SOUS PREDICATS utiljoueur(Nomjoueur,ValeurUtilpouretatfinal)
%Util([Valeurutiljoueur1,Valeurutiljoueur2,Valeurutiljoueur3,Valeurutiljoueur4])
%tempstotal(Nomjoueur,Tempstotal) --> gagnant(cas où un seul gagnant)
%--> todo gagnant2, gagnant3 gagnant4
%gagnant(Nomjoueur)--> Nomjoueur Util(Nomjoueur,10)
%gagnant(Nomautrejoueur)--> Nomjoueur /== Nomautrejoueur Util(Nomjoueur,0)
%autre cas +5,+2,+1

%--> Relire le choix fait aux branches min max cas où plusieurs joueurs (dans slides)

%Définition de la profondeur maximale de recherche


%Calcul du coup optimal.
%minimax(Etat, P)  p-->Min ou Max:
%{ util(Etat, VAleurutil) si Etat est final --> finjeu(_,_,Coureurs)
%  trouver le max  parmi les MiniMax(Trans(s, a), non p) possible (p=MAX)  --> trouver le max selon Valeurutil dans util() recursif
%  trouver le min parmi les MiniMax(Trans(s, a), non p) (p=MIN)  --> trouver le min selon Valeurutil dans util() recursif
%}



minimax(Nomcoureur, Etatactuel, esttourde(Nomcoureur,Ordre, Nomprochaincoureur), Actionchoisie, 3):-
  coureurdejoueur(hollande,Listecoureur), member(Nomcoureur, Listecoureur), actionposs(Nomcoureur, Etatactuel,Listeaction), length(Listeaction, Taille) , Taille > 0, minimax( Nomprochaincoureur, Etatactuel,esttourde(Nomprochaincoureur,Ordre, Nomprochainprochaincoureurcoureur), Actionchoisie, Nouvprofondeur), Nouvprofondeur is 2.

minimax(Nomcoureur, Etatactuel, esttourde(Nomcoureur,Ordre, Nomprochaincoureur), Actionchoisie, Prof):-
     actionposs(Nomcoureur, Etatactuel,Listeaction), length(Listeaction, Taille) , Taille > 0, minimax( Nomprochaincoureur, Etatactuel,esttourde(Nomprochaincoureur,Ordre, Nomprochainprochaincoureurcoureur), Actionchoisie, Nouvprofondeur), Nouvprofondeur is Prof-1.


minimax(Nomcoureur, Etatactuel, esttourde(Nomcoureur,Ordre, Nomprochaincoureur), Actionchoisie,0):-
  trouveeval(Etatactuel,Vecteureval)
