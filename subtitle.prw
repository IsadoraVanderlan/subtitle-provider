#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

//*************************************************************************************************
//Este programa tem como objetivo criar legendas para rotina cadastro de fornecedores.
//**************************************************************************************************

User Function Legenda1()

Local cAlias        := "SA2" //Tabela que será usada
Private cCadastro   := "Cadastro de fornecedores 1" //Titulo na Rotina
Private aRotina     := {} //Recebe os botoes
Private aCores      := {} //Recebe as cores
Private cFiltra     := "A2_FILIAL == '" + xFilial("SA2") + "' .AND. A2_EST == 'SP'" //Condição
Private IndexSA2    := {} //Recebe o conteudo filtrado
Private bFiltra     := { || FilBrowse(cAlias, @IndexSA2, @cFiltra)} //Função filtro

AADD(aRotina, {"Pesquisar"     ,"AxPesqui",   0, 1}) //Criação dos botoes 
AADD(aRotina, {"Visualizar"    ,"AxVisual",   0, 2})
AADD(aRotina, {"Incluir"       ,"AxInclui",   0, 3})
AADD(aRotina, {"Alterar"       ,"AxAltera",   0, 4})
AADD(aRotina, {"Excluir"       ,"AxDeleta",   0, 5})
AADD(aRotina, {"Legenda"       ,"U_Legenda3", 0, 6})

AADD(aCores, {"A2_TIPO == 'F'" ,"BR_VERDE"}) //Cores das legendas
AADD(aCores, {"A2_TIPO == 'J'" ,"BR_AZUL"}) 

DbSelectArea(cAlias) //Selecionar a tabela
DbSetOrder(1)        //Posiciona no indice 1

Eval(bFiltra) //Executa o bloco com a função de filtro

DbSelectArea(cAlias) //Retorna para a tabela não temporaria
DbGoTop() //Coloca posicionado no primeiro registro da tabela 

mBrowse(,,,,cAlias,,,,,,aCores) //Função para criação da rotina

EndFilbrw(cAlias, IndexSA2) //Zera as variaveis
Return   

//===========================================================================================
User Function Legenda3()

Local aLegenda := {} //Recebe a legenda

AADD (aLegenda, {"BR_VERDE" , "Pessoa Fisica"}) 
AADD (aLegenda, {"BR_AZUL" , "Pessoa Juritica"})

BrwLegenda(cCadastro, "Legenda", aLegenda) 

Return 
              
            
