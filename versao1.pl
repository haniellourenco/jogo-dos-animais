
:- dynamic(resp/2).

caracteristica(animal,mamifero,[tem_pelo]).
caracteristica(animal,mamifero,[da_leite]).
caracteristica(animal,ave,[tem_penas]).
caracteristica(animal,ave,[voa,bota_ovos]).
caracteristica(mamifero,carnivoro,[come_carne]).
caracteristica(mamifero,carnivoro,[tem_dentes_pontudos,tem_garras,tem_olhos_frontais]).
caracteristica(mamifero,ungulado,[tem_casco]).
caracteristica(mamifero,ungulado,[rumina,tem_dedos_pares]).
caracteristica(carnivoro,leopardo,[tem_cor_amarelo_tostado,tem_manchas_escuras]).
caracteristica(carnivoro,tigre,[tem_cor_amarelo_tostado,tem_listras_pretas]).
caracteristica(ungulado,girafa,[tem_pernas_longas,tem_pescoco_comprido,
				tem_cor_amarelo_tostado,tem_manchas_escuras]).
caracteristica(ungulado,zebra,[tem_cor_branca,tem_listras_pretas]).
caracteristica(ave,avestruz,[tem_pernas_longas,tem_pescoco_comprido,tem_cor_preta_branca]).
caracteristica(ave,pinguim,[nao_voa,nada,tem_cor_preta_branca]).
caracteristica(ave,albatroz,[e_um_bom_voador]).


/* Programa que manipula o conhecimento acima definido. */

go:- nl, 
     write('Responda (sim ou nao)... '),
     nl, nl,
     encontra(X),
     nl,
     limpa_base,
     !.

encontra(Classe):-
  caracteristica(Classe,Subclasse,Lista),
  verifica_lista(Lista),
  encontra(Subclasse).

encontra(leopardo):- write('O animal eh um leopardo').
encontra(tigre):- write('O animal eh um tigre').
encontra(girafa):- write('O animal eh uma girafa ').
encontra(zebra):- write('O animal eh uma zebra ').
encontra(avestruz):- write('O animal eh um avestruz').
encontra(pinguim):- write('O animal eh um pinguim').
encontra(albatroz):- write('O animal eh um albatroz').

encontra(_):-
  nl,
  write('Nao conheco esse animal'),
  nl.

verifica_lista([]).
verifica_lista([X|Cauda]):-
  pergunte(X),
  verifica_lista(Cauda).

pergunte(A):-
  resp(A,sim).

pergunte(A):-
  resp(A,nao),fail.

pergunte(A):-
  not(resp(A,_)),
  write('O animal '),
  write(A),
  write('?'),
  read(Resp),
  nl,
  assert(resp(A,Resp)),
  Resp = sim.

limpa_base:- retract(resp(_,_)), fail.
limpa_base.
