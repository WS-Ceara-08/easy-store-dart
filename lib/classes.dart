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
  Map<String,int> estoque = Map.fromIterables(List.generate(5, (val)=>'iten$val'),List.generate(5, (val) => Random().nextInt(100)));
  
  @override
  void opcoes() {
    print('1 - Solicitação de Materiais para Manutenção ');
    print('2 - Histórico de Consumo de Materiais');
    
    switch (input()) {
      case '1':
        materialRequest(estoque);
        break;
      default:
        opcoes();
        break;
    }
  }

  void materialRequest(Map<String,int> itens){
    itens.forEach((key,val)=> print('Iten: $key\nQuantidade disponivel: $val'));
    String item = input('Qual item deseja(sair): ')??'';
    if(item == 'sair'){
      opcoes();
    }else if (itens.containsKey(item)) {
      print('Quantidae disponivel: ${itens[item]}');
      int quandtidadePedida = int.parse(input('Quantidade necessaria: ')!);
      itens[item] = itens[item]! - quandtidadePedida;
      print(itens);
      materialRequest(itens);
    }else{
      print('item Indisponivel');
      materialRequest(estoque);
    }
  }
}

//Almoxarife, não 'Omoxarife'.
class Omoxarife extends Funcionario{
  Omoxarife(String userName, String senha) :super(userName, senha);
}


class Gerencia extends Funcionario{
  Gerencia(String userName, String senha) :super(userName, senha);

}

