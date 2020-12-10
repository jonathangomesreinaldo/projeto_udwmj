import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_udwmj/tiles/category_tile.dart';

class CoursesTab extends StatelessWidget {
  const CoursesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Por obter dados do Firebase usamos o FutureBuilder
    return FutureBuilder<QuerySnapshot>(
      //O future irá obter todas as categorias da coleção 'Courses' do Firebase
      future: Firestore.instance.collection('courses').getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          //Caso não obtenha ou não carregue nenhum dado, irá mostrar um círculo
          //de carregamento
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    //No CategoryTile, o documento é transformado no CategoryTile
                    return CategoryTile(doc);
                  }
                      //Após ser transformado em CategoryTile, ele é novamente transformado
                      //em uma lista dando assim a visualização do que é trazido do Firebase
                      ).toList(),
                  color: Colors.blueGrey,)
              .toList();
          return ListView(
            
            //É trazido cada documento criado no Firebase e em seguida é retornado
            //esse documento no CategoryTile
            children: dividedTiles,
          );
        }
      },
    );
  }
}
