import 'dart:math';

import 'functions.dart';

class Funcionario{
  final String userName, senha;

  Funcionario(this.userName,this.senha);
  
  void opcoes(){
    print('1-x');
    print('2-y');
    input();
  }

    Map<String,int> estoque = Map.fromIterables(List.generate(5, (val)=>'item$val'),List.generate(5, (val) => Random().nextInt(100)));
    Map<String,int> registro = {};
  }


class Manutencao extends Funcionario{
  Manutencao(String userNome, String senha) :super(userNome,senha); 
  //Cria um estoque com nomes 'item0' a diante, com quantidades aleatorias de 0 a 100
  Map<String,int> estoque = Map.fromIterables(List.generate(5, (val)=>'item$val'),List.generate(5, (val) => Random().nextInt(100)));
  Map<String,int> registro = {};
  
  @override
  void opcoes() {
    print('---------------------------------------------');
    print('1 - Solicitação de Materiais para Manutenção ');
    print('2 - Histórico de Consumo de Materiais');
    print('---------------------------------------------');
    
    switch (input()) {
      case '1':
        materialRequest();
        break;
      case '2':
        exibirHistorico();
        break;
      default:
        opcoesBase();
        break;
    }
  }

  void materialRequest(){
    //Printa todos os itens e suas quantidades
    estoque.forEach((key,val)=> print('Iten: $key\nQuantidade disponivel: $val\n'));
    //Pede o item que o usuario quer e caso escreva sair, ele sai da função
    String item = input('Qual item deseja(sair): ')??'';

    if(item == 'sair'){
      opcoes();
    }else if (estoque.containsKey(item)) {
      print('Quantidade disponivel: ${estoque[item]}\n');
      int quantidadePedida = int.parse(input('Quantidade necessaria: ')!);
      
      if (quantidadePedida > estoque[item]!) {
        print('Quantidade invalida');
        materialRequest();
      }else{
        registro.addAll({item:quantidadePedida});
        estoque[item] = estoque[item]! - quantidadePedida;
        materialRequest();
      }
      
    }else{
      print('item Indisponivel');
      materialRequest();
    }
  }

  void exibirHistorico(){
    print('---------------------------');
    registro.forEach((key,val)=> print('Item: $key | Quantidade: $val \n'));
    print('---------------------------');
    opcoes();
  }
}


// class almoxarife   
class Almoxarife extends Funcionario{
  Almoxarife(String userName, String senha) :super(userName, senha);
  // ele vai guarda todos os dados do produto nesse map como quantidade id entre outros
  
  Map<String, Map<String, dynamic>> dados_detalhes_produto = {};  

  @override
  Map<String, int> get estoque => super.estoque;
  // metodo para adicionar produtos no estoque 
  void add_estoque(){

    String nome_do_produto = input("nome do produto: ")??"algo deu errado";

    String? codintem = input("codigo do item: ");
    int codigo_do_item = int.parse(codintem!);

    String? fornecedor = input("quem é o fornecedor? (nome da empresa): ");
    String? quantidade = input("quantidade de produto: ");

    // ele aqui vai pegar o nome do produto que é a chave e vai adicionar chave e valor
    // chave é string e o valor é dinamico

    dados_detalhes_produto[nome_do_produto] = {

    'codigo do item': codigo_do_item,
    'fornecedor':fornecedor ?? 'não informado',
    'quantidade':quantidade ?? 'não informado',
    'data':DateTime.now().toString() 
    };

    //adiciona tudo dentro do estoque OBS: não tire o opcoes pois ele vai da um bug onde os produtos de analisar_produtos não vão aparecer 
    // esse bug foi dificiel de se entender porem pedi ajuda e resolvemos rapido
    estoque.addAll({nome_do_produto:codigo_do_item});
    print(estoque);
    opcoes();
  }
  
  // esse metodo vai ser usado para pesquisa de produto e mostrar detalhes de produtos  assim que pesquisado
  void pesquisar_produto(){
    
    String analisar_nome_do_produto = input("nome do produto: ")?? 'digite algo valido';
    
    if(dados_detalhes_produto.containsKey(analisar_nome_do_produto)){
      var dados_produto = dados_detalhes_produto[analisar_nome_do_produto];
      
      print("fornecedor: ${dados_produto!['fornecedor']}"); 
      print("codigo do item: ${dados_produto['codigo do item']}");
      print("quantidade: ${dados_produto['quantidade']}");
      print("data: ${dados_produto['data']}");
      opcoes();
    }
    // para ele não sair da função e dar erro de perde os dados então retornei a função
    else{
      print("seu produto não existe");
      pesquisar_produto();
    }
  }
  

    

  @override
  void opcoes() {
    print('---------------------------------------------');
    // adicionar detalhes como código do item, fornecedor, quantidade e data
    print('1 - Registrar Novos Itens ');
    print('2 - Ver as Saidas de itens ');
    print('3 - pesquisar e analisar produtos');
    print('---------------------------------------------');
    // Função de busca para facilitar o gerenciamento de itens
    switch(input()){
      case "1":
        add_estoque();
        break;
      // em breve ver registros de saidas de produtos
      case "2":
      break;

      case "3":
      pesquisar_produto();
      break;

      default:
      print("coloque o numero correto  entre 1 ou 3");
    }
  }


  
  

}


class Gerencia extends Funcionario{
  Gerencia(String userName, String senha) :super(userName, senha);

}