import 'package:easystoragedart/classes.dart';
import 'package:easystoragedart/functions.dart';

void main(List<String> arguments) {
  Map<Map<String,String>,String> DB = {};
  String? valOp = opcoesBase(); 
  Funcionario? user;
  while (valOp !='sair') {
    switch (valOp) {
      case '1':
        DB.addAll(Cadastro());
        valOp = opcoesBase();
        break;
      case '2':
        user = logar(DB);
        if (user != null) {
          user.opcoes();
        }else{
          valOp = opcoesBase();
        }
        break;
      default:
        print('Opção invalida');
        valOp = opcoesBase();
    }
  }
}
