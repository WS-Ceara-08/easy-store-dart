import 'dart:io';

import 'classes.dart';

String? input([String? texto]){
  stdout.write(texto??'');
  return stdin.readLineSync()!;
}

//Função que realiza o cadastro dos funcionarios.
Map<Map<String,String>,String> Cadastro(){
  Map<Map<String,String>,String> dados = {};
  String userName = input('User name: ')!;
  String senha = input('Senha:')!;
  // Cria um novo usuario com a chave({userName:senha}) que foi passada e o cargo como valor
  dados[{userName:senha}] = input('Cargo:\n1-Manutenção\n2-Almoxarife\n3-Gerencia\n')!;
  print('Cadastro realizado com sucesso');
  return dados;
}


//Função de Login
dynamic logar(Map<Map<String,String>,String> DB){
  String userName = input('User name: ')!;
  String senha = input('Senha:')!;
  List chaves = DB.keys.toList();
  List values = DB.values.toList();
  //Pega as chaves do DB e verifica se tem alguma elemento onde a chave desse elemento é igual ao nome de usuario e se o valor é igual a Senha dele
  if (DB.keys.any((element) => element.containsKey(userName.toLowerCase()) && element.containsValue(senha))) {

    //Pega o indice da chave na lista, para achar esse mesmo indice na lista de valores para achar o cargo do usuario
    int indice = chaves.indexWhere((element)=> element.containsKey(userName) && element.containsValue(senha));
    //Chama a Função classSet para retornar a que classe o usuario pertence.
    Funcionario user = classSet(values[indice], userName, senha);
    print(user.runtimeType);
    if (classSet(values[indice], userName, senha).runtimeType == Funcionario) {
      return null;
    } else {
      print('Logado');
      return user;
    }

  }else{
    print('User Name ou senha errados');
    return null;
  }
}
//Função que seta a classe que o usuario atual vai usar
Funcionario classSet(String cargo, String userName, String senha){
  Funcionario user;
  //Quando for criar é só colocar o teu case e deixa o default assim mesmo, dps a gente vê ele.
  switch (cargo) {
    case '1':
      user = Manutencao(userName, senha);
      break;
    case '2':
      user = Almoxarife(userName, senha);
      break;
    default:
      user = Funcionario(userName, senha);
      print("usuario não existe");
      break;
  }
    return user; 
}

String? opcoesBase(){
  print('--------------------------');
  print('1-Cadastro');
  print('2-Logar');
  String? resposta = input("opção: ");
  print('--------------------------');
  return resposta;
}

