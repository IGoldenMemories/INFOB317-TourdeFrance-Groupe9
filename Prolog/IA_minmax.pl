%inclu tous les prédicats définis dans gamelogic.pl
:- consult(gamelogic).

%Une fonction de transition
%-------
%☞ Trans : S × A → S
%transition (état1, état2, action):- ok si ? selon action !!
%--> slide from 615->618 (exemples implémentation)

%Pour chaque action 1-> vérification pas dans Passetour
    %                2-> vérification dans passe tour et exécution de  miseajourpassetourdelete(Listepassetour,Coureur,Nouvlistepassetour)
transition(jeu(_,Passetour,Positions,Apasselignearrivee),jeu(),depassement(Nomcoureur,Coureurs,Valeurcarteseconde,Ordrephasedynamique,Ordrephasedynamique,_)):-
  peutdepasser(Nomcoureur,Valeurcarteseconde,Coureurs)
%miseàjourposition
transition(jeu(),jeu(),action(aspiration,Coureur))
transition(jeu(),jeu(),action(casechance,Coureur))
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
