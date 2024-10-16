import 'package:easystoragedart/classes.dart';
import 'package:easystoragedart/functions.dart';

void main(List<String> arguments) {
  Map<Map<String,String>,String> DB = {};
  String? valOp = opcoesBase(); 
  dynamic user;
  while (valOp !='sair') {
    switch (valOp) {
      case '1':
        DB.addAll(Cadastro());
        valOp = opcoesBase();
        break;
      case '2':
        user = logar(DB);
        break;
      default:
        print('Opção invalida');
        valOp = opcoesBase();
    }
    if (user != null) {
      user.opcoes();
    }else{
      
    }
  }


}
