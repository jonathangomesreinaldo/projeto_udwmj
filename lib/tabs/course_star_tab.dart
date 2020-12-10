import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CourseStarTab extends StatefulWidget {
  static const caminhoDaRota = '/avaliacao';
  CourseStarTabState createState() {
    return CourseStarTabState();
  }
}

class CourseStarTabState extends State<CourseStarTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: ListView(
            children: <Widget>[
              Text(
                "O Conteúdo Dos Vídeos Ajudaram No Meu Desenvolvimento",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: SmoothStarRating(
                    starCount: 5,
                    spacing: 5,
                    isReadOnly: false,
                    allowHalfRating: false,
                    size: 35,
                    color: Color.fromARGB(255, 158, 42, 43),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Text(
                "Os Cursos Ajudaram No Meu Entendimento Do Assunto Buscado",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: SmoothStarRating(
                    starCount: 5,
                    spacing: 5,
                    isReadOnly: false,
                    allowHalfRating: false,
                    size: 35,
                    color: Color.fromARGB(255, 158, 42, 43),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Text(
                "Sua Satisfação Com o aplicativo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: SmoothStarRating(
                    starCount: 5,
                    spacing: 5,
                    isReadOnly: false,
                    allowHalfRating: false,
                    size: 35,
                    color: Color.fromARGB(255, 158, 42, 43),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Text(
                "Sua Satisfação Com Nossos Consultores",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: SmoothStarRating(
                    starCount: 5,
                    spacing: 5,
                    isReadOnly: false,
                    allowHalfRating: false,
                    size: 35,
                    color: Color.fromARGB(255, 158, 42, 43),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Text(
                "Recomendaria o Aplicativo Para Alguém?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: SmoothStarRating(
                    starCount: 5,
                    spacing: 5,
                    isReadOnly: false,
                    allowHalfRating: false,
                    size: 35,
                    color: Color.fromARGB(255, 158, 42, 43),
                  ),
                ),
              ),
              Divider(
                height: 30,
              ),
              Container(
                child: RaisedButton(
                  color: Color.fromARGB(255, 158, 42, 43),
                  onPressed: () {},
                  child: Text(
                    'Enviar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
