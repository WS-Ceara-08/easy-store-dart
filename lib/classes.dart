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

//Almoxarife, não 'Omoxarife'.
class Omoxarife extends Funcionario{
  Omoxarife(String userName, String senha) :super(userName, senha);
}


class Gerencia extends Funcionario{
  Gerencia(String userName, String senha) :super(userName, senha);

}