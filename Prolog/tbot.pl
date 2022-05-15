:- use_module(library(lists)).

/* --------------------------------------------------------------------- */
/*                                                                       */
/*        PRODUIRE_REPONSE(L_Mots,L_Lignes_reponse) :                    */
/*                                                                       */
/*        Input : une liste de mots L_Mots representant la question      */
/*                de l'utilisateur                                       */
/*        Output : une liste de liste de mots correspondant a la         */
/*                 reponse fournie par le bot                            */
/*                                                                       */
/*        NB Pour l'instant le predicat retourne dans tous les cas       */
/*            [  [je, ne, sais, pas, '.'],                               */
/*               [les, etudiants, vont, m, '\'', aider, '.'],            */
/*               ['vous le verrez !']                                    */
/*            ]                                                          */
/*                                                                       */
/*        Je ne doute pas que ce sera le cas ! Et vous souhaite autant   */
/*        d'amusement a coder le predicat que j'ai eu a ecrire           */
/*        cet enonce et ce squelette de solution !                       */
/*                                                                       */
/*        J.-M. Jacquet, janvier 2022                                    */
/*                                                                       */
/* --------------------------------------------------------------------- */


/*                      !!!    A MODIFIER   !!!                          */

produire_reponse([fin],[L1]) :-
   L1 = [merci, de, m, '\'', avoir, consulte], !.

produire_reponse(L,Rep) :-
%   write(L),
   mclef(M,_), member(M,L),
   clause(regle_rep(M,_,Pattern,Rep),Body),
   match_pattern(Pattern,L),
   call(Body), !.

produire_reponse(_,[L1,L2, L3]) :-
   L1 = [je, ne, sais, pas, '.'],
   L2 = [les, etudiants, vont, m, '\'', aider, '.' ],
   L3 = ['vous le verrez !'].

match_pattern(Pattern,Lmots) :-
   sublist(Pattern,Lmots).

match_pattern(LPatterns,Lmots) :-
   match_pattern_dist([100|LPatterns],Lmots).

match_pattern_dist([],_).
match_pattern_dist([N,Pattern|Lpatterns],Lmots) :-
   within_dist(N,Pattern,Lmots,Lmots_rem),
   match_pattern_dist(Lpatterns,Lmots_rem).

within_dist(_,Pattern,Lmots,Lmots_rem) :-
   prefixrem(Pattern,Lmots,Lmots_rem).
within_dist(N,Pattern,[_|Lmots],Lmots_rem) :-
   N > 1, Naux is N-1,
  within_dist(Naux,Pattern,Lmots,Lmots_rem).


sublist(SL,L) :-
   prefix(SL,L), !.
sublist(SL,[_|T]) :- sublist(SL,T).

sublistrem(SL,L,Lr) :-
   prefixrem(SL,L,Lr), !.
sublistrem(SL,[_|T],Lr) :- sublistrem(SL,T,Lr).

prefixrem([],L,L).
prefixrem([H|T],[H|L],Lr) :- prefixrem(T,L,Lr).


% ----------------------------------------------------------------%

nb_coureurs(3).
nb_equipes(4).

% ----------------------------------------------------------------%

mclef(commence,10).
mclef(equipe,5).
mclef(but,5).
mclef(preparation,5).
mclef(debut,2).
mclef(premiere,5).
mclef(dynamique,5).
mclef(cases,5).
mclef(aspiration,5).
mclef(echange,5).
mclef(chance,5).
mclef(sprint,5).
mclef(montee,5).
mclef(descente,5).
mclef(chutes,5).
mclef(depassement,5).
mclef(termine,5).
mclef(secondes, 5).
mclef(points,5).
mclef(classement, 5).
mclef(intermediaire, 5).

% ----------------------------------------------------------------%

regle_rep(commence,10,
  [qui, commence, le, jeu ],
  [ [ "c'est", au, joueur, ayant, la, plus, haute, carte, secondes, de ],
    [ "commencer." ] ] ).

% ----------------------------------------------------------------%

regle_rep(equipe,5,
  [ [ combien ], 3, [ coureurs], 5, [ equipe ] ],
  [ [ chaque, equipe, compte, X, "coureurs." ] ]) :-

     nb_coureurs(X).

%-----------------------------------------------------------------%

regle_rep(but,5,
   [ [quel],3,[but],4,[jeu]],
   [ [dans, ce, jeu, vous, participez, aux, etapes, par, equipe, de, trois, coureurs, votre, equipe, doit, tenter, d, '\'', obtenir, le, meilleur, score, possible,
      le, classement, est, tenu, par, joueur, et, par, equipe, un, tour, comprends, plusieurs, etapes, le, coureur, le, plus, rapide, sur, l, '\'', ensemble, des,
      etapes, porte, le, maillot, jaune, le, vainqueur, du, tour, est, le, joueur, dont, l, '\'', equipe, obtient, le, meilleur, temps, et, remporte, le, plus, de,
      points, au, classement, general]]).

%-----------------------------------------------------------------%

regle_rep(preparation,5,
   [ [comment], 3, [preparer], 1, [partie]],
   [ [determinez, tout, d, '\'', abord, le, nombre, d, '\'', etapes, de, la, partie, vous, trouverez, dans, la, boite, le, plateau, de, jeu, recto,
      verso, une, face, represente, une, etape, de, plaine, et, l, '\'', autre, de, montagne, nous, vous, conseillons, de, commencer, par, le, plat, le,
      joueur, qui, pioche, la, carte, seconde, la, plus, elevee, commence, melangez, toutes, les, cartes, secondes, et, distribuez, cinq, cartes, par,
      coureurs, lorsque, vous, aurez, joue, toutes, vos, cartes, vous, recevrez, cinq, nouvelles, cartes, seconde, par, coureur, designez, ensuite, quel, joueur,
      charge, de, tenir, le, classement, en, notant, les, resultats, a, chaque, etapes]]).

%-----------------------------------------------------------------%

regle_rep(debut, 2,
   [ [debut], 2, [partie]],
   [ [lorsque, les, cartes, sont, distribuees, la, partie, peut, commencer, le, premier, joueur, choisit, une, de, ses, cartes, seconde, et, la, pose, sur, la, table,
      il, deplace, son, premier, coureurs, du, nombre, de, secondes, '\'', de, cases, '\'', correspondant, a, la, carte, seconde, jouee, vous, determinez, vous, meme,
      le, rythme, de, votre, coureur, ce, dernier, peut, se, deplacer, tout, droit, ou, en, diagonale, mais, pas, sur, le, cote, '\'', meme, numero, de, case, '\'', ni,
      en, arriere, vous, ne, pouvez, pas, traverse, de, case, deja, occupe, car, risque, de, chute, en, serie]]).

%-----------------------------------------------------------------%

regle_rep(premiere,5,
   [ [premiere], 1, [phase], 1, [jeu]],
   [ [une, fois, que, le, premier, joueur, a, deplace, son, premier, coureur, les, autres, joueurs, deplacent, leur, premier, coureur, dans, le, sens, des, aiguilles, d,
   '\'', une, montre, le, premier, joueur, deplace, son, deuxieme, coureur, puis, les, autres, joueurs, deplacent, leur, deuxieme, coureurs, et, ainsi, de, suite, jusqu,
   '\'', a, ce, que, chaque, joueur, ait, place, ses, joueurs, sur, le, plateau]]).

%-----------------------------------------------------------------%

regle_rep(dynamique,5,
   [ [phase], 1, [jeu], 1, [dynamique]],
   [ [une, fois, que, tous, les, coureurs, sont, places, sur, le, plateau, de, jeu, la, phase, de, jeu, dynamique, commence, le, coureur, de, tete, est, deplace, en, premier,
     puis, c, '\'', est, le, tour, du, coureur, en, position, deux, puis, trois, etc, jusqu, '\'', au, coureur, en, queue, de, peloton, puis, on, recommence, avec, le, nouveau, coureur, de, tete, et, ainsi, de, suite ]]).

%-----------------------------------------------------------------%

regle_rep(cases,5,
   [ [numero], 2, [cases]],
   [ [le, cote, du, parcours, constitue, de, cases, numerotees, sur, lesquelles, les, coureurs, sont, a, l, '\'', abri, du, vent, et, avancent, plus, rapidement, est, le, cote,
     prioritaire, le, coureur, qui, se, situe, sur, le, cote, prioritaire, passe, avant, les, autres, joueurs, qui, se, situe, sur, des, cases, voisines, dans, les, virages, les,
     numeros, sont, accomagnes, de, lettres, pour, faciliter, la, comprehension, de, la, decoupe, des, cases]]).

%-----------------------------------------------------------------%

regle_rep(aspiration, 5,
   [ [comment], 1, [fonctionne], 1, [aspiration]],
   [ [le, coureur, profite, du, phenomene, d, '\'', aspiration, et, de, prise, de, vitesse, qui, en, resulte, lorsqu, '\'', est, au, sein, du, peloton, ou, directement, derriere,
     un, autre, coureur, la, prise, de, vitesse, permet, d, '\'', avancer, d, '\'', une, seconde, supplementaire, sur, une, etape, de, plaine, le, coureur, avance, d, '\'', une, case,
     de, plus, que, la, valeur, de, la, carte, jouee, si, cela, lui, permet, ensuite, de, se, positionner, derriere, ou, a, cote, d, '\'', un, autre, coureur, le, coureur, de, tete, ne,
     peut, pas, profiter, du, phenomene, d, '\'', aspiration, mais, il, en, fait, profiter, les, autres, coureurs, qui, le, suivent, la, prise, de, vitesse, n, '\'', est, pas, obligatoire,
     si, elle, ne, s, '\'', avere, pas, avantageuse]]).

%-----------------------------------------------------------------%

regle_rep(echange, 5,
   [ [comment], 1, [fonctionnent], 1, [cases], 2, [echange]],
   [ [sur, le, parcous, vous, trouverez, des, cases, '\'', echange, '\'', si, un, membre, de, votre, equipe, s, '\'', arrete, sur, cette, case, vous, devez, vous, defaussez, de, trois, cartes,
     seconde, et, en, piocher, trois, nouvelles, si, vous, avez, moins, de, trois, cartes, en, main, a, cet, instant, vous, devez, echanger, toutes, vos, cartes, seconde]]).

%-----------------------------------------------------------------%

regle_rep(chance, 5,
   [ [comment], 1, [fonctionnent], 1, [cases], 2, [chance]],
   [ [si, vous, vous, arretez, sur, une, carte, chance, vous, devez, piocher, une, carte, chance, et, l, '\'', utiliser, immediatement, sauf, mention, contraire, la, carte, chance, doit, etre,
     utilisee, par, le, coureur, qui, s, '\'', y, arrete, un, deplacement, du, a, une, carte, chance, ne, peut, pas, provoquer, de, chute, en, serie, il, est, toutefois, possible, que, la, carte,
     deplace, le, coureur, vers, une, chute, ayant, deja, eu, lieu, ou, que, la, carte, chance, soit, destinnee, a, provoquer, une, chute, en, serie]]).

%-----------------------------------------------------------------%

regle_rep(sprint, 5,
   [ [comment], 1, [fonctionnent], 1, [sprint], 0, [intermediaire]],
   [ [en, passant, un, sprint, intermediaire, un, ou, plusieurs, coureurs, peuvent, gagner, des, secondes, de, bonification, et, des, points, de, bonification, ceux, ci, sont, indiques, au, niveau,
     des, sprints, intermediare, ces, secondes, et, '\'', ou, points, sont, notes, directement, sur, le, classement, pour, determiner, le, classement, intermediaire, a, la, fin, de, l, '\'', etape,
     les, secondes, de, bonification, sont, retirees, du, temps, du, coureur, et, les, points, de, bonification, sont, ajoutes, au, score, de, son, equipe]]).

%-----------------------------------------------------------------%

regle_rep(montee, 5,
   [ [quels], 2, [changements], 3, [montee]],
   [ [en, montee, les, coureurs, avancent, nettement, moins, vite, que, sur, une, etape, de, plaine, les, cases, sont, situees, en, montee, sont, marquees, par, des, fleches, rouges, pour, determiner,
     la, vitesse, d, '\'', un, coureur, en, montee, divisez, par, deux, la, valeur, de, la, carte, jouee, et, arrondissez, au, plus, bas, un, coureur, en, montee, ne, peut, pas, profiter, du, phenemone,
     d, '\'', aspiration]]).

%-----------------------------------------------------------------%

regle_rep(descente, 5,
   [ [quels], 2, [changements], 3, [descente]],
   [ [les, cases, situees, en, descente, sont, marquees, par, des, fleches, bleues, en, descente, les, regles, sont, les, memes, que, sur, une, etape, de, plaine, a, l, '\'', exception, du, phenomene, d,
    '\'', aspiration, la, prise, de, vitesse, equivaut, alors, a, deux, secondes, au, lieu, d, '\'', une, seconde, autre, difference, importante, en, utilisant, une, prise, de, vitesse, de, deux, secondes,
    vous, pouvez, doubler, le, coureur, situe, devant, vous, vous, pouvez, depasser, le, coureur, d, '\'', une, case, maximum, et, prendre, la, tete, de, la, course, comme, pour, les, etapes, de, plaine, vous,
    n, '\'', etes, pas, oblige, d, '\'', utiliser, la, prise, de, vitesse, vous, pouvez, donc, avancer, d, '\'', une, seconde, au, lieu, de, deux, si, cela, s, '\'', avere, plus, prioritaire]]).

%-----------------------------------------------------------------%

regle_rep(chutes, 5,
   [ [comment], 1, [chutes], 2, [arriver]],
   [ [une, chute, en, serie, peut, etre, provoquer, par, une, carte, chance, ou, par, le, deplacement, d, '\'', un, coureur, il, n, '\'', est, pas, possible, de, passer, par, la, case, d, '\'', un, autre, coureurs,
     ou, de, s, '\'', y, arreter, tout, contact, entre, deux, coureurs, provoque, une, chute, en, serie, lors, d, '\'', une, chute, en, serie, les, coureurs, concernes, doivent, se, defausser, d, '\'', une, carte, seconde,
     puis, passer, un, tour, une, chute, en, serie, a, lieu, sur, toute, la, largeur, de, la, route, et, implique, les, coureurs, suivants, le, coureurs, ayant, provoque, la, chute, le, coureur, avec, lequel, il, est, entre,
     en, contact, tous, les, coureurs, situes, sur, les, cases, adjacentes, portant, le, meme, numero, y, compris, les, lettres, et, tous, les, coureurs, qui, ne, peuvent, pas, freiner, a, temps, et, arrivent, sur, une, des, cases,
     affectes, par, l, '\'', accident, attention, si, la, chute, est, provoque, par, une, carte, chance, vous, devez, ranger, ensuite, la, carte, en, dessous, du, paquet, et, melanger, de, nouveau, toutes, les, cartes, chance, attention,
     lorsque, les, deux, voies, d, '\'', une, route, sont, separees, par, un, terre, plein, l, '\'', autre, voie, n, '\'', est, pas, affectee, par, la, chute, en, serie, si, la, case, ou, se, trouve, le, coureur, est, entierement, separee, des,
     cases, affectees, par, l, '\'', accident, enfin, les, coureurs, impliques, dans, une, chute, en, serie, sont, places, sur, le, bord, de, la, route, a, l, '\'', endroit, de, l, '\'', accident, positionner, les, coureurs, dans, l, '\'',
     ordre, de, la, chute, du, coureur, qui, a, provoque, la, chute, a, celui, qui, a , rejoint, plus, tard, le, lieu, de, l, '\'', accident, une, fois, qu, '\'', ils, ont, tous, passe, leur, tour, ils, repartiront, dans, cet, ordre, lorsque,
     les, joueurs, ayant, chutes, passent, leur, tour, les, autres, coureurs, peuvent, traverser, la, zone, normalement, attention, si, vous, avez, le, choix, entre, plusieurs, voies, et, qu, '\'', une, chute, en, serie, est, inevitable, vous,
     devez, opter, pour, la, case, cide, la, plus, eloignee, des, cases, numerotees, afin, que, la, chute, en, serie, n, '\'', ait, pas, lieu, sur, le, cote, prioritaire, de, la, route]]).

%-----------------------------------------------------------------%

regle_rep(depassement, 5,
   [ [comment], 3, [fonctionne], 2, [depassement]],
   [ [pour, limiter, le, nombre, de, chutes, en, serie, un, coureur, qui, choisit, deliberement, d, '\'', avancer, lentement, doit, systematiquement, tenir, compte, des, coureurs, qui, le, suivent, c, '\'', est, la, que, s, '\'', applique, la, regle,
     de, depassement, vous, devez, laisse, au, coureur, situe, juste, derriere, vous, la, possibilite, d, '\'', utiliser, une, carte, quatre, secondes, ou, une, carte, six, secondes, si, en, montee, sauf, si, ce, coureur, peut, vous, doubler, normalement,
     les, coureurs, suivants, n, '\'', ont, le, droit, de, provoquer, une, chute, en, serie, que, si, cette, derniere, est, inevitable, le, joueur, a, l, '\'', origine, de, la, chute, doit, alors, montrer, ses, cartes, secondes, restantes, afin, de, prouver,
     qu, '\'', il, ne, pouvait, pas, faire, autrement]]).

%-----------------------------------------------------------------%

regle_rep(termine, 5,
   [ [comment], 2, [termine], 1, [etape]],
   [ [le, coureur, qui, termine, le, plus, loin, derriere, la, ligne, d, '\'', arrivee, obtient, le, meilleur, temps, et, gagne, l, '\'', etape, comment, calculer, et, noter, le, temps, de, chaque, coureur, les, coureurs, qui, passe, la, ligne, d, '\'',
     arrivee, combinent, le, chiffre, inscrit, dans, leur, case, d, '\'', arrivee, au, nombre, total, de, cases, de, l, '\'', etape, par, exemple, si, l, '\'', etape, fait, nonente, cinq, cases, et, que, le, coureur, termine, sur, la, case, moins, quatre, alors, nonente, cinq,
     moins, quatre, egal, nonente, et, un, secondes, le, phenomene, d, '\'', aspiration, ne, peut, pas, etre, utilise, apres, la, ligne, d, '\'', arrivee, une, chute, en, serie, ne, peut, pas, non, plus, se, produire, apres, la, ligne, d, '\'', arrivee, les, coureurs, peuvent,
     avancer, sur, la, voie, de, deceleration, la, ou, il, y, a, de, la, place, et, rejoindre, les, autres, coureurs, si, la, valeur, de, la, carte, seconde, jouee, est, superieure, au, nombre, de, cases, disponibles, les, secondes, restantes, disponibles, sont,
     perdues, si, plusieurs, coureurs, terminent, sur, des, cases, de, meme, valeur, lors, d, '\'', un, meme, tour, le, coureur, situe, sur, la, case, numerotee, l, '\'', emporte, mais, les, joueurs, inscrivent, le, meme, temps, d, '\'', arrivee, au, classement,
     souvent, les, joueurs, ne, depassent, pas, tous, la, ligne, d, '\'', arrivee, lors, du, meme, tour, les, coureurs, qui, terminent, lors, d, '\'', un, tour, suivant, ne, peuvent, jamais, obtenir, un, meilleur, temps, que, les, coureurs, ayant, deja, termine,
     dans, ce, cas, la, regle, de, calcul, est, la, suivante, apres, chaque, tour, dix, secondes, sont, ajoutees, au, temps, d, '\'', arrivee, si, les, coureurs, qui, n, '\'', ont, pas, encore, termnine, parviennent, a, passer, la, ligne, d, '\'', arrivee, au, tour,
     suivant, leur, temps, est, calcule, comme, suit, nombre, de, cases, de, l, '\'', etape, plus, dix, secondes, de, penalite, au, tour, suivant, moins, le, nombre, de, cases, situees, apres, la, ligne, d, '\'', arrivee, cela, permet, a, tous, les, coureurs, de, temriner,
     la, course, a, chaque, nouveau, tour, de, jeu, n, '\'', oubliez, pas, d, '\'', ajouter, les, dix, secondes, de, penalite, aux, temps, d, '\'', arrivee, des, coureurs, encore, en, lice]]).

%-----------------------------------------------------------------%

regle_rep(secondes, 5,
   [ [comment], 2, [secondes], 1, [bonification]],
   [ [lors, d, '\'', une, etape, le, joueur, obtient, des, secondes, de, bonification, lors, de, sprints, intermediaires, ces, secondes,compteront, dans, le, temps, final, des, coureurs, au, classment, par, exemple, si, un, coureur, a, gagne, quatre, secondes, de, bonification,
     son, temps, est, calcule, comme, suit, total, des, secondes, de, l, '\'', etape, moins, les, quatre, secondes, de, bonification, moins, le, nombre, de, cases, situees, apres, la, ligne, d, '\'', arrivee, attention, les, secondes, de, bonification, comptent, uniquement, dans,
     le, classement, intermediaire, et, le, classement, general, elles, ne, comptent, pas, dans, le, calcul, du, resultat, d, '\'', une, etape, et, seront, directement, integrees, au, classement, sprints, intermediaires, pour, determiner, qui, portera, le, maillot, jaune]]).

%-----------------------------------------------------------------%

regle_rep(points,5,
   [ [comment], 2, [points], 1, [bonification]],
   [ [lors, d, '\'', une, etape, le, joueur, obtient, des, points, de, bonification, lors, des, sprints, intermediaires, le, classement, par, points, vaut, pour, toute, une, equipe, les, points, obtenus, par, tous, les, coureurs, d, '\'', une, equipe, sont, additionnes, par, equipe]]).

%-----------------------------------------------------------------%

regle_rep(classement, 5,
   [ [comment], 2, [calculer], 1, [classement], 1, [points]],
   [ [le, classement, par, points, est, un, classement, par, equipes, vos, coureurs, peuvent, gagner, des, points, pour, votre, equipe, toute, entiere, a, chaque, etape, en, plus, des, secondes, de, bonification, vous, pouvez, gagner, des, points, en, fonction, de, la, place, d, '\'', arrivee,
     de, vos, coureurs, a, la, fin, de, l, '\'', etape, formule, de, calcul, des, points, total, des, points, egal, '\'', onze, moins, position, d, '\'', arrivee, du, coureur, soit, zero, si, negatif, plus, les, points, de, bonification, obtenus]]).

%-----------------------------------------------------------------%

regle_rep(intermediaire, 5,
   [ [comment], 2, [calculer], 1, [classement], 1, [intermediaire]],
   [ [le, classement, des, sprints, intermediaires, est, calcule, apres, chaque, etape, pour, determiner, qui, portera, le, maillot, jaune, l, '\'', equipe, la, plus, rapide, et, le, meneur, du, classement, par, points, le, coureur, qui, obtient, le, meilleur, score, total, est, le, coureur, le, plus,
     rapide, du, classement, intermediaire, et, obtient, le, maillot, jaune, a, la, fin, de, la, partie, le, maillot, jaune, remporte, des, points, supplementaires, si, vous, decidez, de, ne, jouer, qu, '\'', une, seule, etape, il, n, '\'', y, aura, pas, de, classement, intermediaire, et, le, coureur, le,
     plus, rapide, de, l, '\'', etape, remportera, directement, le, maillot, jaune]]).

%-----------------------------------------------------------------%


/* --------------------------------------------------------------------- */
/*                                                                       */
/*          CONVERSION D'UNE QUESTION DE L'UTILISATEUR EN                */
/*                        LISTE DE MOTS                                  */
/*                                                                       */
/* --------------------------------------------------------------------- */

% lire_question(L_Mots)

lire_question(LMots) :- read_atomics(LMots).

/*****************************************************************************/
% my_char_type(+Char,?Type)
%    Char is an ASCII code.
%    Type is whitespace, punctuation, numeric, alphabetic, or special.

my_char_type(46,period) :- !.
my_char_type(X,alphanumeric) :- X >= 65, X =< 90, !.
my_char_type(X,alphanumeric) :- X >= 97, X =< 123, !.
my_char_type(X,alphanumeric) :- X >= 48, X =< 57, !.
my_char_type(X,whitespace) :- X =< 32, !.
my_char_type(X,punctuation) :- X >= 33, X =< 47, !.
my_char_type(X,punctuation) :- X >= 58, X =< 64, !.
my_char_type(X,punctuation) :- X >= 91, X =< 96, !.
my_char_type(X,punctuation) :- X >= 123, X =< 126, !.
my_char_type(_,special).


/*****************************************************************************/
% lower_case(+C,?L)
%   If ASCII code C is an upper-case letter, then L is the
%   corresponding lower-case letter. Otherwise L=C.

lower_case(X,Y) :-
	X >= 65,
	X =< 90,
	Y is X + 32, !.

lower_case(X,X).


/*****************************************************************************/
% read_lc_string(-String)
%  Reads a line of input into String as a list of ASCII codes,
%  with all capital letters changed to lower case.

read_lc_string(String) :-
	get0(FirstChar),
	lower_case(FirstChar,LChar),
	read_lc_string_aux(LChar,String).

read_lc_string_aux(10,[]) :- !.  % end of line

read_lc_string_aux(-1,[]) :- !.  % end of file

read_lc_string_aux(LChar,[LChar|Rest]) :- read_lc_string(Rest).


/*****************************************************************************/
% extract_word(+String,-Rest,-Word) (final version)
%  Extracts the first Word from String; Rest is rest of String.
%  A word is a series of contiguous letters, or a series
%  of contiguous digits, or a single special character.
%  Assumes String does not begin with whitespace.

extract_word([C|Chars],Rest,[C|RestOfWord]) :-
	my_char_type(C,Type),
	extract_word_aux(Type,Chars,Rest,RestOfWord).

extract_word_aux(special,Rest,Rest,[]) :- !.
   % if Char is special, don't read more chars.

extract_word_aux(Type,[C|Chars],Rest,[C|RestOfWord]) :-
	my_char_type(C,Type), !,
	extract_word_aux(Type,Chars,Rest,RestOfWord).

extract_word_aux(_,Rest,Rest,[]).   % if previous clause did not succeed.


/*****************************************************************************/
% remove_initial_blanks(+X,?Y)
%   Removes whitespace characters from the
%   beginning of string X, giving string Y.

remove_initial_blanks([C|Chars],Result) :-
	my_char_type(C,whitespace), !,
	remove_initial_blanks(Chars,Result).

remove_initial_blanks(X,X).   % if previous clause did not succeed.


/*****************************************************************************/
% digit_value(?D,?V)
%  Where D is the ASCII code of a digit,
%  V is the corresponding number.

digit_value(48,0).
digit_value(49,1).
digit_value(50,2).
digit_value(51,3).
digit_value(52,4).
digit_value(53,5).
digit_value(54,6).
digit_value(55,7).
digit_value(56,8).
digit_value(57,9).


/*****************************************************************************/
% string_to_number(+S,-N)
%  Converts string S to the number that it
%  represents, e.g., "234" to 234.
%  Fails if S does not represent a nonnegative integer.

string_to_number(S,N) :-
	string_to_number_aux(S,0,N).

string_to_number_aux([D|Digits],ValueSoFar,Result) :-
	digit_value(D,V),
	NewValueSoFar is 10*ValueSoFar + V,
	string_to_number_aux(Digits,NewValueSoFar,Result).

string_to_number_aux([],Result,Result).


/*****************************************************************************/
% string_to_atomic(+String,-Atomic)
%  Converts String into the atom or number of
%  which it is the written representation.

string_to_atomic([C|Chars],Number) :-
	string_to_number([C|Chars],Number), !.

string_to_atomic(String,Atom) :- name(Atom,String).
  % assuming previous clause failed.


/*****************************************************************************/
% extract_atomics(+String,-ListOfAtomics) (second version)
%  Breaks String up into ListOfAtomics
%  e.g., " abc def  123 " into [abc,def,123].

extract_atomics(String,ListOfAtomics) :-
	remove_initial_blanks(String,NewString),
	extract_atomics_aux(NewString,ListOfAtomics).

extract_atomics_aux([C|Chars],[A|Atomics]) :-
	extract_word([C|Chars],Rest,Word),
	string_to_atomic(Word,A),       % <- this is the only change
	extract_atomics(Rest,Atomics).

extract_atomics_aux([],[]).


/*****************************************************************************/
% clean_string(+String,-Cleanstring)
%  removes all punctuation characters from String and return Cleanstring

clean_string([C|Chars],L) :-
	my_char_type(C,punctuation),
	clean_string(Chars,L), !.
clean_string([C|Chars],[C|L]) :-
	clean_string(Chars,L), !.
clean_string([C|[]],[]) :-
	my_char_type(C,punctuation), !.
clean_string([C|[]],[C]).


/*****************************************************************************/
% read_atomics(-ListOfAtomics)
%  Reads a line of input, removes all punctuation characters, and converts
%  it into a list of atomic terms, e.g., [this,is,an,example].

read_atomics(ListOfAtomics) :-
	read_lc_string(String),
	clean_string(String,Cleanstring),
	extract_atomics(Cleanstring,ListOfAtomics).



/* --------------------------------------------------------------------- */
/*                                                                       */
/*        ECRIRE_REPONSE : ecrit une suite de lignes de texte            */
/*                                                                       */
/* --------------------------------------------------------------------- */

ecrire_reponse(L) :-
   nl, write('TBot :'),
   ecrire_li_reponse(L,1,1).

% ecrire_li_reponse(Ll,M,E)
% input : Ll, liste de listes de mots (tout en minuscules)
%         M, indique si le premier caractere du premier mot de
%            la premiere ligne doit etre mis en majuscule (1 si oui, 0 si non)
%         E, indique le nombre d'espaces avant ce premier mot

ecrire_li_reponse([],_,_) :-
    nl.

ecrire_li_reponse([Li|Lls],Mi,Ei) :-
   ecrire_ligne(Li,Mi,Ei,Mf),
   ecrire_li_reponse(Lls,Mf,2).

% ecrire_ligne(Li,Mi,Ei,Mf)
% input : Li, liste de mots a ecrire
%         Mi, Ei booleens tels que decrits ci-dessus
% output : Mf, booleen tel que decrit ci-dessus a appliquer
%          a la ligne suivante, si elle existe

ecrire_ligne([],M,_,M) :-
   nl.

ecrire_ligne([M|L],Mi,Ei,Mf) :-
   ecrire_mot(M,Mi,Maux,Ei,Eaux),
   ecrire_ligne(L,Maux,Eaux,Mf).

% ecrire_mot(M,B1,B2,E1,E2)
% input : M, le mot a ecrire
%         B1, indique s'il faut une majuscule (1 si oui, 0 si non)
%         E1, indique s'il faut un espace avant le mot (1 si oui, 0 si non)
% output : B2, indique si le mot suivant prend une majuscule
%          E2, indique si le mot suivant doit etre precede d'un espace

ecrire_mot('.',_,1,_,1) :-
   write('. '), !.
ecrire_mot('\'',X,X,_,0) :-
   write('\''), !.
ecrire_mot(',',X,X,E,1) :-
   espace(E), write(','), !.
ecrire_mot(M,0,0,E,1) :-
   espace(E), write(M).
ecrire_mot(M,1,0,E,1) :-
   name(M,[C|L]),
   D is C - 32,
   name(N,[D|L]),
   espace(E), write(N).

espace(0).
espace(N) :- N>0, Nn is N-1, write(' '), espace(Nn).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*                            TEST DE FIN                                */
/*                                                                       */
/* --------------------------------------------------------------------- */

fin(L) :- member(fin,L).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*                         BOUCLE PRINCIPALE                             */
/*                                                                       */
/* --------------------------------------------------------------------- */

tourdefrance :-

   nl, nl, nl,
   write('Bonjour, je suis TBot, le bot explicateur du Tour de France.'), nl,
   write('En quoi puis-je vous aider ?'),
   nl, nl,

   repeat,
      write('Vous : '), ttyflush,
      lire_question(L_Mots),
      produire_reponse(L_Mots,L_ligne_reponse),
      ecrire_reponse(L_ligne_reponse),
   fin(L_Mots), !.


/* --------------------------------------------------------------------- */
/*                                                                       */
/*             ACTIVATION DU PROGRAMME APRES COMPILATION                 */
/*                                                                       */
/* --------------------------------------------------------------------- */

:- tourdefrance.
