class Funcionario{
  final String userName, senha;

  Funcionario(this.userName,this.senha);

  void logar(Map<String,String> BD){
    if (BD.containsKey(userName.toLowerCase())) {
      BD[userName.toLowerCase()] == senha ? print('Logado'):print('Senha errada');
    }else{
      print('User Name errado');
    }
  }
}

class Manutencao extends Funcionario{
  Manutencao(String userNome, String senha) :super(userNome,senha);
}


class Omoxarife extends Funcionario{
  Omoxarife(String userName, String senha) :super(userName, senha);
}


class Gerencia extends Funcionario{
  Gerencia(String userName, String senha) :super(userName, senha);

}

