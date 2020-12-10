import 'package:flutter/material.dart';
import 'package:projeto_udwmj/models/user_model.dart';
import 'package:projeto_udwmj/screens/sign_up_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
          centerTitle: true,
          actions: [
            FlatButton(
              child: Text(
                'CRIAR CONTA',
                style: TextStyle(fontSize: 15.0),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            )
          ],
        ),
        //O Widget Form irá validar os campos preenchidos
        body:
        //Tudo que estiver abaixo do ScopedDescendant, será recriado 
        //pelo user_model.dart e ele notificará as escutas e irá verificar o estado
        //do login
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty || !text.contains('@'))
                      return 'E-mail Inválido';
                  },
                ),
                Divider(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return 'Senha Inválida';
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      'Esqueci minha senha',
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ),
                Divider(
                  height: 16.0,
                ),
                SizedBox(
                  height: 45.0,
                  child: RaisedButton(
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                      model.signIn();
                    },
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          );
        }));
  }
}
