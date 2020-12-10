import 'package:flutter/material.dart';
import 'package:projeto_udwmj/tabs/consulting_tab.dart';
import 'package:projeto_udwmj/tabs/course_star_tab.dart';
import 'package:projeto_udwmj/tabs/courses_tab.dart';
import 'package:projeto_udwmj/tabs/home_tab.dart';
import 'package:projeto_udwmj/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key key}) : super(key: key);

  //O _pageController, terá a função de controlador da página
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //O Widget PageView, Cria uma lista rolável que funciona página por página
    //a partir de uma [Lista] explícita de widgets
    return PageView(
      //No entanto essa função é bloqueada pela função 'physics'
      //pois será controlada pelo código Controller
      controller: _pageController,
      //Função que impede a rolagem
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          //Drawer customizado para função do menu com a função do pageController
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Cursos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          //Tab da página dos produtos
          body: CoursesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Consultoria'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          //Tab da página dos produtos
          body: ConsultingTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Avalie Os Cursos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          //Tab da página dos produtos
          body: CourseStarTab(),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.blue,),
      ],
    );
  }
}