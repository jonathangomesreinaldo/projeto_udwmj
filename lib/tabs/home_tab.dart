import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  //const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Função que cria um fundo degradê da página principal enquanto as imagens
    //são carregadas
    Widget _buildBodyBack() => Container(
          //Tipo de função usada para decoração
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromARGB(255, 84, 11, 14),
                Color.fromARGB(255, 158, 42, 43)
              ],
                  //Função qeu define o começo e o final da orientação do degradê
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        );
    //É utilizado o widget 'Stack', pois queremos colocar todos os conteúdos das
    //imagens acima do fundo degradê
    return Stack(
      children: [
        //Retorna-se a função do Widget criado acima.
        _buildBodyBack(),
        //Widget que é um ScrollView customizado
        CustomScrollView(
          slivers: [
            //Widget que é uma barra do tipo Sliver, que será do tipo flutuante
            SliverAppBar(
              //Quando a barra for puxada para baixo, ela irá desaparecer
              //de acordo com a extensão da página, se ela for eqrguida um pouco
              //ela reaparecerá.
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              //Tipo de função que fará com que a barra seja flexível
              flexibleSpace: FlexibleSpaceBar(
                //Usa-se 'const' para que seja sempre usado constantemente o widget
                //que trará sempre o mesmo valor
                title: const Text('Cursos UDWMJ'),
                centerTitle: true,
              ),
            ),
            //Builder usado para indicar o carregamento das imagens, já que
            //elas serão carregadas assincronamente
            FutureBuilder<QuerySnapshot>(
              //builder: null,
              //O future entra no firebase, pega a coleção 'home' e ordena
              //as imagens baseando-se em suas posições
              //'**As posições das imagens foram definidas no firebase
              future: Firestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  //Colocando as imagens em uma grade na tela
                  //O '.count' será feita a contagem das imagens e elas serão
                  //colocadas ao mesmo tempo na tela
                  return SliverStaggeredGrid.count(
                      //Quantidade de blocos na tela
                      crossAxisCount: 2,
                      //Espaçamento entre as imagens
                      mainAxisSpacing: 1.0,
                      //Espaçamento horizontal
                      crossAxisSpacing: 1.0,
                      //Dimensionando cada uma das imagens
                      //Iremos pegar a lista de documentos e mapeá-lo
                      staggeredTiles: snapshot.data.documents.map(
                          //doc é uma função anônima que recebe o mapeamento, ou seja
                          //para cada um dos documentos presentes na lista do firebase
                          //a função anônima 'doc' será chamada
                          (doc) {
                        return StaggeredTile.count(
                            //para cada documento lido, a função 'doc' trará o
                            //'x' e o 'y' de cada documento e os transforma
                            //em um StaggredTile
                            doc.data['x'],
                            doc.data['y']);
                      }).toList(),
                      //Imagens
                      children: snapshot.data.documents.map((doc) {
                        //Esse comando faz a imagem aparecer suavemente na tela
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data['image'],
                          fit: BoxFit.cover,
                        );
                      }).toList());
              },
            ),
          ],
        )
      ],
    );
  }
}
