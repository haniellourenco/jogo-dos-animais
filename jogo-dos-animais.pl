mamifero(ANIMAL) :-
    pelos(ANIMAL).
mamifero(ANIMAL):-
    leite(ANIMAL).
ave(ANIMAL):-
    penas(ANIMAL).
ave(ANIMAL):-
    voa(ANIMAL), oviparo(ANIMAL).
carnivoro(ANIMAL):-
    comecarne(ANIMAL).
carnivoro(ANIMAL) :-
    dpgoaf(ANIMAL).

ungulado(ANIMAL) :-
    mamifero(ANIMAL), cascos(ANIMAL).
ungulado(ANIMAL):-
    mamifero(ANIMAL), rumina(ANIMAL).
puma(ANIMAL):-
    mamifero(ANIMAL), manchasnegras(ANIMAL),corfulva(ANIMAL),carnivoro(ANIMAL).
tigre(ANIMAL):-
    mamifero(ANIMAL), manchasnegras(ANIMAL),corfulva(ANIMAL),carnivoro(ANIMAL).
girafa(ANIMAL):-
    ungulado(ANIMAL),pescomprido(ANIMAL),perncomprida(ANIMAL), manchasnegras(ANIMAL).
zebra(ANIMAL):-
    ungulado(ANIMAL),listrasnegras(ANIMAL).
avestruz(ANIMAL):-
    ave(ANIMAL), \+voa(ANIMAL), pb(ANIMAL), pescomprido(ANIMAL).
pinguim(ANIMAL):-
    ave(ANIMAL), \+voa(ANIMAL), nada(ANIMAL), pb(ANIMAL).
albatroz(ANIMAL):-
    ave(ANIMAL), voa(ANIMAL).
morcego(ANIMAL):-
    mamifero(ANIMAL), voa(ANIMAL).
baleia(ANIMAL):-
    mamifero(ANIMAL), sempelos(ANIMAL).