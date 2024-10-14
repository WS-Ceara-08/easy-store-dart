import 'dart:io';

String? input(String? texto){
  stdout.write(texto);
  return stdin.readLineSync();
}


Map<Map<String,String>,String> Cadastro(){
  Map<Map<String,String>,String> dados = {};
  String userName = input('User name: ')!;
  String senha = input('Senha:')!;
  dados.update({userName:senha}, (val)=> input('Cargo: ')!);
  return dados;
}