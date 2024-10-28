import 'package:mysql1/mysql1.dart';

class Db {
  MySqlConnection? dataBase;

  Future<MySqlConnection?> conectar() async{
    // coloque suas config do bd
   var configuracaoDb = ConnectionSettings(host:,port: , user: ,db:  );
   if(dataBase == null){
    return await MySqlConnection.connect(configuracaoDb);
  }
    // ignore: unused_element
    Future<void> fechar() async{
      if(dataBase != null){
        return dataBase!.close();
      }
    }
    return null;
  }
}
