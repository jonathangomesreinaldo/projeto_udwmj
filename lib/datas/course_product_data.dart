import 'package:cloud_firestore/cloud_firestore.dart';

//Classe que trará todos os itens dos documentos armazenados no Firestore
class CourseProductData {
  String id;
  String category;
  String title;
  String description;
  double price;
  List images;

  //O construtor CourseProductData, semelhantemente irá receber esses documentos
  //e sem seguida irá transformá-los para leitura do snapshot
  CourseProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data['title'];
    description = snapshot.data['desc'];
    price = snapshot.data['price']+0.0;

  }
}
