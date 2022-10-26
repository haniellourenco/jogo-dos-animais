:- dynamic sim/1,nao/1.

/*  Programa principal  */

go:- hipotese(Animal),
      write('O animal que voce pensou eh um(a): '),
      write(Animal),
      nl,
      limpa_base.


/* Hipoteses a serem testadas */

hipotese(leopardo):- leopardo, !.
hipotese(tigre):- tigre, !.
hipotese(girafa):- girafa, !.
hipotese(zebra):- zebra, !.
hipotese(avestruz):- avestruz, !.
hipotese(pinguim):- pinguim, !.
hipotese(albatroz):- albatroz, !.
hipotese(desconhecido).


/* Regras para identificacao do animal  */

leopardo:- carnivoro,
	   verifica(tem_cor_amarelo_tostado),
	   verifica(tem_manchas_escuras).

tigre:- carnivoro,
        verifica(tem_cor_amarelo_tostado),
        verifica(tem_listras_pretas).

girafa:- ungulado,
         verifica(tem_pernas_longas),
         verifica(tem_pescoco_comprido),
         verifica(tem_cor_amarelo_tostado),
         verifica(tem_manchas_escuras).

zebra:- ungulado,
        verifica(tem_cor_branca),
        verifica(tem_listras_pretas).

avestruz:- ave,
           verifica(tem_pernas_longas),
           verifica(tem_pescoco_comprido),
           verifica(tem_cor_preta_branca).

pinguim:- ave, 
          verifica(nao_voa), 
          verifica(nada),
          verifica(tem_cor_preta_branca).

albatroz:- ave,
           verifica(e_um_bom_voador).


/* Regras de classificacao */

mamifero:- verifica(tem_pelos), !.
mamifero:- verifica(da_leite).

ave:- verifica(tem_penas), !.
ave:- verifica(voa), 
            verifica(bota_ovos).

carnivoro:- mamifero,
	    verifica(come_carne), !.
carnivoro:- mamifero,
	    verifica(tem_dentes_pontudos), 
            verifica(tem_garras),
            verifica(tem_olhos_frontais).

ungulado:- mamifero, 
           verifica(tem_casco), !.
ungulado:- mamifero, 
           verifica(rumina),
	   verifica(tem_dedos_pares).


/* Formulacao das perguntas */

pergunta(X):-
         write('O animal tem o seguinte atributo: '),
         write(X),
         write('? '),
         read(Resp),
         nl,
         ( (Resp == sim ; Resp == s)
           ->
            assert(sim(X)) ;
            assert(nao(X)), fail).


/* Verificacao */

verifica(S):-
        (sim(S) 
         ->
         true ;
         (nao(S)
          ->
          fail ;
          pergunta(S))).


/* Desfaz todos os fatos sim/1 e nao/1  */

limpa_base:- retract(sim(_)),fail. 
limpa_base:- retract(nao(_)),fail.
limpa_base.
