:- use_module(library(lists))

/*
------------------------------
-----------------------------
    Prédicats début
------------------------------
situation début/base de connaissance
---------------------
*/


%liste avec tous les noms de coureurs
coureurs([italie_1,italie_2,italie_3,hollande_1,hollande_2,hollande_3,belgique_1,belgique_2,belgique_3,allemagne_1,allemagne_2,allemagne_3])

listidcases([u,u2,u3,d,d2,d3,t,t2,t3,q,q2,q3,c,c2,c3,si,si2,si3,se,se2,se3,h,h2,h3,n,nb,nc,d0,d0b,d0c,o,o2,do,do2,tre,tre2,qua,qua2,qui,qui2,sei,sei2,d0se,d0se2,d0h,d0h2,d0n,d0n2,
v,v2,v3,vu,vu2,vu3,vd,vd2,vd4,vt,vt2,vt4,vq,vq2,vq4,vc,vc2,vc4,vsi,vsib,vsid,vsic,vse,vseb,vsed,vsed,vh,vh2,vh4,vn,vn2,vn4,
t0,t02,t04,tu,tu2,tu4,td,td2,td4,tt,tt2,tt4,tq,tq2,tq4,tc,tc2,tc4,tsi,tsi2,tse,tse2,th,th2,tn,tn2,q0,q02,qu,qu2,qd,qd2,qt,qt2,qq,qq2,qc,qc2,
qsi,qsi2,qse,qse2,qh,qh2,qn,qn2,c0,c02,cu,cu2,cd,cd2,ct,ct2,cq,cq2,cc,cc2,csi,csi2,cse,cse2,ch,ch2,cn,cn2,s0,s02,su,su2,sd,sd2,sta,stc,stb, sqa,sqc,sqb,
sc,sc2,ssi,ssi2,sse,sse2,sh,sh2,sn,sn2,se0,se02,seu,seu2,sed,sed2,set,seq,sec,sesi,sesi2,sese,sese2,seh,seh2,sen,sen2,qv0,qv02,qvu,qvu2,qvd,qvd2,qvt,qvt2,
qvq,qvq3,qvc,qvc3,qvsi,qvsi3,qvse,qvse3,qvh,qvh3,qvna,qvnc,qvnb,n0a,n0c,n0b, nu,nu3,nd,nd3,nt,nt3,nq,nq3,nc,nc2,nc3,p,p2,p3,
pu,pu2,pu3,pd,pd2,pd3,pt,pt2,pt3,pq,pq2,pq3,pc,pc2,pc3,psi,psi2,psi3,pse,pse2,pse3,ph,ph2,ph3,pn,pn2,pn3])

trouveridcoureur(italie_1,0)
trouveridcoureur(italie_2,1)
trouveridcoureur(italie_3,2)
trouveridcoureur(hollande_1,3)
trouveridcoureur(hollande_2,4)
trouveridcoureur(hollande_3,5)
trouveridcoureur(belgique_1,6)
trouveridcoureur(belgique_2,7)
trouveridcoureur(belgique_3,8)
trouveridcoureur(allemagne_1,9)
trouveridcoureur(allemagne_2,10)
trouveridcoureur(allemagne_3,11)
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
numero(d,2)
position(d,1)
numero(d2,2)
position(d2,2)
numero(d3,2)
position(d3,3)
numero(t,3)
position(t,1)
numero(t2,3)
position(t2,2)
numero(t3,3)
position(t3,3)
numero(q,4)
position(q,1)
numero(q2,4)
position(q2,2)
numero(q3,4)
position(q3,3)
numero(c,5)
position(c,1)
numero(c2,5)
position(c2,2)
numero(c3,5)
position(c3,3)
numero(si,6)
position(si,1)
numero(si2,6)
position(si2,2)
numero(si3,6)
position(si3,3)
numero(se,7)
position(se,1)
numero(se2,7)
position(se2,2)
numero(se3,7)
position(se3,3)
numero(h,8)
position(h,1)
numero(h2,8)
position(h2,2)
numero(h3,8)
position(h3,3)

%Exemple pour les lettres et case chance
numero(n,9)
lettre(n,a)
casechance(n)
numero(nc,9)
lettre(nc,c)
numero(nb,9)
lettre(nb,b)
numero(d0,10)
lettre(d0,a)
casechance(d0)
numero(d0c,10)
lettre(d0c,c)
numero(d0b,10)
lettre(d0b,b)


numero(o,11)
position(o,1)
casechance(o)
numero(o2,11)
position(o2,2)
numero(do,12)
position(do,1)
casechance(do)
numero(do2,12)
position(do2,2)

numero(tre,13)
position(tre,1)
numero(tre2,13)
position(tre2,2)
numero(qua,14)
position(qua,1)
numero(qua2,14)
position(qua2,2)

numero(qui,15)
position(qui,1)
numero(qui2,15)
position(qui2,2)
casechance(qui2)
numero(sei,16)
position(sei,1)
numero(sei2,16)
position(sei2,2)
casechance(sei2)
%d0s--> 17
numero(d0se,17)
position(d0se,1)
numero(d0se2,17)
position(d0se2,2)
numero(d0h,18)
position(d0h,1)
numero(d0h2,18)
position(d0h2,2)

numero(d0n,19)
position(d0n,1)
numero(d0n2,19)
position(d0n2,2)
numero(d0n3,19)
position(d0n3,3)
casechance(d0n3)
numero(v,20)
position(v,1)
numero(v2,20)
position(v2,2)
numero(v3,20)
position(v3,3)

numero(vu,21)
position(vu,1)
numero(vu2,21)
position(vu2,2)
numero(vu3,21)
position(vu3,3)
casechance(vu3)

numero(vd,22)
position(vd,1)
numero(vd2,22)
position(vd2,2)
numero(vd4,22)
position(vd4,4)

numero(vt,23)
position(vt,1)
numero(vt2,23)
position(vt2,2)
numero(vt4,23)
position(vt4,4)

numero(vq,24)
position(vq,1)
casechance(vq)
numero(vq2,24)
position(vq2,2)
numero(vq4,24)
position(vq4,4)

numero(vc,25)
position(vc,1)
numero(vc2,25)
position(vc2,2)
numero(vc4,25)
position(vc4,4)


%Exemple 1er couloir parallèle avec lettre
numero(vsi,26)
lettre(vsi,a)
casechance(vsi)
numero(vsib,26)
lettre(vsib,b)
% !! D avant C dans la progression sur plateau !!
%exemple dans couloir
numero(vsid,26)
lettre(vsid,d)
estcouloir(vsid)
numero(vsic,26)
lettre(vsic,c)
estcouloir(vsic)


numero(vse,27)
lettre(vse,a)
numero(vseb,27)
lettre(vseb,b)
% !! D avant C dans la progression sur plateau !!
%exemple dans couloir
numero(vsed,27)
lettre(vsed,d)
estcouloir(vsed)
numero(vsec,27)
lettre(vsec,c)
estcouloir(vsec)

%Exemple 1er couloir parallèle avec numero/position
numero(vh,28)
position(vh,1)
casechance(vh)
numero(vh2,28)
position(vh2,2)
%Pour position située dans 1er coulior position (_,4)
numero(vh4,28)
position(vh4,4)

numero(vn,29)
position(vn,1)
numero(vn2,29)
position(vn2,2)
numero(vn4,29)
position(vn4,4)
numero(t0,30)
position(t0,1)
casechance(t0)
numero(t02,30)
position(t02,2)
numero(t04,30)
position(t04,4)
numero(tu,31)
position(tu,1)
numero(tu2,31)
position(tu2,2)
numero(tu4,31)
position(tu4,4)
numero(td,32)
position(td,1)
casechance(td)
numero(td2,32)
position(td2,2)
numero(td4,32)
position(td4,4)
numero(tt,33)
position(tt,1)
numero(tt2,33)
position(tt2,2)
numero(tt4,33)
position(tt4,4)
numero(tq,34)
position(tq,1)
casechance(tq)
numero(tq2,34)
position(tq2,2)
numero(tq4,34)
position(tq4,4)
numero(tc,35)
position(tc,1)
numero(tc2,35)
position(tc2,2)
numero(tc4,35)
position(tc4,4)

numero(tsi,36)
position(tsi,1)
numero(tsi2,36)
position(tsi2,2)
numero(tse,37)
position(tse,1)
numero(tse2,37)
position(tse2,2)
numero(th,38)
position(th,1)
numero(th2,38)
position(th2,2)
numero(tn,39)
position(tn,1)
numero(tn2,39)
position(tn2,2)
numero(q0,40)
position(q0,1)
numero(q02,40)
position(q02,2)
numero(qu,41)
position(qu,1)
numero(qu2,41)
position(qu2,2)
numero(qd,42)
position(qd,1)
numero(qd2,42)
position(qd2,2)
numero(qt,43)
position(qt,1)
numero(qt2,43)
position(qt2,2)
numero(qq,44)
position(qq,1)
numero(qq2,44)
position(qq2,2)
numero(qc,45)
position(qc,1)
numero(qc2,45)
position(qc2,2)
numero(qsi,46)
position(qsi,1)
numero(qsi2,46)
position(qsi2,2)
numero(qse,47)
position(qse,1)
numero(qse2,47)
position(qse2,2)
numero(qh,48)
position(qh,1)
casechance(qh)
numero(qh2,48)
position(qh2,2)
numero(qn,49)
position(qn,1)
numero(qn2,49)
position(qn2,2)
numero(c0,50)
position(c0,1)
numero(c02,50)
position(c02,2)
numero(cu,51)
position(cu,1)
numero(cu2,51)
position(cu2,2)
numero(cd,52)
position(cd,1)
numero(cd2,52)
position(cd2,2)
numero(ct,53)
position(ct,1)
numero(ct2,53)
position(ct2,2)
numero(cq,54)
position(cq,1)
numero(cq2,54)
position(cq2,2)
numero(cc,55)
position(cc,1)
numero(cc2,55)
position(cc2,2)
numero(csi,56)
position(csi,56)
numero(csi2,56)
position(csi2,2)
numero(cse,57)
position(cse,1)
numero(cse2,57)
position(cse2,2)
casechance(cse2)
numero(ch,58)
position(ch,1)
numero(ch2,58)
position(ch2,2)
numero(cn,59)
position(cn,1)
numero(cn2,59)
position(cn2,2)
numero(s0,60)
position(s0,1)
numero(s02,60)
position(s02,2)
numero(su,61)
position(su,1)
numero(su2,61)
position(su2,2)
numero(sd,62)
position(sd,1)
numero(sd2,62)
position(sd2,2)
numero(sta,63)
lettre(sta,a)
numero(stc,63)
lettre(stc,c)
numero(stb,63)
lettre(stb,b)
numero(sqa,64)
lettre(sqa,a)
numero(sqc,64)
lettre(sqc,c)
numero(sqb,64)
lettre(sqb,b)
numero(sc,65)
position(sc,1)
numero(sc2,65)
position(sc2,2)
numero(ssi,66)
position(ssi,1)
casechance(ssi)
numero(ssi2,66)
position(ssi2,2)
casechance(ssi2)
numero(sse,67)
position(sse,1)
numero(sse2,67)
position(sse2,2)
numero(sh,68)
position(sh,1)
numero(sh2,68)
position(sh2,2)
numero(sn,69)
position(sn,1)
numero(sn2,69)
position(sn2,2)
numero(se0,70)
position(se0,1)
numero(se02,70)
position(se02,2)
numero(seu,71)
position(seu,1)
numero(seu2,71)
position(seu2,2)
numero(sed,72)
position(sed,1)
numero(sed2,72)
position(sed2,2)
numero(set,73)
position(set,1)
numero(seq,74)
position(seq,1)
casechance(seq)
numero(sec,75)
position(sec,1)
numero(sesi,76)
position(sesi,1)
numero(sesi2,76)
position(sesi2,2)
numero(sese,77)
position(sese,1)
numero(sese2,77)
position(sese2,2)
numero(seh,78)
position(seh,1)
numero(seh2,78)
position(seh2,2)
numero(sen,79)
position(sen,1)
numero(sen2,79)
position(sen2,2)
numero(qv0,80)
position(qv0,1)
numero(qv02,80)
position(qv02,2)
numero(qvu,81)
position(qvu,1)
numero(qvu2,81)
position(qvu2,2)
numero(qvd,82)
position(qvd,1)
numero(qvd2,82)
position(qvd2,2)
numero(qvt,83)
position(qvt,1)
numero(qvt2,83)
position(qvt2,2)

numero(qvq,84)
position(qvq,1)
numero(qvq3,84)
position(qvq3,3)
numero(qvc,85)
position(qvc,1)
numero(qvc3,85)
position(qvc3,3)
numero(qvsi,86)
position(qvsi,1)
numero(qvsi3,86)
position(qvsi3,3)
numero(qvse,87)
position(qvse,1)
numero(qvse3,87)
position(qvse3,3)
numero(qvh,88)
position(qvh,1)
numero(qvh3,88)
position(qvh3,3)
numero(qvna,89)
lettre(qvna,a)
numero(qvnc,89)
lettre(qvnc,c)
estcouloir(qvnc)
numero(qvnb,89)
lettre(qvnb,b)
estcouloir(qvnb)
%Exemple 2ème couloir parallèle avec lettre
numero(n0a,90)
lettre(n0a,a)
numero(n0c,90)
lettre(n0c,c)
estcouloir(n0c)
casechance(n0c)
numero(n0b,90)
lettre(n0b,b)
estcouloir(n0b)
numero(nu,91)
position(nu,1)
numero(nu3,91)
position(nu3,3)
numero(nd,92)
position(nd,1)
numero(nd3,92)
position(nd3,3)
numero(nt,93)
position(nt,1)
numero(nt3,93)
position(nt3,3)
numero(nq,94)
position(nq,1)
numero(nq3,94)
position(nq3,3)
numero(nc,95)
position(nc,1)
numero(nc2,95)
position(nc2,2)
numero(nc3,95)
position(nc3,3)



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
numero(pu,1)
position(pu,1)
apresarrivee(pu)
numero(pu2,1)
position(pu2,2)
apresarrivee(pu2)
numero(pu3,1)
position(pu3,3)
apresarrivee(pu3)
numero(pd,2)
position(pd,1)
apresarrivee(pd)
numero(pd2,2)
position(pd2,2)
apresarrivee(pd2)
numero(pd3,2)
position(pd3,3)
apresarrivee(pd3)
numero(pq,4)
position(pq,1)
apresarrivee(pq)
numero(pq2,4)
position(pq2,2)
apresarrivee(pq2)
numero(pq3,4)
position(pq3,3)
apresarrivee(pq3)
numero(pc,5)
position(pc,1)
apresarrivee(pc)
numero(pc2,5)
position(pc2,2)
apresarrivee(pc2)
numero(pc3,5)
position(pc3,3)
apresarrivee(pc3)
numero(psi,6)
position(psi,1)
apresarrivee(psi)
numero(psi2,6)
position(psi2,2)
apresarrivee(psi2)
numero(psi3,6)
position(psi3,3)
apresarrivee(psi3)
numero(pse,7)
position(pse,1)
apresarrivee(pse)
numero(pse2,7)
position(pse2,2)
apresarrivee(pse2)
numero(pse3,7)
position(pse3,3)
apresarrivee(pse3)
numero(ph,8)
position(ph,1)
apresarrivee(ph)
numero(ph2,8)
position(ph2,2)
apresarrivee(ph2)
numero(ph3,8)
position(ph3,3)
apresarrivee(ph3)
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


%Base de connaissance (exceptions de estjustedevantcase)
estjustedevant(h3, nc).
estjustedevant(vu3, vd4).
estjustedevant(vc,vsia).
estjustedevant(vc2,vsib).
estjustedevant(vsia,vsea).
estjustedevant(vsib,vseb).
estjustedevant(vsic,vsed).
estjustedevant(tc, tsi1).
estjustedevant(tc2, tsi1).
estjustedevant(tc4, tsi2).
estjustedevant(sed2, set).
estjustedevant(qvt2, qvq3).
estjustedevant(qvt2, qvq3).

%Définition des identifiants des coureurs de chaque joueur
coureurdejoueur(italie,[italie_1,italie_2,italie_3])
coureurdejoueur(hollande,[hollande_1,hollande_2,hollande_3])
coureurdejoueur(belgique,[belgique_1,belgique_2,belgique_3])
coureurdejoueur(allemagne,[allemagne_1,allemagne_2,allemagne_3])

idjoueur(italie,0).
idjoueur(hollande,1).
idjoueur(belgique,2).
idjoueur(allemagne,3).



/*
-----------------------------------
-----------------------------------
    Définition d'un état de jeu
-----------------------------------
*/
%s[Cartes secondes tas],[Listecoureurspasseleurtour],[[Coureur1,idcase1]])
%représentation du tas de cartes (liste)
%Liste des coureurs devant passé leur tour
%Position de chaque coureur dans une liste de forme [[Nomcoureur, Idcase]]
%un coureur a passé la ligne d'arrivée ? (pour le calcul du temps total)
%Liste des tas de cartes secondes de chacun des joueurs de forme [[Nomjoueur, [Valeur des cartes secondes que possèdent le joueur]]]
% Variable numérique allant de 1 à 12
%(initialisée à 1 (état initial)), (incrémentée de 1 à la fin du tour de chaque coureur) , (quand vaut 12 alors recalcul de l'ordre)
% Listeordre représentant l'ordre actuel des coureurs durant CE tour
%Liste de liste des Temps partiels pour chaque coureur d'un joueur de forme [[Tempscoureur1italie,Tempscoureur2italie,Tempscoureur3italie],...]

%état initial
jeu([1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,
5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,
10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12], [], [[italie_1,depart],[italie_2,depart],[italie_3,depart],[hollande_1,depart],[hollande_2,depart],[hollande_3,depart]
,[belgique_1,depart],[belgique_2,depart],[belgique_3,depart],[allemagne_1,depart],[allemagne_2,depart],[allemagne_3,depart]], faux,[[italie,[]],[hollande,[]],[belgique,[]],[allemagne,[]]],1,[],[[0,0,0],[0,0,0],[0,0,0],[0,0,0]]).

%état final
jeu(_,_, [[italie_1,arrivee],[italie_2,arrivee],[italie_3,arrivee],[hollande_1,arrivee],[hollande_2,arrivee],[hollande_3,arrivee]
,[belgique_1,arrivee],[belgique_2,arrivee],[belgique_3,arrivee],[allemagne_1,arrivee],[allemagne_2,arrivee],[allemagne_3,arrivee]], vrai,[[italie,_],[hollande,_],[belgique,_],[allemagne,_]],_,_,_).




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

%Trouver position du coureur (avec son nom)

trouver_position(Nomcoureur,[[Nomcoureur,Pos]|_],Pos).
trouver_position(Nomcoureur,[Coureurpos|Listepositionscoureurs],Pos):- trouver_position(Nomcoureur,Listepositionscoureurs,Pos).

%Trouver coureur sur case (avec Pos l'id de la case)

trouver_coureur(Pos,[[Nomcoureur,Pos]|_],Nomcoureur).
trouver_coureur(Pos,[Coureurpos|Listepositionscoureurs],Nomcoureur):- trouver_coureur(Pos,Listepositionscoureurs,Nomcoureur).




/*
----------------------
  Détermination de l'ordre de la phase de début
----------------------
*/

tasdecartejoueur(Nomjoueur, Listetasdecartes, Tascartejoueur):-
  nth0(X, Sousliste, Listetasdecartes), nth0(1, Tascartejoueur, Sousliste).

%Obtention de la plus haute valeur des cartes secondes pour chaque joueur
maxchaquejoueur(Listetasdecartes,Nomjoueur,Maxval):-
  tasdecartejoueur(Nomjoueur, Listetasdecartes, Tascartejoueur),maxlist(Tascartejoueur,Maxval).

%Obtention deuxième plus haute valeur with delete)
secondmaxchaquejoueur(Nomjoueur, Listetasdecartes, Plushauteval,Secondeplushauteval):- tasdecartejoueur(Nomjoueur, Listetasdecartes, Tascartejoueur),delete(Tascartejoueur,Plushauteval,Nouvelleliste),maxlist(Nouvelleliste,Secondeplushauteval)

%Permet de trouver le joueur la plus haute parmi ceux de la liste récursivement
%(Quand leur carte la plus haute est la même, va chercher la seconde carte la plus haute et ainsi de suite)

%à terminer
%maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-% if plushautevaluecom in liste joueur in list then --> search fornext highest value (prédicat secong highest with delete) compare those next value x >y
%maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-% if plushautevaluecom in liste joueur in list then --> search fornext highest value (prédicat secong highest with delete) compare those next value x==y
%maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-
%maxentrejoueurs([J1,J2,J3,J4], Plushautevalcom, Maxj):-

%maxentrejoueurs([J1,J2,J3], Plushautevalcom, Maxj):-
%maxentrejoueurs([J1,J2,J3], Plushautevalcom, Maxj):-
%maxentrejoueurs([J1,J2,J3], Plushautevalcom, Maxj):-

%maxentrejoueurs([J1,J2], Plushautevalcommune, Maxj):-
%maxentrejoueurs([J1,J2], Plushautevalcommune, Maxj):-

%-----Premier joueur -----
%cas où un et un seul joueur a la plus haute carte
maxtousjoueurs(Listetasdecartes,Premierjoueur):-
  maxchaquejoueur(Listetasdecartes,Premierjoueur,Plushauteval),maxchaquejoueur(Listetasdecartes,Autrejoueur, Autreval),maxchaquejoueur(Listetasdecartes,Autrejoueur1, Autreval1),maxchaquejoueur(Listetasdecartes,Autrejoueur2, Autreval2),
   Plushauteval > Autreval, Plushauteval >  Autreval1, Plushauteval >  Autreval2.
%cas où deux joueurs ont la plus haute carte en jeu
maxtousjoueurs(Listetasdecartes,Premierjoueur):-
   maxchaquejoueur(Listetasdecartes,Joueurpotentiel,Potentielleval),maxchaquejoueur(Listetasdecartes,Joueurpotentiel1, Potentielleval1 ),maxchaquejoueur(Listetasdecartes,Autrejoueur1,Autreval1),maxchaquejoueur(Listetasdecartes,Autrejoueur2,Aurteval2),
   Potentielleval == Potentielleval1, Joueurpotentiel \== Joueurpotentiel1,Potentielleval > Autreval1, Potentielleval > Autreval2, maxentrejoueurs(Listetasdecartes,[Joueurpotentiel, Joueurpotentiel1], Potentielleval, Premierjoueur).
%cas où trois joueurs ont la plus haute carte en jeu
maxtousjoueurs(Listetasdecartes,Premierjoueur):-
   maxchaquejoueur(Listetasdecartes,Joueurpotentiel,Potentielleval),maxchaquejoueur(Listetasdecartes,Joueurpotentiel1, Potentielleval1 ),maxchaquejoueur(Listetasdecartes,Joueurpotentiel2,Potentielleval2),maxchaquejoueur(Listetasdecartes,Autrejoueur1,Autreval1),
    Potentielleval == Potentielleval1, Potentielleval == Potentielleval2, Potentielleval > Autreval1, Joueurpotentiel \== Joueurpotentiel1,  Joueurpotentiel \== Joueurpotentiel2,  maxentrejoueurs(Listetasdecartes,[Joueurpotentiel, Joueurpotentiel1, Joueurpotentiel2],Potentielleval,Premierjoueur).
%cas où quatre joueurs ont la plus haute carte en jeu
maxtousjoueurs(Listetasdecartes,Premierjoueur):-
   maxchaquejoueur(Listetasdecartes,Joueurpotentiel,Potentielleval),maxchaquejoueur(Listetasdecartes,Joueurpotentiel1, Potentielleval1 ),maxchaquejoueur(Listetasdecartes,Joueurpotentiel2,Potentielleval2),maxchaquejoueur(Listetasdecartes,Joueurpotentiel3,Potentielleval3),
    Potentielleval == Potentielleval1, Potentielleval == Potentielleval2, Potentielleval == Potentielleval3, Joueurpotentiel \== Joueurpotentiel1,  Joueurpotentiel \== Joueurpotentiel2,   Joueurpotentiel \== Joueurpotentiel3, maxentrejoueurs(Listetasdecartes,[Joueurpotentiel, Joueurpotentiel1,Joueurpotentiel2, Joueurpotentiel3],Potentielleval,Premierjoueur).

%----Second joueur -------
%cas où un et un seul joueur a la plus haute carte:
secondplace(Listetasdecartes,Secondjoueur):-
  maxchaquejoueur(Listetasdecartes,Secondjoueur,Plushauteval),maxchaquejoueur(Listetasdecartes,Autrejoueur, Autreval ),maxchaquejoueur(Listetasdecartes,Autrejoueur1,Autreval1),maxtousjoueur(Listetasdecartes,Premierjoueur),
   Secondjoueur \== Premierjoueur, Plushauteval > Autreval,  Plushauteval  > Autreval1.

%cas où deux joueurs ont plus hautes cartes:
secondplace(Listetasdecartes,Secondjoueur):-
   maxchaquejoueur(Listetasdecartes,Joueurpotentiel,Potentielleval),maxchaquejoueur(Listetasdecartes,Joueurpotentiel1, Potentielleval1),maxchaquejoueur(Listetasdecartes,Autrejoueur1,Autreval1),maxtousjoueur(Listetasdecartes,Premierjoueur),
   Potentielleval == Potentielleval1, Premierjoueur\== Joueurpotentiel,  Premierjoueur\== Joueurpotentiel1, Joueurpotentiel \== Joueurpotentiel1,Potentielleval > Autreval1, Potentielleval1 > Autreval1, maxentrejoueurs(Listetasdecartes,[Joueurpotentiel, Joueurpotentiel1], Potentielleval,Secondjoueur).

%cas où trois joueurs ont plus hautes cartes:
secondplace(Listetasdecartes,Secondjoueur):-
   maxchaquejoueur(Listetasdecartes,Joueurpotentiel,Potentielleval),maxchaquejoueur(Listetasdecartes,Joueurpotentiel1, Potentielleval1),maxchaquejoueur(Listetasdecartes,Joueurpotentiel2, Potentielleval2),
maxtousjoueur(Listetasdecartes,Premierjoueur),  Potentielleval == Potentielleval1, Potentielleval == Potentielleval2, Premierjoueur\== Joueurpotentiel,  Premierjoueur\== Joueurpotentiel1,  Premierjoueur\== Joueurpotentiel2, Joueurpotentiel \== Joueurpotentiel1,  Joueurpotentiel \== Joueurpotentiel2, Joueurpotentiel1 \== Joueurpotentiel2,
 maxentrejoueurs(Listetasdecartes,[Joueurpotentiel, Joueurpotentiel1, Joueurpotentiel2], Potentielleval,Secondjoueur).


 %----Troisieme joueur -------
% cas où un et un seul joueur a la plus haute carte:
 troisiemeplace(Listetasdecartes,Troisiemejoueur):-
    maxeachjoueur(Listetasdecartes,Troisiemejoueur,Plushauteval),maxeachjoueur(Listetasdecartes,Autreplayer, Autreval ),maxtousjoueur(Listetasdecartes,Premierjoueur), secondplace(Listetasdecartes,Secondjoueur),
     Troisiemejoueur \== Premierjoueur, Troisiemejoueur \== Secondjoueur, Plushauteval > Autreval.

 %cas où les deux joueurs restants ont la même plus haute carte:
 troisiemeplace(Listetasdecartes,Troisiemejoueur):-
    maxeachjoueur(Listetasdecartes,Joueurpotentiel,Potentielleval),maxeachjoueur(Listetasdecartes,Joueurpotentiel1, Potentielleval1),maxtousjoueur(Listetasdecartes,Premierjoueur), secondplace(Listetasdecartes,Secondjoueur),
    Potentielleval == Potentielleval1 ,Joueurpotentiel \== Premierjoueur,  Joueurpotentiel \==  Secondjoueur,  Joueurpotentiel \==  Joueurpotentiel1, maxentrejoueurs(Listetasdecartes,[Joueurpotentiel, Joueurpotentiel1], Potentielleval,Troisiemejoueur).

 %----Quatrieme joueur-------
 %joueur restant (pas premier , deuxième ni troisième):
 quatriemeplace(Listetasdecartes,Quatriemejoueur):- maxtousjoueurs(Listetasdecartes,Premierjoueur), secondplace(Listetasdecartes,Secondjoueur),troisiemeplace(Listetasdecartes,Troisiemejoueur),
  Quatriemejoueur \== Premierjoueur, Quatriemejoueur \== Secondjoueur, Quatriemejoueur \== Troisiemejoueur.

 %----Ordre début ---------
% C1,C5,C9->  coureurs du premier joueur de la phase de début
% C2,C6,C10-> coureurs du second joueur de la phase de début
% C3,C7,C11-> coureurs du troisième joueur de la phase de début
% C4,C8,C12-> coureurs du quatrième joueur de la phase de début

ordreddebut(Listetasdecartes,[C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12]):-
    maxtousjoueurs(Listetasdecartes,Premierjoueur), secondplace(Listetasdecartes,Secondjoueur),troisiemeplace(Listetasdecartes,Troisiemejoueur), quatriemeplace(Listetasdecartes,Quatriemejoueur),
 coureurdejoueur(italie,[C1,C5,C9]), coureurdejoueur(hollande,[C2,C6,C10]), coureurdejoueur(belgique,[C3,C7,C11]), coureurdejoueur(allemagne,[C4,C8,C12]).

 /*
 -----------------------------------
 -----------------------------------
       Prédicats milieu de jeu (phase dynamique)
 -----------------------------------
 */

%Idcase2 est juste devant Idcase1
 estdevantcase(Idcase1,Idcase2,Idcasedevant):-
   estjustedevantcase(Idcase1,Idcase2), Idcasedevant is Idcase2.
%Idcase1 est juste devant Idcase2
estdevantcase(Idcase1,Idcase2,Idcasedevant):-
  estjustedevantcase(Idcase2,Idcase1), Idcasedevant is Idcase1.

%Idcase2 est devant Idcase1 (calcul récursif)
estdevantcase(Idcase1,Idcase2,Idcasedevant):-
  estjustedevantcase(Idcase1,Idcaseintermediaire), estjustedevantcase(Idcaseintermediaire,Idcase2,Idcase2),Idcasedevant is Idcase2.

%Idcase1 est devant Idcase2 (calcul récursif)
estdevantcase(Idcase1,Idcase2,Idcasedevant):-
  estjustedevantcase(Idcase2,Idcaseintermediaire), estjustedevantcase(Idcaseintermediaire,Idcase1,Idcase1),Idcasedevant is Idcase1.

%Idcase1 et Idcase2 sont situées parallèlement (dans la même largeur)(les cas concernant les lettres étant traités dans estjustedevantcase)
 estdevantcase(Idcase1,Idcase2,Idcasedevant):-
   numero(Idcase1,Num1),numero(Idcase2,Num2),Num1==Num2,position(Idcase1,Pos1), position(Idcase2, Pos2), Pos1\== Pos2, random_permutation([Idcase1,Idcase2], Permutation),nth0(0,Permutation,Idcasedevant).


%tous les cas de base (en fonction de la position dans la largeur)
estjustedevantcase(Idcase1,Idcase2):-
  numero(Idcase1,Num1), position(Idcase1,Position), position(Idcase2,Position), numero(Idcase2,Num2),Num2 is 1+Num1.

%   numero position2-> numero+1 lettre c
estjustedevantcase(Idcase1,Idcase2):-
   numero(Idcase1,Num1), position(Idcase1,2),lettre(Idcase2,c), not(estcouloir(Idcase2)), numero(Idcase2,Num2),Num2 is 1+Num1.

%   numero lettreb -> numero+1 position2
estjustedevantcase(Idcase1,Idcase2):-
   numero(Idcase1,Num1),lettre(Idcase1,b),position(Idcase2,2), numero(Idcase2,Num2),Num2 is 1+Num1.

%   numero lettre a  -> numero +1  position 1
estjustedevantcase(Idcase1,Idcase2):-
   numero(Idcase1,Num1), lettre(Idcase1,a), position(Idcase2,1), numero(Idcase2,Num2),Num2 is 1+Num1.

%   numero lettre b couloir -> numero +1 position 4
estjustedevantcase(Idcase1,Idcase2):-
   numero(Idcase1,Num1),lettre(Idcase1,b), estcouloir(Idcase1), position(Idcase2,4), numero(Idcase2,Num2),Num2 is 1+Num1.

%numero lettre b couloir -> numero +1 position 3
estjustedevantcase(Idcase1,Idcase2):-
   numero(Idcase1,Num1),lettre(Idcase1,b), estcouloir(Idcase1), position(Idcase2,3), numero(Idcase2,Num2),Num2 is 1+Num1.

%numero position 3-> numero +1 lettre c couloir
estjustedevantcase(Idcase1,Idcase2):-
   numero(Idcase1,Num1),position(Idcase1,3), lettre(Idcase2,c), estcouloir(Idcase2),numero(Idcase2,Num2),Num2 is 1+Num1.


%cas où lettre C avant B (hors couloir)
estjustedevantcase(Idcase1,Idcase2):-
  numero(Idcase1,Num),lettre(Idcase1,c), not(estcouloir(Idcase1)), lettre(Idcase2,b), numero(Idcase2,Num).

%cas où lettre D avant C dans couloir
estjustedevantcase(Idcase1,Idcase2):-
  numero(Idcase1,Num),lettre(Idcase1,d), estcouloir(Idcase2), lettre(Idcase2,c), numero(Idcase2,Num).



 %ordre de la phase dynamique
 %Avant la ligne arrivée (personne ne l'a passé)

 numerocoureur(Nomcoureur,Numero,Listeposition,Position):-
   trouver_position(Nomcoureur,Listeposition,Position), numero(Position,Numero).

 listenumerocoureur(Listeposition,[Num1,Num2,Num3,Num4,Num5,Num6,Num7,Num8,Num9,Num10,Num11,Num12]):-
   numerocoureur(italie_1,Num1,Listeposition,Position), numerocoureur(italie_2,Num5,Listeposition,Position),numerocoureur(italie_3,Num6,Listeposition,Position),
   numerocoureur(hollande_1,Num4,Listeposition,Position), numerocoureur(hollande_2,Num2,Listeposition,Position),numerocoureur(hollande_3,Num3,Listeposition,Position),
   numerocoureur(belgique_1,Num7,Listeposition,Position), numerocoureur(belgique_2,Num8,Listeposition,Position),numerocoureur(belgique_3,Num9,Listeposition,Position),
   numerocoureur(allemagne_1,Num10,Listeposition,Position), numerocoureur(allemagne_2,Num11,Listeposition,Position),numerocoureur(allemagne_3,Num12,Listeposition,Position)


 fabriqueordredynamique(Listetriee,Listeposition,[Coureur1, Coureur2, Coureur3, Coureur4,Coureur5,Coureur6,Coureur7,Coureur8,Coureur9,Coureur10,Coureur11,Coureur12]):-
   nth0(0,Listetriee,Num1), numero(Idcase1,Num1) , trouver_coureur(Idcase1,Listeposition,Coureur1),
   nth0(1,Listetriee,Num2), numero(Idcase2,Num2) , trouver_coureur(Idcase2,Listeposition,Coureur2),
   nth0(2,Listetriee,Num3), numero(Idcase3,Num3) , trouver_coureur(Idcase3,Listeposition,Coureur3),
   nth0(3,Listetriee,Num4), numero(Idcase4,Num4) , trouver_coureur(Idcase4,Listeposition,Coureur4),
   nth0(4,Listetriee,Num5), numero(Idcase5,Num5) , trouver_coureur(Idcase5,Listeposition,Coureur5),
   nth0(5,Listetriee,Num6), numero(Idcase6,Num6) , trouver_coureur(Idcase6,Listeposition,Coureur6),
   nth0(6,Listetriee,Num7), numero(Idcase7,Num7) , trouver_coureur(Idcase7,Listeposition,Coureur7),
   nth0(7,Listetriee,Num8), numero(Idcase8,Num8) , trouver_coureur(Idcase8,Listeposition,Coureur8),
   nth0(8,Listetriee,Num9), numero(Idcase9,Num9) , trouver_coureur(Idcase9,Listeposition,Coureur9),
   nth0(9,Listetriee,Num10), numero(Idcase10,Num10) , trouver_coureur(Idcase10,Listeposition,Coureur10),
   nth0(10,Listetriee,Num11), numero(Idcase11,Num11) , trouver_coureur(Idcase11,Listeposition,Coureur11),
   nth0(11,Listetriee,Num12), numero(Idcase12,Num12) , trouver_coureur(Idcase12,Listeposition,Coureur12)



 ordrephasedynamique(jeu(_,_,Listeposition,Apasselignearrivee,_,_,_), Listeordredynamique):- not(Apasselignearrivee),
 coureurs(Listecoureurs),listenumerocoureur(Listeposition,Listenumeroatrier), msort(Listenumeroatrier,Listetriee),fabriqueordredynamique(Listetriee,Listeposition,Listeordredynamique).
 % not(Apasselignearrivee), --> a regarder plus tard


ordre(Listeposition,_,dynamique, Ordrephasedynamique):-
  not(nth0(X,Sublist,Listeposition), nth0(Y,Position, Sublist), Position is depart),ordrephasedynamique(jeu(_,_,Listeposition,Apasselignearrivee,_,_,_,_), Ordrephasedynamique).

ordre(_,Listetasdecartes,debut,Ordredebut):-
  ordreddebut(jeu(_,_,_,_,Listetasdecartes,_,_,_),Ordredebut).





/*
-----------------------------
-----------------------------
          ACTIONS
-----------------------------
*/

%----Case chance ----
%Choix "aléatoire" d'une valeur entre[-3,3]
% et
%Découverte de la case (Idnouvellecase) où va être déplacé le coureur depuis sa case chance actuelle (Idcase) où il s'est arrêté

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
   numero(Idcase,Numerocasechance), position(Idcase,Position),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), position(Idnouvellecase,Nouvelleposition), Position == Nouvelleposition.

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
   numero(Idcase,Numerocasechance), position(Idcase,3),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), not(position(Idnouvellecase,3)), position(Idnouvellecase,4).

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
  numero(Idcase,Numerocasechance), lettre(Idcase,a),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), lettre(Idnouvellecase,a).

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
  numero(Idcase,Numerocasechance), lettre(Idcase,a),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), position(Idnouvellecase,1).

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
   numero(Idcase,Numerocasechance), lettre(Idcase,c),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), lettre(Idnouvellecase,c).

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
   numero(Idcase,Numerocasechance), lettre(Idcase,c),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), lettre(Idnouvellecase,b).

traitementcasechance(Idcase,Valeurmouvement, Idnouvellecase):-
   numero(Idcase,Numerocasechance), lettre(Idcase,c),Numeronouvellecase is Numerocasechance + Valeurmouvement, numero(Idnouvellecase,Numeronouvellecase), position(Idnouvellecase,3).


%---------- Aspiration ----------------
%CONDITION pour qu'un coureur puisse utiliser le phénomène d'Aspiration

%si la carte seconde jouée appartient au joueur du coureur dont c'est le tour
%si Un coureur se trouve JUSTE DERRIERE un autre coureur
%si la distance entre le coureur et celui derrière après le déplacement avec aspiration est supérieure à 4
aspirationok(Coureur,Listetas,Listecoureur,Valeurcartesec):-
  coureurdejoueur(Nomjoueur, Listecoureur),tasdecartejoueur(Nomjoueur,Listetas,Tascartejoueur), member(Valeurcarteseconde,Cartessecondes),
  coureurs(Coureurs),trouver_position(Coureur,Listecoureur,Idcase1),not(estcouloir(Idcase1)),numero(Idcase1,Numero1),trouver_position(Coureurdevant,Listecoureur,Idcase2), Coureurdevant \== Coureur,estjustedevantcase(Idcase1,Idcase2),
  aspiration(Coureur,Listecoureur,Valeurcartesec,Casearrivee),regledesquatresec(Nomcoureur,Casearrivee,Listeposition).
%si la carte seconde jouée appartient au joueur du coureur dont c'est le tour
%si Un coureur se trouve JUSTE à côté d' un autre coureur
%si la distance entre le coureur et celui derrière après le déplacement avec aspiration est supérieure à 4
aspirationok(Coureur,Listetas,Listecoureur,Valeurcartesec):-
  coureurdejoueur(Nomjoueur, Listecoureur),tasdecartejoueur(Nomjoueur,Listetas,Tascartejoueur), member(Valeurcarteseconde,Cartessecondes),
  coureurs(Coureurs),trouver_position(Coureur,Listecoureur,Idcase1),not(estcouloir(Idcase1)),numero(Idcase1,Numero1),trouver_position(Coureuracote,Listecoureur,Idcase2),Coureuracote/==Coureur,numero(Idcase2,Numero2),Idcase1/==Idcase2,Numero1==Numero2),
  aspiration(Coureur,Listecoureur,Valeurcartesec,Casearrivee),regledesquatresec(Nomcoureur,Casearrivee,Listeposition).



%Calcul de la Case d'arrivée d'un coureur Selon
%La situation actuelle (position des autres coureurs)
%La valeur de la carte seconde jouée
%Un coureur se trouve JUSTE DERRIERE un autre coureur
%et
%Possibilité d'arriver DERRIERE un autre coureur en utilisant la valeur de la carte seconde +1
aspiration(Coureur,Listecoureur,Valeurcartesec,Casearrivee):-
   coureurs(Coureurs),trouver_position(Coureur,Listecoureur,Idcase1),not(estcouloir(Idcase1)),numero(Idcase1,Numero1),trouver_position(Coureurdevant,Listecoureur,Idcase2), Coureurdevant \== Coureur,estjustedevantcase(Idcase1,Idcase2),Arrivee is Numero1+Valeurcartesec+1
,numero(Casearrivee,Arrivee),estjustedevantcase(Casearrivee,Casecoureurapres),trouver_coureur(Casecoureurapres,Listecoureur,Coureursuivant).

%Calcul de la Case d'arrivée d'un coureur Selon
%La situation actuelle (position des autres coureurs)
%La valeur de la carte seconde jouée
%Un coureur se trouve JUSTE DERRIERE
% et
%Possibilité d'arriver à côté un autre coureur en utilisant la valeur de la carte seconde +1

aspiration(Coureur,Listecoureur,Valeurcartesec,Casearrivee):-
  coureurs(Coureurs),trouver_position(Coureur,Listecoureur,Idcase1),not(estcouloir(Idcase1)),numero(Idcase1,Numero1),trouver_position(Coureurdevant,Listecoureur,Idcase2), Coureurdevant \== Coureur,estjustedevantcase(Idcase1,Idcase2),Arrivee is Numero1+Valeurcartesec+1
,numero(Casearrivee,Arrivee),numero(Idcase,Numcaseapres),Idcase/==Casearrivee,trouver_coureur(Idcase,Listecoureur,Coureursuivant).

%Calcul de la Case d'arrivée d'un coureur Selon
%La situation actuelle (position des autres coureurs)
%La valeur de la carte seconde jouée
%Un coureur se trouve JUSTE à CÔté
%et
%Possibilité d'arriver à CÔté d'un autre coureur en utilisant la valeur de la carte seconde +1

aspiration(Coureur,Listecoureur,Valeurcartesec,Casearrivee):-
  coureurs(Coureurs),trouver_position(Coureur,Listecoureur,Idcase1),not(estcouloir(Idcase1)),numero(Idcase1,Numero1),trouver_position(Coureuracote,Listecoureur,Idcase2),Coureuracote/==Coureur,numero(Idcase2,Numero2),Idcase1/==Idcase2,Numero1==Numero2)
, Arrivee is Numero1+Valeurcartesec+1,numero(Casearrivee,Arrivee),numero(Idcase,Arrivee),Idcase/==Casearrivee,trouver_coureur(Idcase,Listecoureur,Coureursuivant).


%Calcul de la Case d'arrivée d'un coureur Selon
%La situation actuelle (position des autres coureurs)
%La valeur de la carte seconde jouée
%Un coureur se trouve JUSTE à CÔté
%et
%Possibilité d'arriver juste derrière un autre coureur en utilisant la valeur de la carte seconde +1

aspiration(Coureur,Listecoureur,Valeurcartesec,Casearrivee):-
   coureurs(Coureurs),trouver_position(Coureur,Listecoureur,Idcase1),not(estcouloir(Idcase1)),numero(Idcase1,Numero1),trouver_position(Coureuracote,Listecoureur,Idcase2),Coureuracote/==Coureur,numero(Idcase2,Numero2),Idcase1/==Idcase2,Numero1==Numero2)
,Arrivee is Numero1+Valeurcartesec+1,numero(Casearrivee,Arrivee), estjustedevantcase(Casearrivee, Casecoureurapres),trouver_coureur(Casecoureurapres,Listecoureur,Coureursuivant).

%---------- Dépassement ----------------


%Selon l'ordre (de phase début ou dynamique) et l'index de tour retourne le coureur dont c'est le tour et le prochain
estletourde(Nomcoureur,Indextour, Ordre,Prochaincoureur):-
   nth1(Indextour,Ordrephasedebut,Nomcoureur),I is Indextour+1,nth1(I,Ordrephasedebut,Prochaincoureur).



%Liste de tous les coureurs derrière Nomcoureur

estderriere(Idcaseoucoureur,Listecoureur,Coureurs,Coureursderriere):-
  findall(C,(member(C,Coureurs),trouver_position(C, Listecoureur,Idcaseautrecoureur),estdevantcase(Idcaseautrecoureur,Idcaseoucoureur,Idcaseoucoureur)),Coureursderriere).


%Distance approximative
%(pas de prise en compte des cas avec les lettres considérées comme des cases à part entières ici)
%avec chaque coureur derrière
calculdistance(Listecoureur,Nomcoureur, Coureursderriere,Listedistances):-
  trouver_position(Nomcoureur,Listecoureur,Idcase1), numero(Idcase1,Numero1),findall([C,Distance],(member(C,Coureursderriere),trouver_position(C,Listecoureur,Idcase2),numero(Idcase2,Numero2),Distance is Numero1-Numero2),Listedistances).


%Permet de trouver le couple Nomcoureurleplusprochederriere , Distance par rapport au Nomcoureur
estdistanceminimale(Listedistances,Distanceminimale, Nomcoureurleplusprochederriere):-
  findall(Distances, (member(Sousliste, Listedistances), nth0(1, Distance,Sousliste)),Listedistaverif),min_list(Listedistaverif,Distanceminimale), nth0(X, Souslisteoucoureur, Listedistances), nth0(0,Nomcoureurleplusprochederriere,Distanceminimale).

%Peut dépasser
%si la carte seconde jouée appartient au joueur dont c'est le tour
%si la distance entre le coureur et celui derrière après le dépassement est supérieure à 4

peutdepasser(Nomcoureur,Listeposition,Listetas,Valeurcarteseconde,Casearrivee):-
  coureurdejoueur(Nomjoueur, Listecoureur),tasdecartejoueur(Nomjoueur,Listetas,Tascartejoueur), member(Valeurcarteseconde,Cartessecondes),depassement(Nomcoureur,Listecoureur,Valeurcarteseconde,Casearrivee),regledesquatresec(Nomcoureur,Casearrivee,Listeposition).

%Implémentation de la règle indiquant qu'un coureur doit laisser le coureur derrière lui pouvoir utiliser une carte seconde de valeur supérieure ou égale à 4.
regledesquatresec(Nomcoureur,Idcaseoucoureur,Listeposition):-
  coureurs(Coureurs), estderriere(Idcaseoucoureur,Listecoureur,Coureurs,Coureursderriere),calculdistance(Listecoureur,Nomcoureur,Coureursderriere,Listedistances),estdistanceminimale(Listedistances,Distanceminimale, Nomcoureurleplusprochederriere),Distanceminimale >= 4.

%------------------------------------------------------
%Prédicats retournant la valeur de la case d'arrivée
%selon la carte seconde (Valeurcarteseconde) jouée et la position des autres coureurs

%Cas où carte seconde vaut 2 (Case arrivee == juste devant coureur situé "juste devant")
depassement(Nomcoureur,Listecoureur,Valeurcarteseconde,Idcasearrivee):-
   Valeurcarteseconde ===2,trouver_position(Nomcoureur, Listecoureur, Idcasecoureur),trouver_coureur(Idcasedevant,Listecoureur,Nomcoureurdevant), estjustedevantcase(Idcasecoureur, Idcasedevant), estjustedevantcase( Idcasedevant, Idcasearrivee).

%Cas où carte seconde vaut plus de  2 (Case arrivee == Case devant coureur situé "juste devant"+Valeurcarteseconde-2)
depassement(Nomcoureur,Listecoureur,Valeurcarteseconde,Casearrivee):-
   Valeurcarteseconde>2,trouver_position(Nomcoureur,Listecoureur,Idcasecoureur), trouver_coureur(Idcasedevant,Listecoureur,Nomcoureurdevant), estjustedevantcase(Idcasecoureur, Idcasedevant), estjustedevantcase( Idcasedevant, Idcasedevantautrecoureur),
    numero(Idcasedevantautrecoureur,Num), Valeurrestante is Valeurcarteseconde-2,Numarrivee is Num + Valeurrestante, numero(Casearrivee,Numarrivee), estdevantcase(Idcasedevantautrecoureur,Casearrivee,Casearrivee).



%---------- Mouvement libre ----------------
%Mouvement libre représente le cas où il n'y pas d'aspiration( ou le joueur n'en a pas voulu) et pas de dépassement possible
%Le coureur est alors déplacé le plus ("loin possible"/ le plus proche possible de la ligne d'arrivée)
mouvementlibre(Nomcoureur,Valeurcarteseconde,Listeposition,Idcasearrivee):-
  trouver_position(Nomcoureur,Listecoureur,Idcase),numero(Idcase,Numcase),(for((estdevantcase(Idcase,Idcasearrivee,Idcasearrivee),casevide(Nomcoureur,Listeposition,Idcase)),0,Valeurcarteseconde)

% Mouvement libre ok
%si la carte seconde jouée appartient au joueur dont c'est le tour
%si la distance entre le coureur et celui le plus proche derrière après le déplacement est supérieure à 4

mouvementlibreok(Nomcoureur,Listecoureur,Listetas,Valeurcarteseconde,Coureurs):-
  coureurdejoueur(Nomjoueur, Listecoureur),tasdecartejoueur(Nomjoueur,Listetas,Tascartejoueur), member(Valeurcarteseconde,Cartessecondes),mouvementlibre(Nomcoureur,Listecoureur,Valeurcarteseconde,Casearrivee),regledesquatresec(Nomcoureur,Casearrivee,Listeposition).

/*
-----------------------------------
-----------------------------------
      Prédicats chute
-----------------------------------
*/



%Vérification chute grâce aux positions des coureurs

chute(Listecoureur,[],_).
chute(Listecoureur,[Nomcoureur|Listecoureurs],Case1):-
  coureurs(Coureurs),trouver_position(Nomcoureur,Listecoureur,Case1), foreach(member(Coureur, Coureurs),trouver_position(Coureur,Listecoureur,Case2),Nomcoureur/==Coureur, Case1==Case2,not(estcouloir(Case1)),not(estcouloir(Case2)))),chute(Listecoureur,Listecoureurs,Coureurs).


%Pour chaque coureur présent sur le lieu de chute, il est ajouté à la liste des coureurs dans la chute et dans celles des coureurs passant leur tour

miseajourpassetourinsert(Listepassetour,Coureur,Nouvlistepassetour):-
  insert(Listepassetour,Coureur,Nouvlistepassetour).

miseajourpassetourdelete(Listepassetour,Coureur,Nouvlistepassetour):-
  delete(Listepassetour,Coureur,Nouvlistepassetour).
%Ajoute les coureurs dans la largeur (sur même ligne) que lieu de chute à la liste des coureurs devant passer leur tour
%--> mettre à jour avce trouver_position
coureursentrainedanschute(Listeidcaseschute, Positions, Passetour,Listepassetour):-
   coureurs(Coureurs),foreach(member(Casechute,Listeidcaseschute),foreach(member(Nomcoureur,Coureurs),(trouver_position(Nomcoureur,Listecoureur,Case),member(Case,Listeidcaseschute),miseajourpassetourinsert(Listepassetour,Nomcoureur,Nouvlistepassetour),Listepassetour is Nouvlistepassetour))).



%Vérifie que la carte seconde dont  le joueur souhaite se défausser est dans sa liste de carte seconde

defaussecarte(Deck,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Joueur1,Carte,Cartessecondesrestantes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,NouvTascarte4]]):-
  tasdecartejoueur(Joueur1,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur1), member(Carte,Tasjoueur1), delete(Tasjoueur1,Carte,NouvTascarte1),insert(Deckcartes,Carte,Cartessecondesrestantes).

defaussecarte(Deck,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Joueur2,Carte,Cartessecondesrestantes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,NouvTascarte4]]):-
  tasdecartejoueur(Joueur2,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur2), member(Carte,Tasjoueur2), delete(Tasjoueur2,Carte,NouvTascarte2),insert(Deckcartes,Carte,Cartessecondesrestantes).

defaussecarte(Deck,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Joueur3,Carte,Cartessecondesrestantes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,NouvTascarte4]]):-
    tasdecartejoueur(Joueur3,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur3), member(Carte,Tasjoueur3), delete(Tasjoueur3,Carte,NouvTascarte3),insert(Deckcartes,Carte,Cartessecondesrestantes).

defaussecarte(Deck,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Joueur4,Carte,Cartessecondesrestantes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,NouvTascarte4]]):-
      tasdecartejoueur(Joueur4,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur4), member(Carte,Tasjoueur4), delete(Tasjoueur4,Carte,NouvTascarte4),insert(Deckcartes,Carte,Cartessecondesrestantes)


insert(X, [], [X]).
insert(X, [Y | Listeelements], [X,Y | listeelements]) :- X @< Y, !.
insert(X, [Y | Liste1], [Y | liste2]) :- insert(X, liste1, liste2).


repiocher5cartes(Joueur1, Deckcartes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Deck5,[[Joueur1,Nouvtas1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]]):-
   tasdecartejoueur(Joueur1,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur1), random_select(Cartechoisie1,Deckcartes, Deck1), nth0(0, Nouvtas1, Cartechoisie1),  random_select(Cartechoisie2, Deck1, Deck2), nth0(1, Nouvtas1, Cartechoisie2), random_select(Cartechoisie3,Deck2, Deck3), nth0(2, Nouvtas1, Cartechoisie3),
   random_select(Cartechoisie4,Deck3, Deck4), nth0(0, Nouvtas1, Cartechoisie4), random_select(Cartechoisie5,Deck4, Deck5), nth0(0, Nouvtas1, Cartechoisie5)

repiocher5cartes(Joueur2, Deckcartes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Deck5,[[Joueur1,Tasjoueur1],[Joueur2,Nouvtas2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]]):-
  tasdecartejoueur(Joueur2,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur2), random_select(Cartechoisie1,Deckcartes, Deck1), nth0(0, Nouvtas2, Cartechoisie1),  random_select(Cartechoisie2, Deck1, Deck2), nth0(1, Nouvtas2, Cartechoisie2), random_select(Cartechoisie3,Deck2, Deck3), nth0(2, Nouvtas2, Cartechoisie3),
  random_select(Cartechoisie4,Deck3, Deck4), nth0(0, Nouvtas2, Cartechoisie4), random_select(Cartechoisie5,Deck4, Deck5), nth0(0, Nouvtas2, Cartechoisie5)

repiocher5cartes(Joueur3,Deckcartes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Deck5,,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Nouvtas3],[Joueur4,Tasjoueur4]]):-
  tasdecartejoueur(Joueur3,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur3), random_select(Cartechoisie1,Deckcartes, Deck1), nth0(0, Nouvtas3, Cartechoisie1),  random_select(Cartechoisie2, Deck1, Deck2), nth0(1, Nouvtas3, Cartechoisie2), random_select(Cartechoisie3,Deck2, Deck3), nth0(2, Nouvtas3, Cartechoisie3),
  random_select(Cartechoisie4,Deck3, Deck4), nth0(0, Nouvtas3, Cartechoisie4), random_select(Cartechoisie5,Deck4, Deck5), nth0(0, Nouvtas3, Cartechoisie5)

repiocher5cartes(Joueur4, Deckcartes,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Deck5,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Nouvtas4]]):-
  tasdecartejoueur(Joueur4,[[Joueur1,Tasjoueur1],[Joueur2,Tasjoueur2],[Joueur3,Tasjoueur3],[Joueur4,Tasjoueur4]],Tasjoueur1), random_select(Cartechoisie1,Deckcartes, Deck1), nth0(0, Nouvtas4, Cartechoisie1),  random_select(Cartechoisie2, Deck1, Deck2), nth0(1, Nouvtas4, Cartechoisie2), random_select(Cartechoisie3,Deck2, Deck3), nth0(2, Nouvtas4, Cartechoisie3),
  random_select(Cartechoisie4,Deck3, Deck4), nth0(0, Nouvtas4, Cartechoisie4), random_select(Cartechoisie5,Deck4, Deck5), nth0(0, Nouvtas4, Cartechoisie5)


%Trouve à partir de la case départ de la chute en série la liste des identifiants de toutes les autres case impactées
lieudechute(Idcase,Listeidcaseschute):-
  numero(Idcase,Numero1),not(estcouloir(Case1)),listidcases(Listetoutescases),findall(Casechute, (member(Casechute, Listetoutescases), numero(Casechute,Numero2), Case1/==Casechute, Numero1==Numero2,not(estcouloir(Casechute))),Listeidcaseschute).

%Si case libre dans la largeur suivante, elle est renvoyée dans le prédicat de dépassement, et le coureur pourra y aller
caselibre(jeu(_,_,Listecoureur,_,_,_,_,_),[],Idcase2).
caselibre(jeu(_,_,Listecoureur,_,_,_,_,_),[C|Casessuivantes],Idcase2):- coureurs(Coureurs),foreach(member(Coureur,Coureurs),(trouver_position(Coureur,Listecoureur,Idcase),Idcase/=C)),Idcase2 is C,caselibre(Casessuivantes,Idcase2).

casevide(Coureur,Listecoureur,Idcase):-foreach(member(Coureur,Coureurs),(trouver_position(Coureur,Listecoureur,Idcase),Idcase/=C))

%Etablir les cases suivantes (largeur) à partir d'id
casessuivantesli([]).
caselibreapres(Idcase1,Coureurs,Casesuivantesli,Idcase2):- numero(Idcase1,Numero1),Numcaseapres,numero(Idcase,Numcaseapres),insert(Idcase,Casesuivantesli,Casessuivantes),length(Casessuivantes,L),L>1,caselibre(Casessuivantes,Coureurs,Idcase2),Numcaseapres is Numero+1.

%
% remplace un seul élément d'une liste de listes
% - La liste de listes  L
% - L'indice de la sous-liste où se trouve l'élément que l'on veut remplacer (X)
%   L'indice à l'intérieur de la sous-liste de l'élément que l'on veut remplacer (Y)
% - La valeur de remplacement Z
% - La liste de listes où l'élément voulu a été remplacé par Z
%
replace( L , X , Y , Z , R ) :-
  append(RowPfx,[Row|RowSfx],L),     % décompose la liste de listes en un  préfixe, une liste et un suffixe
  length(RowPfx,X) ,                 % vérifie si l'élément se trouve dans le suffixe
  append(ColPfx,[_|ColSfx],Row) ,    % décompose cette sous-liste en un préfixe un élément à part et un suffixe
  length(ColPfx,Y) ,                 % vérifie ce préfixe pour voir s'il contient l'élément voulu
  append(ColPfx,[Z|ColSfx],RowNew) , % si oui le remplace
  append(RowPfx,[RowNew|RowSfx],R)   % et réassemble la nouvelle liste de listes
  .

miseajourpositioncoureur(Nomcoureur,Nouvposition,Listepositions,Novlistepositions):-
  trouveridcoureur(Nomcoureur,Idcoureur), replace(Listepositions,Idcoureur, 1,Nouvposition,Novlistepositions).

% Ordre chute
%Ordre chute n'a pas pu être implémenter par manque de temps
% (l'ordre n'a pas d'influence dans la liste Passetour, on garde l'ordre actuel selon la phase courante (début ou dynamique))
%ordrechuteli([]).
%ordrechute(ListeCoureur,Ordre,Ordrechuteli,Ordrechuteliste):- nth0(_,ListeCoureur,[Nomcoureur,Case]),insert(Nomcoureur,Ordrechuteli,Ordrechuteliste),ordrechute(Ordrephasedynamique,Ordrechuteliste,Ordrechutelist).


% Gros prédicat chute en série (autre(s) coureur(s) sur largeur impacté(s))

chuteenserie(Deckcartes,Passetour,Listeposition):- coureurs(Coureurs), chute(Coureurs,Casedebutchute), lieudechute(Casedebutchute,Listeidcaseouchute),coureursentrainedanschute(Listeidcaseschute),foreach(member(Nomjoueur,Listeidcaseschute),defaussecarte(Deckcartes,Nomjoueur,Carte)).


 /*
 -----------------------------
 -----------------------------
     Prédicats gagnant
 -----------------------------
 */


%------- Calcul du temps de chacun des coureurs ---------

%Vérifie si un coureur a passé sa ligne d'arrivée --> utilisée pour le calcul du temps total +10 après chaque toour (dés qu'un coureur a passé la ligne d'arrivée)
apasselignearrivee(Nomcoureur,Case):-trouver_position(Nomcoureur,Listecoureur,Case),apresarrivee(Case) % Condition sur le numéro de case (??? ligne d'arrivée ==?)

%Met à jour le temps partiel d'un coureur lorsqu'il franchi la ligne d'arrivée selon la case sur laquelle il arrive
tempspartiellignearrivee(Listetemps,Nomcoureur,Casearrivee,Nouvlistetemps):-
  coureurdejoueur(Nomjoueur,Listecoureur),nth0(Y,Nomcoureur,Listecoureur),idjoueur(Nomjoueur,Idjoueur),nth0(Idjoueur,Sousliste,Listetemps), nth0(Idjoueur,Valeurcourante, Sousliste),numero(Casearrivee,Numcase),Decomptearrivee is 95-Numcase, Nouval is Decomptearrivee+ Valeurcourante,replace( Listetemps , Idjoueur , Y , Nouval , Nouvlistetemps ).

tempspartielplusdix(Listetemps,Nomcoureur,Nouvlistetemps):-
  coureurdejoueur(Nomjoueur,Listecoureur),nth0(Y,Nomcoureur,Listecoureur),idjoueur(Nomjoueur,Idjoueur),nth0(Idjoueur,Sousliste,Listetemps), nth0(Idjoueur,Valeurcourante, Sousliste),Nouval is 10+ Valeurcourante,replace( Listetemps , Idjoueur , Y , Nouval , Nouvlistetemps ).


%Obtention du temps total d'un joueur
tempstotal(Listetemps,Nomjoueur, Tempstotal):-
   idjoueur(Nomjoueur,Idjoueur),nth0(Idjoueur, Listetempsjoueur,Listetemps), sum_list(Listetempsjoueur,Tempstotal).

% ------- Définition du gagnant de la partie --------
gagnant(Listetemps,Gagnant):-
  tempstotal(Listetemps,Gagnant, Tempsmin), tempstotal(Listetemps,Perdant, Temps), tempstotal(Listetemps,Perdant1, Temps1), tempstotal(Listetemps,Perdant2, Temps2),
  Tempsmin<Temps, Tempsmin<Temps1,Tempsmin<Temps2.


occurrencede([] , _,0). %Cas de base liste vide

% Premier élément de la liste est celui dont on cherche le nombre d'occurrences
occurrencede([H|T] , H,NewCount):-
  occurrencede(T,H,OldCount), NewCount is OldCount +1.

%Premier élément est différent de celui dont on veut compter l'occurrences
occurrencede([H|T] , H2,Count):-
   dif(H,H2), occurrencede(T,H2,Count).

%2 gagnants (même temps total minimal)
deuxgagnant(Listetemps,Gagnant1,Gagnant2):-
  findall(Tempstotal, tempstotal(Listetemps,Joueur, Tempstotal),Listetemps), min_list(Listetemps, Minimum), occurrencede(Listetemps, Minimum, 2), tempstotal(Listetemps,Gagnant1,Minimum),  tempstotal(Listetemps,Gagnant2,Minimum).

%3 gagnants (même temps total minimal)
troisgagnant(Listetemps,Gagnant1,Gagnant2,Gagnant3):-
    findall(Tempstotal, tempstotal(Listetemps,Joueur, Tempstotal),Listetemps), min_list(Listetemps, Minimum), occurrencede(Listetemps, Minimum, 3), tempstotal(Listetemps,Gagnant1,Minimum),  tempstotal(Listetemps,Gagnant2,Minimum),tempstotal(Listetemps,Gagnant3,Minimum).

%4 gagnants (même temps total minimal)
quatregagnant(Listetemps,Gagnant1,Gagnant2,Gagnant3,Gagnant4):-
      findall(Tempstotal, tempstotal(Listetemps,Joueur, Tempstotal),Listetemps), min_list(Listetemps, Minimum), occurrencede(Listetemps, Minimum, 4), tempstotal(Listetemps,Gagnant1,Minimum),  tempstotal(Listetemps,Gagnant2,Minimum),tempstotal(Listetemps,Gagnant3,Minimum),tempstotal(Listetemps,Gagnant4,Minimum).


/*
-----------------------------
-----------------------------
    Fonction terminale
-----------------------------
(vérifie si le jeu est terminé)

*/
%Par rapport à la position de chaque coureur (ont-ils tous passé la ligne d'arrivée ?)
% Si  oui, alors ce prédicat est vrai et la partie est finie (vérification gagnant et affichage écran fin)

finjeu(Listeposition):- coureurs(Coureurs), foreach(member(C,Coureurs),(trouver_position(C,Listeposition,Poscoureur)),apresarrivee(Poscoureur))).
