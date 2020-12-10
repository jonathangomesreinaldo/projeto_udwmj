import 'package:flutter/material.dart';
import 'package:projeto_udwmj/screens/login_screen.dart';
import 'package:projeto_udwmj/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  //const CustomDrawer({Key key}) : super(key: key);

  //O controlador PageController é um construtor que dá acesso ao pagecontroller
  //de dentro do menu arrastável para a mudança das páginas pelos botões do menu
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          //Tipo de função usada para decoração
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  //Cores do menu arrastável
                  colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                //Color.fromARGB(200, 158, 42, 43),
                Color.fromARGB(255, 84, 11, 14),
              ],
                  //Função qeu define o começo e o final da orientação do degradê
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: [
          //Widget do menu
          _buildDrawerBack(),
          //Lista das opções do menu
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            //Conteúdo do menu
            children: [
              Container(
                //Margem que separa o conteúdo abaixo
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                //Altura do cabeçalho
                height: 170.0,

                //Novamente é adicionado um widget Stack, pois caso
                //seja necessário posicionar outros elementos no menu
                child: Stack(
                  children: [
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        'Menu de Cursos\nUDWMJ',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 84, 11, 14),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        //Definição para que o alinhamento seja feito da esquerda
                        //para a direita do menu
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Começe Agora',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            child: Text(
                              'Entrar ou Cadastre-se',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 84, 11, 14),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Linha divisora de conteúdo
              Divider(),
              //Cada Drawer é um conteúdo com íconesController
              //Nele existe a função de mudança de página através do pagecontroller
              //e também é redirecionado a respectiva página pelos números no final
              //baseado no parâmetro definido no custom_drawer
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Cursos', pageController, 1),
              DrawerTile(Icons.person, 'Consultoria', pageController, 2),
              DrawerTile(Icons.star, 'Avaliação Dos Cursos', pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
