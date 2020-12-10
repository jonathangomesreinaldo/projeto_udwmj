import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  //const DrawerTile({Key key}) : super(key: key);

  //Método construtor que receberá um ícone e um texto
  final IconData icon;
  final String text;
  final PageController controller;
  //Parâmetro que definirá qual página será acessada através do tap nos
  //respectivos conteúdos
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    //O Material é retornado para dar um efeito visual
    //ao clicar no ícone
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          //Aqui é dado o comando para fechar o menu arrastável
          Navigator.of(context).pop();
          //Aqui é dado a função de pular para a respectiva página clicada
          controller.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                //Nessa parte, define-se a cor do ícone na página atual
                color: controller.page.round()==page?
                Theme.of(context).primaryColor:Colors.black,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, //Nessa parte, define-se a cor do ícone na página atual
                color: controller.page.round()==page?
                Theme.of(context).primaryColor:Colors.black,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
