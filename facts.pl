%
% * UnB - Universidade de Brasília
% * CIC - Departamento de Ciência da Computação
% * IA - Introdução a Inteligência Artificial
% * 
% * @author zidenis
% * @version 0.1 (24/11/2014)
%
%% Base de Fatos

% Cores disponíveis na KB
% cor(id_Cor)
%  id_Cor : identificador da cor

cor(red).
cor(green).
cor(blue).
cor(yellow).

% cor_Area é um fato a ser inserido na base dinamicamente,
% na medida em que o mapa estiver sendo colorido.
% cor_Area(id_Area, cor_Area)
%  id_Area : idenficiador da área (ex.: rn)
%  cor_Area : identificador da cor associada à área (ex: vermelha)

%:- dynamic cor_Area/2.

% Mapas da KB
% Mapas podem ser entendidos como um conjunto de areas
% mapa(id_Mapa, lista_Areas)
%  id_Mapa : idenficiador do mapa (ex.: nordeste)
%  lista_Areas : lista de areas do mapa, onde uma área é especificado conforme abaixo:
%	 area(id_Area, cor_Area, cores_Adjacentes)
%	  id_Area : identifcador da área (ex.: rn)
%	  cor_Area : cor da área (ex.: RN = vermelha)
%	  cores_Adjacentes : lista de cores das regiões adjacentes (ex.: [CE=verde, PB=azul])

mapa(nordeste, [
	area(rn, RN, [CE, PB]),
	area(ce, CE, [PI, PE, PB, RN]),
	area(pi, PI, [MA, BA, PE, CE]),
	area(ba, BA, [SE, AL, PE, PI]),
	area(se, SE, [AL, BA]),
	area(pe, PE, [PB, AL, CE, PI, BA]),
	area(pb, PB, [RN, CE, PE]),
	area(ma, MA, [PI]),
	area(al, AL, [BA, SE, PE])
	]).

mapa(sul, [
	area(rs, RS, [SC]),
	area(sc, SC, [RS, PR]),
	area(pr, PR, [SC])
	]).

mapa(centroOeste, [
	area(go, GO, [DF, MT, MS]),
	area(mt, MT, [MS, GO]),
	area(ms, MS, [MT, GO]),
	area(df, DF, [GO])
	]).

mapa(norte, [
	area(am, AM, [PA, AC, RO, RR]),
	area(pa, PA, [AP, AM, TO]),
	area(ac, AC, [AM]),
	area(ro, RO, [AM, PA]),
	area(ap, AP, [PA]),
	area(rr, RR, [AM]),
	area(to, TO, [PA])
	]).

mapa(sudeste, [
	area(sp, SP, [MG, RJ]),
	area(mg, MG, [SP, RJ, ES]),
	area(rj, RJ, [SP, MG, ES]),
	area(es, ES, [MG, RJ])
	]).

mapa(brasil, [
	area(rn, RN, [CE, PB]),
	area(ce, CE, [PI, PE, PB, RN]),
	area(pi, PI, [MA, BA, PE, CE]),
	area(ba, BA, [SE, AL, PE, PI, TO, MG, GO, ES]),
	area(se, SE, [AL, BA]),
	area(pe, PE, [PB, AL, CE, PI, BA]),
	area(pb, PB, [RN, CE, PE]),
	area(ma, MA, [PI, PA, TO]),
	area(al, AL, [BA, SE, PE]),
	area(rs, RS, [SC]),
	area(sc, SC, [RS, PR]),
	area(pr, PR, [SC, MS, SP]),
	area(go, GO, [DF, MT, MS, TO, BA, MG]),
	area(mt, MT, [MS, GO, RO, AM, PA, TO]),
	area(ms, MS, [MG, GO, PR, SP, MG]),
	area(df, DF, [GO, MG]),
	area(am, AM, [PA, AC, RO, RR]),
	area(pa, PA, [AP, AM, TO, MA]),
	area(ac, AC, [AM]),
	area(ro, RO, [AM, PA]),
	area(ap, AP, [PA]),
	area(rr, RR, [AM]),
	area(to, TO, [PA, MT, GO, BA, MA]),
	area(sp, SP, [MG, RJ, MT, PR]),
	area(mg, MG, [SP, RJ, ES, BA, GO, DF, MT]),
	area(rj, RJ, [SP, MG, ES]),
	area(es, ES, [MG, RJ])
	]).