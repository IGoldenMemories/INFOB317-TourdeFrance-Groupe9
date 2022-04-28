%inclu tous les prédicats définis dans gamelogic.pl
:- consult(gamelogic).

%Une fonction de transition
%-------
%☞ Trans : S × A → S
%transition (état1, état2, action):- ok si ? selon action !!
%--> slide from 615->618 (exemples implémentation)

%Pour chaque action 1-> vérification pas dans Passetour
    %                2-> vérification dans passe tour et exécution de  miseajourpassetourdelete(Listepassetour,Coureur,Nouvlistepassetour)
transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Faux),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Vrai),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Faux),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Vrai),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(Deckcartes,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Faux),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Vrai),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase)),apasselignearrivee(Nomcoureur,Idnouvellecase)

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,Resultatction,Faux),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase))


transition(jeu(_,Passetour,Positions,Faux),jeu(_,Passetour,,Resultatction,Vrai),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase)),apasselignearrivee(Nomcoureur,Idnouvellecase)

%Cas où il y a une chute débutant là où le coureur arrive

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs), not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),chute(Coureurs,Nouvposition),  lieudechute(Nouvposition,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseouchute, Positions, Passetour,Listepassetour), miseajourpassetourinsert(Passetour,Coureurs,Nouvlistepassetour),defaussecarte(Deckcartes,Nomjoueur,Carte)

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Vrai),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Vrai),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),not(casechance(NouvPos)),miseajourpositioncoureur(Nomcoureur,Nouvposition,Positions,Resultatction),apasselignearrivee(Nomcoureur,NouvPos),coureurs(Coureurs),not(chute(Coureurs,Nouvposition))

transition(jeu(Deckcartes,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase))

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Vrai),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase)),apasselignearrivee(Nomcoureur,Idnouvellecase)

transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Faux),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
    not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase))


transition(jeu(_,Passetour,Positions,Faux),jeu(_,Nouvlistepassetour,Resultatction,Vrai),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,Valeurcarteseconde,_,Nouvposition)):-
  not(member(Nomcoureur,Passetour)),peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs),casechance(NouvPos),random_between(-3, 3, Valmouvement),traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase),miseajourpositioncoureur(Nomcoureur,Idnouvellecase,Positions,Resultatction),coureurs(Coureurs),not(chute(Coureurs,Idnouvellecase)),apasselignearrivee(Nomcoureur,Idnouvellecase)


%Cas où dans Passetour
transition(jeu(_,Passetour,_,_),jeu(_,Nouvellepassetour,_,_),ordrephasedebut(Ordrephasedebut),estletourde(Nomcoureur,Ordrephasedebut,_),depassement(Nomcoureur,_,_,_)):-
    member(Nomcoureur,Passetour),miseajourpassetourdelete(Passetour,Nomcoureur,Nouvellepassetour)

transition(jeu(_,Passetour,_,_),jeu(_,Nouvellepassetour,_,_),ordrephasedynamique(Ordrephasedynamique),estletourde(Nomcoureur,Ordrephasedynamique,_),depassement(Nomcoureur,_,_,_)):-
    member(Nomcoureur,Passetour),miseajourpassetourdelete(Passetour,Nomcoureur,Nouvellepassetour)


%miseàjourposition
transition(jeu(),jeu(),action(aspiration,Coureur)):-

transition(jeu(),jeu(),action(mouvementlibre,Coureur))


%Un ensemble Act d’actions
%-----------
%☞ dépendant des joueurs(passetour,position,carte secondes en leur poSITION, tour
%et des configurations(repris dans état)
%☞ Actions : S × P → Act (où P ici signifie les Joueurs et Coureurs) --> sous-états?



/* Différentes choses à implémenter/décider

  - Générer l’arbre du jeu jusqu’aux états terminaux
  - Déterminer l’utilité des états terminaux
  - Remonter l’arbre en appliquant alternativement min et max
  - évaluer La valeur au noeud racine (laquelle détermine le meilleur coup/la plus haute utilité)

--> Ceci peut se faire par une stratégie en profondeur d’abord.
*/

%Utiliser la fonction terminale (selon que tous les coureurs aient passé la ligne d'arrivée)

%Fonction d'évaluation
%idée (minimiser le temps total (condition pour gagner))
%-------------------------------------
%choisir action qui permet:
%   - d'arriver le plus vite à la ligne d'arrivée
%   - de minimiser la distance entre le coureur (de qui c'est le tour) et la ligne d'arrivée)
%ou si état est final (calcul de son utilité)
%---------------------------------------------------------------------


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
%{ util(Etat, VAleurutil) si Etat est final --> finjeu(Coureurs)
%  trouver le max  parmi les MiniMax(Trans(s, a), non p) possible (p=MAX)  --> trouver le max selon Valeurutil dans util() recursif
%  trouver le min parmi les MiniMax(Trans(s, a), non p) (p=MIN)  --> trouver le min selon Valeurutil dans util() recursif
%}

%----------------------------
% MAX va choisir la branche qui maximise "son" utilité
%max()
