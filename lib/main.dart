import 'package:flutter/material.dart';
import 'package:projeto_udwmj/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      //Tudo o que estiver abaixo do widget ScoopedModel, será modificado e
      //influenciará em todo o app

      //O Modelo terá as informações de login, e informará qual o estado atual
      //do processamento do login
      model: UserModel(),
          child: MaterialApp(
        title: 'Projeto UDWMJ',
        theme: ThemeData(
            primarySwatch: Colors.blue,

            //visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color.fromARGB(255, 84, 11, 14),),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}