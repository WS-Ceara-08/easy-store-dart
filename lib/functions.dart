import 'dart:io';

import 'package:easystoragedart/classes.dart';

String? input([String? texto]){
  stdout.write(texto??'');
  return stdin.readLineSync()!;
}


Map<Map<String,String>,String> Cadastro(){
  Map<Map<String,String>,String> dados = {};
  String userName = input('User name: ')!;
  String senha = input('Senha:')!;
  dados[{userName.toLowerCase():senha}] = input('Cargo(manu,almo,geren): ')!;
  print('Cadastro realizado com sucesso');
  return dados;
}

dynamic logar(Map<Map<String,String>,String> DB){
  String userName = input('User name: ')!;
  String senha = input('Senha:')!;
  List chaves = DB.keys.toList();
  List values = DB.values.toList();
  print(DB);
  print(DB.keys);
  if (DB.keys.any((element) => element.containsKey(userName.toLowerCase()) && element.containsValue(senha))) {
    int indice = chaves.indexWhere((ele)=> ele.containsKey(userName) && ele.containsValue(senha));
    print('Logado');
    return classSet(values[indice], userName, senha);

  }else{
    print('User Name ou senha errados');
    return null;
  }
}
dynamic classSet(String cargo, String userName, String senha){
  var user;
  switch (cargo.toLowerCase()) {
    case 'manu':
      user = Manutencao(userName, senha);
      break;
    default:
      break;
  }
  return user;
}
String? opcoesBase(){
    print('--------------------');
    print('1-Cadastro');
    print('2-Logar');
    return input();
  }