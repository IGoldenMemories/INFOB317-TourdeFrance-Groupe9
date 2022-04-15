:- use_module(library(lists))

/*
------------------------------
-----------------------------
    Prédicats début
------------------------------
situation début/base de connaissance
---------------------
*/

%joueur(nomjoueur, [valeurscartessecondes], [nomsjoueurs])

joueur(italie,_, [italie_1,italie_2,italie_3])
joueur(hollande,_, [hollande_1,hollande_2,hollande_3])
joueur(belgique,_, [belgique_1,belgique_2,belgique_3])
joueur(allemagne,_, [allemagne_1,allemagne_2,allemagne_3])

%Predicat déclaration de toutes cases possibles
%case sans lettre en largeur ou pas
case(Idcase):-numero(Idcase,Numero), position(Idcase,Positionlargeur)
%case chance
case(Idcase):-numero(Idcase,Numero), position(Idcase,Positionlargeur),casechance(Idcase)
%case avec lettre
case(Idcase):-numero(Idcase,Numero), lettre(Idcase,Lettre)
case(Idcase):-numero(Idcase,Numero), lettre(Idcase,Lettre),estcouloir(Idcase)
%case chance
case(Idcase):-numero(Idcase,Numero), lettre(Idcase,Lettre),casechance(Idcase)
case(Idcase):-numero(Idcase,Numero), lettre(Idcase,Lettre),casechance(Idcase),estcouloir(Idcase)

%case se situant après la ligne d'arrivée
case(Idcase):- numero(Idcase,Numero),position(Idcase,Positionlargeur),apresarrivee(Idcase)


%1ère ligne après ligne départ
%numero(U-->1èrecase)
%position(U-->1èrecase,1-->le plus à gauche)
%position(U2-->1èrecase,2-->au milieu)
%position(U3-->1èrecase,3-->le plus à droite)
numero(u,1)
position(u,1)
numero(u2,1)
position(u2,2)
numero(u3,1)
position(u3,3)

%Exemple pour les lettres et case chance
numero(n,9)
lettre(n,a)
casechance(n)
numero(nb,9)
lettre(nb,b)
numero(nc,9)
lettre(nc,c)

%Exemple 1er couloir parallèle avec lettre
numero(vsi,26)
lettre(vsi,a)
casechance(vsi)
numero(vsib,26)
lettre(vsib,b)
% !! D avant C dans la progression sur plateau !!
%exemple dans couloir
numero(vsic,26)
lettre(vsic,c)
estcouloir(vsic)
numero(vsid,26)
lettre(vsid,d)
estcouloir(vsid)

%Exemple 1er couloir parallèle avec numero/position
numero(vh,28)
position(vh,1)
casechance(vh)
numero(vh2,28)
position(vh2,2)
%Pour position située dans 1er coulior position (_,4)
numero(vh4,28)
position(vh4,4)

%Exemple 2ème couloir parallèle avec lettre
numero(no,90)
lettre(no,a)

%Pour position située dans 2ème couloir avec lettre
%!! C avant B dans ordre progression !!
numero(nob,90)
lettre(nob,b)
estcouloir(nob)
numero(noc,90)
lettre(noc,c)
casechance(noc)
estcouloir(noc)

%Exemple 2ème couloir parallèle avec numero/position
numero(nu,91)
position(nu,1)
% Pour position dans couloir (position(_,3))
numero(nu3,91)
position(nu3,3)

%Exemple après ligne arrivée
%sur ligne (0)
numero(p,0)
position(p,1)
apresarrivee(p)
numero(p2,0)
position(p2,2)
apresarrivee(p2)
numero(p3,0)
position(p3,3)
apresarrivee(p3)

%Fin plushaute
numero(pn,9)
position(pn,9)
apresarrivee(pn)
numero(pn2,9)
position(pn2,2)
apresarrivee(pn2)
numero(pn3,9)
position(pn3,3)
apresarrivee(pn3)






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

%représentation du tas de cartes (liste), représentation liste carte secondes de chaque joueur,
%Liste des coureurs devant passé leur tour
%Position de chaque coureur
%un coureur a passé la ligne d'arrivée ? (pour le calcul du temps total)
%autre chose (variable,...) succeptible d'être modifié par une action du joueur (une répercussion de celles-ci)

%état initial
jeu([1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,
5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,
10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12], [],[],[],[], [], [depart,depart,depart,depart,depart,depart,depart,depart,depart,depart,depart,depart], faux)

%état final
jeu(_, _,_,_,_,_, [arrivee,arrivee,arrivee,arrivee,arrivee,arrivee,arrivee,arrivee,arrivee,arrivee,arrivee,arrivee], vrai)




/*
-----------------------------------
-----------------------------------
      Prédicats chute
-----------------------------------
*/

passesontour(nomcoureur,1):- coureur(nomcoureur,_,_,1,_,_).
passesontour(nomcoureur,0):- coureur(nomcoureur,_,_,0,_,_).

passetour([]).
passetour([nomcoureur|listecoureurs]):- coureursentrainedanschute(caseschute,coureurschute),member(nomcoureur,coureurschute),passesontour(nomcoureur,1).


chute([nomcoureur|coureurs],coureurs2):- position(nomcoureur,case1), foreach(member(coureur, coureurs2),(position(coureur,case2),nomcoureur/==coureur, case1==case2)), chute(coureurs,coureurs2).





enleverpremierecarte(L,0,L,_c).
enleverpremierecarte([c|cartes],X,cartessecondes,c) :-
   X>0,
   X0 is X-1,
   enleverpremierecarte(cartes,X0,cartessecondes,c).

enlevercartes([c|cartes],X,cartessecondes):- enleverpremierecarte([c|cartes],X,cartessecondes,c).

defausseXcartes(nomjoueur,X,nouvcartessecondes):- joueur(nomjoueur,cartessecondes,_,_,_), length(cartessecondes,L), X <= L, enlevercartes(cartessecondes,X,nouvcartessecondes),joueur(nomjoueur,nouvcartessecondes,_,_,_).

%Multijoueurs

defausseXcartes(joueurschute,X,nouvcartessecondes):- foreach(member(nomjoueur,joueurschute),(joueur(nomjoueur,cartessecondes,_,_,_), length(cartessecondes,L), X <= L, enlevercartes(cartessecondes,X,nouvcartessecondes),joueur(nomjoueur,nouvcartessecondes,_,_,_))).


defaussecarte(nomjoueur,carte,nouvcartessecondes,cartessecondesrestantes):- joueur(nomjoueur,cartessecondes,_,_,_), member(carte,cartessecondes), delete(cartessecondes,carte,nouvcartessecondes),jeu(_,_,joueur(nomjoueur,_,_,_,_),_,deckcartes,_,_),insert(deckcartes,carte,cartessecondesrestantes),miseajourcartessecondesliste(nomjoueur,cartessecondesrestantes),miseajourcartessecondesjoueur(nomjoueur,nouvcartessecondes).

defausseXcarte(nomjoueur,[carte|cartes],nouvcartessecondes,cartessecondesrestantes):- joueur(nomjoueur,cartessecondes,_,_,_), member(carte,cartessecondes), length(cartes,X), length(cartessecondes,L),X+1<= L, delete(cartessecondes,carte,nouvcartessecondes),jeu(_,_,joueur(nomjoueur,_,_,_,_),_,deckcartes,_,_),insert(deckcartes,carte,cartessecondesrestantes),miseajourcartessecondesliste(nomjoueur,cartessecondesrestantes), miseajourcartessecondesjoueur(nomjoueur,nouvcartessecondes),
defausseXcarte(nomjoueur,cartes,nouvcartessecondes).




insert(X, [], [X]).
insert(X, [Y | listeelements], [X,Y | listeelements]) :- X @< Y, !.
insert(X, [Y | liste1], [Y | liste2]) :- insert(X, liste1, liste2).

repiocher5cartes(nomjoueur,cartessecondes,[],nouvellescartessecondes,cartessecondesrestantes):- miseajourcartessecondesjoueur(nomjoueur,nouvellescartessecondes,_),miseajourcartessecondesliste(cartessecondesrestantes).
repiocher5cartes(nomjoueur,cartessecondes,[carte|carteschoisies],nouvellescartessecondes,cartessecondesrestantes):- jeu(_,_,joueur(nomjoueur,_,_,_,_),_,deckcartes,_,_), member(carte,deckcartes), delete(deckcartes,carte,cartessecondesrestantes), insert(cartessecondes,carte,nouvellescartessecondes), repiocher5cartes(nomjoueur,cartessecondes,carteschoisies,ncartessec,cartessecrestantes).


miseajourcartessecondesliste(nomjoueur,cartessecondesrestantes):- jeu(_,_,joueur(nomjoueur,_,_,_,_),_,cartessecondesrestantes,_,_).

miseajourcartessecondesjoueur(nomjoueur,nouvcartessecondes):- joueur(nomjoueur,nouvcartessecondes,_,_,_),length(nouvcartessecondes,L), L>0.
miseajourcartessecondesjoueur(nomjoueur,nouvcartessecondes):- joueur(nomjoueur,nouvcartessecondes,_,_,_), length(nouvcartessecondes,L), L==0, repiocher5cartes(nomjoueur,nouvcartessecondes,carteschoisies,nouvellescartessecondes).


%Pour chaque case, s'il s'agit d'un lieu de chute, on cherche le numéro de la case, grâce à un numéro, on apprend le nom du coureur dessus, qui est ajouté à la liste des coureurs dans la chute.

coureursentrainedanschute(caseschute,coureurschute):- foreach(member(case,caseschute),(lieudechute(case,caseschute),estcase(case,numero),caseaveclettre(case,lettre),number_string(numero,num),string_concat(num,".",num1),string_concat(num1,lettre,n),position(nomcoureur,n),append(nomcoureur,coureurschute,coureurschute))).


%Pour chaque coureur dans la chute, on cherche à quel joueur il appartient en vérifiant dans la liste des coureurs de chaque joueur. S'il y est et que le joueur n'est pas encore dans la liste des joueurs impactés, il est ajouté.

joueursentrainedanschute([],joueurschute).
joueursentrainedanschute([nomcoureur|coureurschute],joueurs,joueurschute):- foreach(member(nomjoueur,joueurs),(joueur(nomjoueur,_, nomscoureurs,_,_),member(nomcoureur,nomscoureurs),nonmember(nomjoueur,joueurschute), append(nomjoueur,joueurschute,joueurschute))), joueursentrainedanschute(coureurschute,joueurschute).







% Pour qu'il s'agisse d'un lieu de chute, il faut qu'il y ait une chute. Pour les deux cases, on cherche à obtenir leurs numéros. S'ils sont égaux, les cases sont dans la même largeur.


  % lieudechute([case1,case2|caseschute]):- chute(coureurs,coureurs), estcase(case1,numero1), estcase(case2,numero2), numero1==numero2, lieudechute(caseschute).

lieudechute([_|[]],caseschute2):- chute(coureurs,coureurs).

lieudechute([case1|caseschute],caseschute2):-chute(coureurs,coureurs),estcase(case1,numero1),foreach(member(case2, caseschute2), (estcase(case2,numero2), case1/==case2, numero1==numero2)),lieudechute(caseschute,caseschute2).


% Ordre chute

ordrechuteli([]).
ordrechute([nomcoureur|ordrephasedynamique],caseschute,ordrechuteli,ordrechuteliste):- position(nomcoureur,case),lieudechute(case,caseschute),insert(nomcoureur,ordrechuteli,ordrechuteliste),ordrechute(ordrephasedynamique,caseschute,ordrechuteliste,ordrechutelist).


% Gros prédicat chute en série

chuteenserie(coureurs,ordrephasedynamique,caseschute,ordrechuteli,joueurs,cartes,nouvcartessecondes,cartessecondesrestantes):- chute(coureurs,coureurs),ordrechute(ordrephasedynamique,caseschute,ordrechuteli,ordrechuteliste), passetour(ordrechuteliste),joueursentrainedanschute(ordrechuteliste,joueurs,joueurschute),foreach(member(nomjoueur,joueurschute),defausseXcarte(nomjoueur,cartes,nouvcartessecondes,cartessecondesrestantes)).


% Dépassement

estletourde(nomcoureur,ordrephasedynamique,prochaincoureur):- nth0(index,ordrephasedynamique,nomcoureur),i=index+1,nth0(i,ordrephasedynamique,prochaincoureur).

miseajourpositioncoureur(nomcoureur,nouvposition):- coureur(nomcoureur,nouvposition,_,_,_,_).

caselibre([c|casessuivantes],idcase):- not(position(nomcoureur,c)),idcase=c,caselibre(casessuivantes,idcase).

caselibreapres(case,idcase):- split_string(case,".","",casesep),nth0(0,casesep,numero),nouvindex=numero+1,nth0(nouvindex,cases,casessuivantes),length(casessuivantes,L),L>1,caselibre(casessuivantes,idcase).

peutdepasser(nomcoureur,valeurcarteseconde):- joueur(_,cartessecondes, Listecoureur,_,_),member(Nomcoureur,Listecoureur), member(valeurcarteseconde,cartessecondes),valeurcarteseconde >= 4.
%Coureur le plus près derrière doit pouvoir utiliser une cartes seconde (que son joueur possède) de valeur minimale 4

%pluspreesderriere(Nomcoureur,Nomcoureurderriere):- aller chercher toutes les positions des coureurs et calculer distance minimale
%calculdistance(Nomcoureur, Nomcoureurderrierepotentiel, Distanceentrecesdeuxcoureurs):- position valeur numero (différence) ou cas avec lettre à préciser
%estdistanceminimale(Distanceminimale):- Distanceminimale telle que n' existe pas de plus petit selon predicat précédent




depassement(nomcoureur,valeurcarteseconde,ordrephasedynamique,prochaincoureur):- valeurcarteseconde>0,position(nomcoureur,case),caselibreapres(case,idcase), peutdepasser(nomcoureur,valeurcarteseconde),position(nomcoureur,idcase),valcartesec=valeurcarteseconde-1,depassement(nomcoureur,valcartesec),miseajourpositioncoureur(nomcoureur,idcase),estletourde(nomcoureur,ordrephasedynamique,prochaincoureur).



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
-----------------------------
(vérifie si le jeu est terminé)

*/
%Par rapport à la position de chaque coureur (ont-ils tous passé la ligne d'arrivée ?)
% Si  oui, alors ce prédicat est vrai et la partie est finie (vérification gagnant et affichage écran fin)




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
