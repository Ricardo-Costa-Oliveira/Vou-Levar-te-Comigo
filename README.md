VouLevarteCOMIGO: Um Token Viajante
======
VouLevarteCOMIGO: A Traveller Token
------
9.1  Contexto e Objetivos
------
Imagine um Ser virtual capaz de viver e movimentar-se de dispositivo móvel para dispositivo móvel.  Considere que, cada vez que este Ser chegava a determinado dispositivo, pedia ao seu utilizador que se identificasse e enviasse uma mensagem ao dono do  er, só para o informar por onde andava naquele momento. O objetivo deste projeto é tornar este cenário imaginário em algo minimamente tangível. Para isso, será necessário implementar uma aplicação que gera tokens de um utilizador e que hospeda tokens vindos de outros utilizadores.  A ideia é que apenas exista um token por cada utilizador, que seja sempre possível provar que determinado token é desse utilizador e que um token só possa existir em 1 dispositivo de cada vez.  A aplicação deve permitir que os utilizadores da aplicação troquem os tokens que possuírem entre si, e possivelmente que esses seres virtuais avisem quando sentirem outro dispositivo móvel com a aplicação nas redondezas, propondo ao utilizador que os deixe viajar para lá.  O grande objetivo de cada um dos seres virtuais é o de viajar o mais possível.  Possivelmente, e para garantir que um  token só existe em determinado dispositivo, pode precisar de colocar alguma lógica aplicacional do lado de um servidor, embora não seja obrigatório.  A aplicação deve favorecer também o lado social, e propor ao hospedeiro atual que coloque mensagens em redes sociais a informar que aquele token está atualmente com ele(a), ou que envie uma mensagem pequena ao dono original.

9.2  Funcionalidades
------
O seguinte conjunto de funcionalidades procura sobretudo ilustrar o que é pretendido do sistema a desenvolver no âmbito desta proposta.  A forma como as funcionalidades são disponibilizadas ou até eventuais melhorias ou adições ficam ao critério do grupo, que deve pensar o sistema para o contexto em que se insere:

1. Na primeira utilização, a aplicação deve permitir gerar um token que pertence apenas àquele utilizador.  Tal pode ser conseguido, por exemplo, através da geração de um identificador aleatório de 256 bits (que identifica aquele token), atribuição de um nome, associação de uma chave pública (de um par de chaves RSA), e do cálculo de uma assinatura digital, que é acoplada ao token.

1. Deve ser possível verificar a proveniência de um token através da verificação da assinatura digital (e.g., pedindo ao servidor central que lhe forneça a chave pública do suposto dono, e verificando a assinatura com essa info)

1. Cada utilizador deve ser capaz de ver informação acerca do token, nomeadamente por onde já viajou, etc. Isto significa que cada token terá de ser eventualmente acompanhado por uma simples base de dados que vai crescendo à medida que este viaja por vários dispositivos móveis; 

1. A movimentação dos tokens entre aplicações diferentes deve ser simples e intuitiva. E.g.,  quando um utilizador encontra outro  com a mesma aplicação,  pode propor a troca de tokens através de um ou mais códigos QR, tethering ou bluetooth;

1. Ao chegar a um dispositivo novo, o token propõe sempre, ao utilizador, que seja enviada uma mensagem ao seu dono original, informando-o do seu paradeiro e hospedeiro atual;

1. Frequentemente, o token pode sugerir ao hospedeiro atual que partilhe o seu status em redes sociais;

1. Outras funcionalidades que considere interessantes.
