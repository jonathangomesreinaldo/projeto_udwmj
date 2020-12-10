import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoursesCategoryScreen extends StatelessWidget {
  //const CoursesCategoryScreen({Key key}) : super(key: key);

  //Construtor que receberá o documento do Firebase da Categoria do produto
  //ele indicará qual o id e o título da categoria
  final DocumentSnapshot snapshot;
  CoursesCategoryScreen(this.snapshot);

  //Essa tela será chamada a partir do 'Category Tile'
  @override
  Widget build(BuildContext context) {
    //Widget que definirá a mudança de grid para list na página
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data['title']),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          //No body, é definido a forma de visualização da tab, se em grade
          //ou se em lista
          body: TabBarView(
            //Isso impede do usuário arrastar a página para o lado e incentiva
            //o mesmo a usar os botões para escolher a grade ou a lista
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(color: Colors.red,),
              Container(color: Colors.blue,)
            ],
          ),
        ));
  }
}
