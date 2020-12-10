import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  //const LoginScreen({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      //O Widget Form irá validar os campos preenchidos
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome Completo'),
              //keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty)
                  return 'Nome Inválido';
              },
            ),
            Divider(
              height: 16.0,
            ),
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
              decoration: InputDecoration(hintText: 'Endereço'),
              //obscureText: true,
              validator: (text) {
                if (text.isEmpty) return 'Endereço Inválido';
              },
            ),
            Divider(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Senha'),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return 'Senha Inválida';
              },
            ),
                        Divider(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Confirmar Senha'),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return 'Senha Inválida';
              },
            ),
            Divider(
              height: 16.0,
            ),
            SizedBox(
              height: 45.0,
              child: RaisedButton(
                child: Text(
                  'Criar Conta',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    
                  }
                },
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
