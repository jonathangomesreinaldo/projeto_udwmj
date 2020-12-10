import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Será o usuário que estará logado no momento, se não houver usuário logado
  //estará null, caso contrário, irá conter o ID do usuário e outras informações
  FirebaseUser firebaseUser;

  //Dados de email, nome e endereço do uruário
  Map<String, dynamic> userData = Map();

  //Usuário atual
  bool isLoading = false;
  void signIn() async {
    //Está carregando
    isLoading = true;
    //Notifica as escutas
    notifyListeners();
    //Aguarda 3 segundos
    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();
    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'], password: pass)

        //se o login for um sucesso, ele passará essa função chamando
        //o usuário em questão
        .then((user) async {
      firebaseUser = user;
      //await _saveUserData(userData);
      onSuccess();
      isLoading = false;
      notifyListeners();
    })
        //se der erro, o erro será capturado pela função catchError
        .catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void recoveryPass() {}
  //bool isLoggedIn(){}

}
