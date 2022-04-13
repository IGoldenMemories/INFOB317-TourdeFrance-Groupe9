:- use_module(library(lists))

/*
------------------------------
-----------------------------
    Prédicats début
------------------------------
situation début/base de connaissance
---------------------
*/

deckcartes([1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,
5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,
10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12])

%joueur(nomjoueur, [valeurscartessecondes], [nomsjoueurs])

joueur(italie,_, [italie_1,italie_2,italie_3])
joueur(hollande,_, [hollande_1,hollande_2,hollande_3])
joueur(belgique,_, [belgique_1,belgique_2,belgique_3])
joueur(allemagne,_, [allemagne_1,allemagne_2,allemagne_3])

%Predicat déclaration de toutes cases possibles



%Prédicat pour pioche carte (début)--> mise à jour liste cartes secondes (joueur/globale)


/*
----------------------
  Détermination de l'ordre de la phase de début
----------------------
*/

%Obtention de la plus haute valeur des cartes secondes pour chaque joueur
maxchaquejoueur(Nomjoueur,Maxval):- joueur(Nomjoueur,Listjoueur,_),maxlist(Listjoueur,Maxval)

%Obtention deuxième plus haute valeur with delete)
secondmaxchaquejoueur(Nomjoueur, Plushauteval,Secondeplushauteval):- joueur(Nomjoueur,Listjoueur,_,_,_),delete(Listjoueur,Plushauteval,Nouvelleliste),maxlist(Nouvelleliste,Secondeplushauteval)

%Permet de trouver le joueur la plus haute parmi ceux de la liste récursivement
%(Quand leur carte la plus haute est la même, va chercher la seconde carte la plus haute et ainsi de suite)

%à terminer
maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-% if plushautevaluecom in liste joueur in list then --> search fornext highest value (prédicat secong highest with delete) compare those next value x >y
maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-% if plushautevaluecom in liste joueur in list then --> search fornext highest value (prédicat secong highest with delete) compare those next value x==y
maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-
maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-

maxentrejoueurs([J1,J2,J3], Plushautevalcom, Maxj):-
maxentrejoueurs([J1,J2,J3], Plushautevalcom, Maxj):-
maxentrejoueurs([J1,J2,J3], Plushautevalcom, Maxj):-

maxentrejoueurs([J1,J2], Plushautevalcommune, Maxj):-
maxentrejoueurs([J1,J2], Plushautevalcommune, Maxj):-

%-----Premier joueur -----
%cas où un et un seul joueur a la plus haute carte
maxtousjoueurs(Premierjoueur):- maxchaquejoueur(Premierjoueur,Plushauteval),maxchaquejoueur(Autrejoueur, Autreval),maxchaquejoueur(Autrejoueur1, Autreval1),maxchaquejoueur(Autrejoueur2, Autreval2), Plushauteval > Autreval, Plushauteval >  Autreval1, Plushauteval >  Autreval2
%cas où deux joueurs ont la plus haute carte en jeu
maxtousjoueurs(Premierjoueur):- maxchaquejoueur(Joueurpotentiel,Potentielleval),maxchaquejoueur(Joueurpotentiel1, Potentielleval1 ),maxchaquejoueur(Autrejoueur1,Autreval1),maxchaquejoueur(Autrejoueur2,Aurteval2), Potentielleval == Potentielleval1, Joueurpotentiel \== Joueurpotentiel1,Potentielleval > Autreval1, Potentielleval > Autreval2, maxentrejoueurs([Joueurpotentiel, Joueurpotentiel1], Potentielleval, Premierjoueur)
%cas où trois joueurs ont la plus haute carte en jeu
maxtousjoueurs(Premierjoueur):- maxchaquejoueur(Joueurpotentiel,Potentielleval),maxchaquejoueur(Joueurpotentiel1, Potentielleval1 ),maxchaquejoueur(Joueurpotentiel2,Potentielleval2),maxchaquejoueur(Autrejoueur1,Autreval1), Potentielleval == Potentielleval1, Potentielleval == Potentielleval2, Potentielleval > Autreval1, Joueurpotentiel \== Joueurpotentiel1,  Joueurpotentiel \== Joueurpotentiel2,  maxentrejoueurs([Joueurpotentiel, Joueurpotentiel1, Joueurpotentiel2],Potentielleval,Premierjoueur)
%cas où quatre joueurs ont la plus haute carte en jeu
maxtousjoueurs(Premierjoueur):- maxchaquejoueur(Joueurpotentiel,Potentielleval),maxchaquejoueur(Joueurpotentiel1, Potentielleval1 ),maxchaquejoueur(Joueurpotentiel2,Potentielleval2),maxchaquejoueur(Joueurpotentiel3,Potentielleval3), Potentielleval == Potentielleval1, Potentielleval == Potentielleval2, Potentielleval == Potentielleval3, Joueurpotentiel \== Joueurpotentiel1,  Joueurpotentiel \== Joueurpotentiel2,   Joueurpotentiel \== Joueurpotentiel3, maxentrejoueurs([Joueurpotentiel, Joueurpotentiel1,Joueurpotentiel2, Joueurpotentiel3],Potentielleval,Premierjoueur)

%----Second joueur -------
%cas où un et un seul joueur a la plus haute carte:
secondplace(Secondjoueur):- maxchaquejoueur(Secondjoueur,Plushauteval),maxchaquejoueur(Autrejoueur, Autreval ),maxchaquejoueur(Autrejoueur1,Autreval1),maxtousjoueur(Premierjoueur), Secondjoueur \== Premierjoueur, Plushauteval > Autreval,  Plushauteval  > Autreval1

%cas où deux joueurs ont plus hautes cartes:
secondplace(Secondjoueur):- maxchaquejoueur(Joueurpotentiel,Potentielleval),maxchaquejoueur(Joueurpotentiel1, Potentielleval1),maxchaquejoueur(Autrejoueur1,Autreval1),maxtousjoueur(Premierjoueur),  Potentielleval == Potentielleval1, Premierjoueur\== Joueurpotentiel,  Premierjoueur\== Joueurpotentiel1, Joueurpotentiel \== Joueurpotentiel1,Potentielleval > Autreval1, Potentielleval1 > Autreval1, maxentrejoueurs([Joueurpotentiel, Joueurpotentiel1], Potentielleval,Secondjoueur)

%cas où trois joueurs ont plus hautes cartes:
secondplace(Secondjoueur):- maxchaquejoueur(Joueurpotentiel,Potentielleval),maxchaquejoueur(Joueurpotentiel1, Potentielleval1),maxchaquejoueur(Joueurpotentiel2, Potentielleval2),
maxtousjoueur(Premierjoueur),  Potentielleval == Potentielleval1, Potentielleval == Potentielleval2, Premierjoueur\== Joueurpotentiel,  Premierjoueur\== Joueurpotentiel1,  Premierjoueur\== Joueurpotentiel2, Joueurpotentiel \== Joueurpotentiel1,  Joueurpotentiel \== Joueurpotentiel2, Joueurpotentiel1 \== Joueurpotentiel2,
 maxentrejoueurs([Joueurpotentiel, Joueurpotentiel1, Joueurpotentiel2], Potentielleval,Secondjoueur)


 %----Troisieme joueur -------
% cas où un et un seul joueur a la plus haute carte:
 troisiemeplace(Troisiemejoueur):- maxeachjoueur(Troisiemejoueur,Plushauteval),maxeachjoueur(Autreplayer, Autreval ),maxtousjoueur(Premierjoueur), secondplace(Secondjoueur), Troisiemejoueur \== Premierjoueur, Troisiemejoueur \== Secondjoueur, Plushauteval > Autreval

 %cas où les deux joueurs restants ont la même plus haute carte:
 troisiemeplace(Troisiemejoueur):- maxeachjoueur(Joueurpotentiel,Potentielleval),maxeachjoueur(Joueurpotentiel1, Potentielleval1),maxtousjoueur(Premierjoueur), secondplace(Secondjoueur), Potentielleval == Potentielleval1 ,Joueurpotentiel \== Premierjoueur,  Joueurpotentiel \==  Secondjoueur,  Joueurpotentiel \==  Joueurpotentiel1, maxentrejoueurs([Joueurpotentiel, Joueurpotentiel1], Potentielleval,Troisiemejoueur)

 %----Quatrieme joueur-------
 %joueur restant (pas premier , deuxième ni troisième):
 quatriemeplace(Quatriemejoueur):- joueur(Quatriemejoueur, _, _,_,_), maxtousjoueurs(Premierjoueur), secondplace(Secondjoueur),troisiemeplace(Troisiemejoueur), Quatriemejoueur \== Premierjoueur, Quatriemejoueur \== Secondjoueur, Quatriemejoueur \== Troisiemejoueur

 %----Ordre début ---------
% C1,C5,C9->  coureurs du premier joueur de la phase de début
% C2,C6,C10-> coureurs du second joueur de la phase de début
% C3,C7,C11-> coureurs du troisième joueur de la phase de début
% C4,C8,C12-> coureurs du quatrième joueur de la phase de début

 ordreddebut([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12]):- maxtousjoueurs(Premierjoueur), secondplace(Secondjoueur),troisiemeplace(Troisiemejoueur), quatriemeplace(Quatriemejoueur),
 joueur(Premierjoueur,_,[C1,C5,C9],_,_),joueur(Secondjoueur,_,[C2,C6,C10],_,_),joueur(Troisiemejoueur,_,[C3,C7,C11],_,_),joueur(Quatriemejoueur,_,[C4,C8,C12],_,_)

 /*
 -----------------------------------
 -----------------------------------
     Définition d'un état de jeu
 -----------------------------------
 */

%représentation du tas de cartes
%Position de chaque coureur
%un coureur a passé la ligne d'arrivée ? (pour le calcul du temps total)





 /*
 -----------------------------
 -----------------------------
     Prédicats gagnant
 -----------------------------
 */

%------- Calcul du temps de chacun des coureurs ---------
% tempspartiel(Nomcoureur, Tempspartiel
%BESOIN DE PRECISER POSITION APRES LIGNE ARRIVEE
tempspartiel(Nomcoureur,Tempspartiel):-position(Nomcoureur, Case), Tempspartiel is 95-%valeur venant de POSITION

%Vérifie si un coureur a passé sa ligne d'arrivée --> utilisée pour le calcul du temps total +10 après chaque toour (dés qu'un coureur a passé la ligne d'arrivée)
apasselignearrivee(Nomcoureur):-position(Nomcoureur, Case), % Condition sur le numéro de case (??? ligne d'arrivée ==?)

%Obtention du temps total d'un joueur
tempstotal(Nomjoueur, Tempstotal):-joueur(Nomjoueur, _, [C1,C2,C3]), Tempspartiel(C1,T1), Tempspartiel(C2,T2),Tempspartiel(C3,T3), Tempstotal is T1+T2+T3

% ------- Définition du gagnant de la partie --------
gagnant(Gagnant):-tempstotal(Gagnant, Tempsmin), tempstotal(Perdant, Temps), tempstotal(Perdant1, Temps1), tempstotal(Perdant2, Temps2), Tempsmin<Temps, Tempsmin<Temps1,Tempsmin<Temps2
%Comment gérer cas où deux ont même tempstotal (2 gagnants??)

/*
-----------------------------
-----------------------------
    Fonction terminale
(vérifie si le jeu est terminé)
-----------------------------
*/
%Par rapport à la position de chaque coureur (ont-ils tous passé la ligne d'arrivée ?)
% Si  oui, alors ce prédicat est vrai et la ^partie est finie (vérification gagnant et affichage écran fin)



/*
-----------------------------
-----------------------------
    ACTIONS
-----------------------------
*/

%---------- Aspiration ----------------
%Condition pour qu'un coureur puisse utiliser le phénomène d'Aspiration

%Un coureur se trouve JUSTE DERRIERE et possibilité d'arriver DERRIERE un autre coureur en utilisant la valeur de la carte seconde +1
%Un coureur se trouve JUSTE DERRIERE et possibilité d'arriver DERRIERE un autre coureur en utilisant la valeur de la carte seconde +1


%Un coureur se trouve JUSTE à CÔté et possibilité d'arriver à CÔté d'un autre coureur en utilisant la valeur de la carte seconde +1

%Un coureur se trouve JUSTE à CÔté  et possibilité d'arriver à CÔté d'un autre coureur en utilisant la valeur de la carte seconde +1
