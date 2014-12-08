%
% * UnB - Universidade de Brasília
% * CIC - Departamento de Ciência da Computação
% * IA - Introdução a Inteligência Artificial
% * 
% * @author zidenis
% * @version 0.1 (24/11/2014)
%
%% Base de Regras

% Regra para identificar cores diferentes entre si
% diferente(X, Y)
%  X : uma cor (ex.: vermelha)
%  Y : outra cor (ex.: verde)

diferente(X,Y) :- 
	cor(X),
	cor(Y),
	X \= Y.

% Regra que irá colorir um mapa (encontrar uma solução válida)
% colorir_Mapa(Id_Mapa)
%  Id_Mapa : identificador do mapa na KB (ex: nordeste) 

colorir_Mapa(Id_Mapa) :-
	retractall(cor_Area(_,_)),	% remove da KB fatos previamente inseridos dinamicamente 
	mapa(Id_Mapa, Lista_Areas), % unifica Lista_Areas com a áreas do mapa a ser colorido
	colorir_Areas(Lista_Areas), % encontra uma solução de coloração para o mapa
	assert_Areas(Lista_Areas),  % insere dinamicamente na KB novos fatos relacionando áreas à cores
	!.

% Regra que irá colorir um mapa (encontrar uma solução válida), considerando a restrição de que uma area deve ter uma cor determinada
% colorir_Mapa(Id_Mapa, idArea, idCor) :-
%  Id_Mapa : identificador do mapa na KB (ex: nordeste)
%  idArea : identificador de área do mapa (ex: pb)
%  idCor : identificador de cor (ex: red)

colorir_Mapa(Id_Mapa, IdArea, IdCor) :-
	retractall(cor_Area(_,_)),	% remove da KB fatos previamente inseridos dinamicamente 
	mapa(Id_Mapa, Lista_Areas), % unifica Lista_Areas com a áreas do mapa a ser colorido
	colorir_Areas(Lista_Areas), % encontra uma solução de coloração para o mapa
	member(area(IdArea, IdCor, _), Lista_Areas),
	assert_Areas(Lista_Areas),  % insere dinamicamente na KB novos fatos relacionando áreas à cores
	!.

% encontra uma solução de coloração para um mapa (uma lista de áreas) 
% colorir_Areas(Lista_Areas)
%  Lista_Areas : lista de áreas a serem coloridas

colorir_Areas([]).
colorir_Areas([area(_, _,[])|Lista_Areas]) :- 
	colorir_Areas(Lista_Areas).
colorir_Areas([area(Id, Cor, [Cor_Adj|Cores_Adj])|Lista_Areas]) :-
	diferente(Cor, Cor_Adj),  % RESTRIÇÃO: Cor de uma área deve ser diferente de Cores de Áreas Adjacentes
	colorir_Areas([area(Id, Cor, Cores_Adj)|Lista_Areas]).

% insere dinamicamente na KB novos fatos relacionando áreas à cores
% assert_Areas(Lista_Areas)
% 	Lista_Areas : lista de áreas para serem inseridas na KB
assert_Areas([]).
assert_Areas([area(Id, Cor, _)|Lista_Areas]) :-
	assertz(cor_Area(Id, Cor)),
	assert_Areas(Lista_Areas).

% regra auxiliar para imprimir no console as áreas de um mapa e suas respectivas cores
% print_Areas(Lista_Areas)
%  Lista_Areas : lista de áreas para serem impressas
print_Areas([]).
print_Areas([area(Id, Cor, _)|Lista_Areas]) :-
	print(Id),
	print(' : '),
	print(Cor),
	nl,
	print_Areas(Lista_Areas).
