:- initialization(main).

main :-
	separador,
	writeln("		VIAJE COM SIMULAR.COM 	"),
	writeln("            seu melhor agente de viagens!       "),
	writeln(""),
	writeln(""),
	writeln("	Que lugar do mundo você deseja conhecer hoje?"),
	decideDestino,
	main.

decideDestino :-
	separador,
	writeln("ESCOLHA O CÓDIGO DO SEU DESTINO"),
	mostraDestinos(1),
	mostraDestinos(2),
	mostraDestinos(3),
	mostraDestinos(4),
	mostraDestinos(5),
	read(Destino),
	separador,
	(
    (Destino =:= 1, mostraDestinoEscolhido(Destino), pausa, decidePartida('África do Sul', 15, 5000));
    (Destino =:= 2, mostraDestinoEscolhido(Destino), pausa, decidePartida('Japão', 22, 7000));
    (Destino =:= 3, mostraDestinoEscolhido(Destino), pausa, decidePartida('Austrália', 24, 8000));
    (Destino =:= 4, mostraDestinoEscolhido(Destino), pausa, decidePartida('Estados Unidos', 14, 4000));
    (Destino =:= 5, mostraDestinoEscolhido(Destino), pausa, decidePartida('França', 17, 6000));
    (cls, separador, writeln("Não temos mais destinos no momento, estamos trabalhando nisso. Escolha outro!"), decideDestino)
    ).

mostraDestinos(Codigo) :-
	writeln(""),
	call(destino(Codigo, Continente, Pais, Cidade, Descricao)),
	write("OPÇÃO "),
	writeln(Codigo),
	write("Código: "),
	writeln(Codigo),
	write("País destino: "),
	writeln(Pais),
	write("Cidade destino: "),
	writeln(Cidade).

mostraDestinoEscolhido(Codigo) :-
	cls,
	separador,
	writeln("O SEU DESTINO ESCOLHIDO"),
	call(destino(Codigo, Continente, Pais, Cidade, Descricao)),
	writeln(""),
	write("Continente: "),
	writeln(Continente),
	writeln(""),
	write("País: "),
	writeln(Pais),
	writeln(""),
	write("Cidade: "),
	writeln(Cidade),
	writeln(""),
	write("Conheça seu destino: "),
	writeln(Descricao).

destino(1, "África", "África do Sul", "Cidade do Cabo", "A Cidade do Cabo faz parte do Município metropolitano da Cidade do Cabo, na província do Cabo Ocidental, na África do Sul. É a capital legislativa do país, onde o Parlamento Nacional e muitos escritórios do governo estão localizados. Também é a capital da província.").
destino(2, "Ásia", "Japão", "Tóquio", "Tóquio, oficialmente Metrópole de Tóquio, é a capital do país e de uma das 47 prefeituras do Japão. Situa-se em Honshu, a maior ilha do arquipélago.").
destino(3, "Oceania", "Austrália", "Sydney", "Sydney é a capital do estado de Nova Gales do Sul e a cidade mais populosa de toda a Austrália e Oceania. Está localizada na costa sudeste do país, ao longo do mar da Tasmânia e em torno de um dos maiores portos naturais do mundo.").
destino(4, "América", "Estados Unidos", "Nova Iorque", "Nova Iorque ou Nova York, é a cidade mais populosa dos Estados Unidos e o centro da Região Metropolitana de Nova Iorque, uma das áreas metropolitanas mais populosas do mundo. É também a terceira cidade mais populosa da América, atrás de São Paulo e Cidade do México.").
destino(5, "Europa", "França", "Paris", "Paris é a capital e a mais populosa cidade da França, bem como a capital da região administrativa de Ilha de França. A cidade se situa em um dos meandros do Sena, no centro da bacia parisiense, entre os confluentes do Marne e do Sena rio acima, e do Oise e do Sena rio abaixo.").

decidePartida(Destino, Duracao, Custo) :-
	separador,
	writeln("ESCOLHA O CÓDIGO DO SEU LOCAL DE PARTIDA"),
	mostraPartidas(1),
	mostraPartidas(2),
	mostraPartidas(3),
	read(Partida),
	ADuracao is Duracao + 3,
	BDuracao is Duracao + 1, 
	CDuracao is Duracao - 1,
	ACusto is Custo + 1000,
	BCusto is Custo + 600,
	separador,
	(
    (Partida =:= 1, pausa, decideCompanhia(Destino, ADuracao, ACusto, 'CPV'));
    (Partida =:= 2, pausa, decideCompanhia(Destino, BDuracao, BCusto, 'JPA'));
    (Partida =:= 3, pausa, decideCompanhia(Destino, CDuracao, Custo, 'REC'));
    (cls, separador, writeln("Não temos mais opções de aeroporto, estamos trabalhando nisso. Escolha outro!"), decidePartida(Destino, Duracao, Custo))
    ).

mostraPartidas(Codigo) :-
	writeln(""),
	call(partida(Codigo, Cidade, Aeroporto)),
	write("Código: "),
	writeln(Codigo),
	write("Cidade da partida: "),
	writeln(Cidade),
	write("Aeroporto local: "),
	writeln(Aeroporto).

partida(1, "Campina Grande", "Aeroporto Presidente João Suassuna").
partida(2, "João Pessoa", "Aeroporto Internacional Presidente Castro Pinto").
partida(3, "Recife", "Aeroporto Internacional de Recife/Guararapes").

decideCompanhia(Destino, Duracao, Custo, Partida) :-
	separador,
	writeln("ESCOLHA A COMPANHIA AÉREA A REALIZAR SUA VIAGEM"),
	mostraCompanhias(1),
	mostraCompanhias(2),
	mostraCompanhias(3),
	mostraCompanhias(4),
	mostraCompanhias(5),
	read(Companhia),
	ADuracao is Duracao + 2,
	BDuracao is Duracao + 4, 
	DDuracao is Duracao + 3,
	EDuracao is Duracao + 5,
	ACusto is Custo + 700,
	CCusto is Custo + 950,
	DCusto is Custo + 820,
	ECusto is Custo - 130,
	separador,
	(
    (Companhia =:= 1, pausa, decideClasse(Destino, ADuracao, ACusto, Partida, 'LATAM', 'Guarulhos - GRU'));
    (Companhia =:= 2, pausa, decideClasse(Destino, BDuracao, Custo, Partida, 'Gol', 'Brasília - BSB'));
    (Companhia =:= 3, pausa, decideClasse(Destino, Duracao, CCusto, Partida, 'Azul', 'Rio de Janeiro - GIG'));
    (Companhia =:= 4, pausa, decideClasse(Destino, DDuracao, DCusto, Partida, 'TAP', 'Fortaleza - FOR'));
    (Companhia =:= 5, pausa, decideClasse(Destino, EDuracao, ECusto, Partida, 'Avianca', 'Curitiba - CWB'));
    (cls, separador, writeln("Não temos mais opções de companhias, estamos trabalhando nisso. Escolha outra!"), decideCompanhia(Destino, Duracao, Custo, Partida))
    ).

mostraCompanhias(Codigo) :-
	writeln(""),
	call(companhia(Codigo, Empresa)),
	write("Código: "),
	writeln(Codigo),
	write("Companhia aérea: "),
	writeln(Empresa).

companhia(1, 'LATAM').
companhia(2, 'Gol').
companhia(3, 'Azul').
companhia(4, 'TAP').
companhia(5, 'Avianca').

decideClasse(Destino, Duracao, Custo, Partida, Companhia, Conexao) :-
	separador,
	writeln("ESCOLHA O CÓDIGO DA CLASSE A VIAJAR"),
	mostraClasses(1),
	mostraClasses(2),
	mostraClasses(3),
	read(Classe),
	ACusto is Custo - 850,
	BCusto is Custo + 900,
	CCusto is Custo + 5000,
	separador,
	(
    (Classe =:= 1, pausa, planejaVoo(Destino, Duracao, ACusto, Partida, Companhia, Conexao, 'Econômica'));
    (Classe =:= 2, pausa, planejaVoo(Destino, Duracao, BCusto, Partida, Companhia, Conexao, 'Executiva'));
    (Classe =:= 3, pausa, planejaVoo(Destino, Duracao, CCusto, Partida, Companhia, Conexao, 'Primeira'));
    (cls, separador, writeln("Companhias aéreas apenas trabalham com essas opções. Tente novamente!"), decideClasse(Destino, Duracao, Custo, Partida, Companhia, Conexao))
    ).

mostraClasses(Codigo) :-
	writeln(""),
	call(classe(Codigo, Classe, Descricao, Preco)),
	write("Código: "),
	writeln(Codigo),
	write("Classe: "),
	writeln(Classe),
	write("Descrição: "),
	writeln(Descricao),
	write("Preço: "),
	writeln(Preco).

classe(1, "Econômica", "O serviço oferecido é bastante reduzido e, na maior parte dos casos, não existe alimentação a bordo sem custo para o passageiro, nem qualquer tipo de entretenimento; em contrapartida, o preço do bilhete é dos mais baixos.", "Pode variar entre R$ 2.000 a R$ 5.000 a depender do destino e da companhia.").
classe(2, "Executiva", "Classe que apresenta níveis de conforto de qualidade superior, situando-se entre a Classe Econômica e a Primeira Classe.", "Pode variar entre R$ 5.000 e R$ 7.000 a depender do destino e da companhia.").
classe(3, "Primeira classe", "Caracteriza-se pelo aumento do espaço entre assentos, que pode variar entre 25 cm a 75 cm, televisão pessoal, alimentos e bebidas de alta qualidade, serviço personalizado, privacidade, pijama, chinelos, e bolsa de artigos para a higiene. Os passageiros desta classe têm check-in próprio, sala de espera, e podem ser os primeiros a entrar no avião.", "Pode variar entre R$ 10.000 a 15.000 a depender do destino e da companhia.").

planejaVoo(Destino, Duracao, Custo, Partida, Companhia, Conexao, Classe) :-
	separador,
	writeln("	ESTE É O MELHOR VOO PARA VOCÊ"),
	writeln(""),
	write("O seu destino: "),
	writeln(Destino),
	writeln(""),
	write("Duração da sua viagem em horas: "),
	writeln(Duracao),
	writeln(""),
	write("Custo da sua viagem: R$ "),
	writeln(Custo),
	writeln(""),
	write("Seu local de partida: "),
	writeln(Partida),
	writeln(""),
	write("Sua companhia aérea: "),
	writeln(Companhia),
	writeln(""),
	write("Cidade onde você faz conexão: "),
	writeln(Conexao),
	writeln(""),
	write("A classe em que você irá viajar: "),
	writeln(Classe),
	tomaDecisao.

tomaDecisao :-
	separador,
	writeln("Deseja continuar a planejar viagens?"),
	writeln("1. Sim"),
	writeln("2. Não"),
	read(Resposta),
	(
	(Resposta =:= 1, cls, main);
    (Resposta =:= 2, cls, finalizaSimulacao);
    (cls, separador, writeln("Não somos filósofos, há apenas duas respostas possíveis! Tente novamente!"), tomaDecisao)
    ).

finalizaSimulacao :-
	separador,
	writeln("Agradecemos por simular com a simular.com e faça uma boa viagem!"),
	writeln(""),
	writeln(""),
	writeln(""),
	writeln("Feito por Marcella Siqueira"),
	separador,
	halt.

separador :-
	writeln(" "),
	writeln("✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈️ ✈ ✈️️"),
	writeln(" ").

pausa :-
    writeln(""),
    writeln("Digite 'next.' para continuar"),
    read(_),
    cls.

cls :- write('\e[H\e[2J').	