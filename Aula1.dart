import 'package:flutter/material.dart';

/* 
 * Função Main :
 * executa a função runApp, passando o nosso Widget MyApp como parametro
 * roda o nosso app
*/
void main() {
  runApp(MyApp());
} //fim da função main

/* 
 * Instancia um Objeto da classe TextEditingController com nome de 'conteudo' para passarmos no parâmetro controller do nosso TextField
*/
TextEditingController conteudo = TextEditingController();

/*
 * Nosso Widget MyApp, onde toda construção da nossa tela inicial do app é feita
*/
class MyApp extends StatelessWidget {
  
  /*
   * Função build:
   * função dentro do seu Widget MyApp que faz a construção da sua página
  */
  @override // @override é uma tag obrigatória para a função build nesse tipo de construção
  build(c) {
    
    // A função build retorna um Widget, no nosso caso, instanciando um Widget MaterialApp
    return MaterialApp(
        theme: ThemeData.dark(), // parâmetro theme, recebendo o tema escuro
        debugShowCheckedModeBanner: false, // ao passar false para este parâmetro, esconde-se uma tag de debug que ficaria no canto da tela

        /*
         * Para o parâmetro 'home' do nosso MaterialApp, instanciamos um objeto da classe Scaffold.
         * O Scaffold é caracterizado por fornecer uma estrutura base para a construção do nosso App, assim podemos pular toda uma construção estrutural chata e repetitiva
        */
        home: Scaffold(
          
          /*
           * Para o parâmetro 'body' do nosso Scaffold, instanciamos um objeto da classe Center.
           * O Center é caracterizado por concentrar o Widget filho(child) dele no centro da tela.
          */
          body: Center(
            
            /*
             * Para o filho(child) do nosso Center, instanciamos um objeto da classe Column.
             * O Column é caracterizado por formar uma coluna de altura ilimitada e comprimento definido comprimento de seus filhos(children).
             * Um diferencial do Column é que ele tem um parâmetro children ao invés de child, ou seja, pode receber a quantidade de "filhos" que vc desejar.
            */
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Imprima um texto', style: TextStyle(fontSize: 42.0)),
              
              // O Padding serve para criar um espaçamento ao redor do nosso Widget
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 55, 50, 15),
                
                /*
                 * Como child do nosso Padding, instanciamos um TextField.
                 * O TextField é um Widget de natureza de input, onde permitimos o usuário a inserir um texto, com o qual podemos trabalhar no código através de um controller.
                */
                child: TextField(
                  
                  // No parâmetro 'controller' do nosso TextField, passamos o TextEditingController que instanciamos nas primeiras linhas do nosso código.
                  controller: conteudo,
                  
                  // Para o parâmetro decoration, passamos alguns recursos de estilização para deixar nosso app bonito e dinâmico
                  decoration: const InputDecoration(
                      label: Text('digite aqui'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0))) //fim OutlineInputBorder
                      ), //fim InputDecoration
                ), //fim TextField
              ), // fim Padding

              TextButton(
                  child: Text('aperte'),
                /*
                 * O parâmetro onPressed de um botão recebe uma função que será executada toda vez que o botão for pressionado.
                 * Neste caso, criamos uma função anônima, diretamente no corpo do TextButton que irá executar um comando print;
                 * dentro do print, colocamos um 'conteudo.text' que chama diretamente um atributo do Objeto conteudo, da classe TextEditing Controller, que criamos.
                */
                  onPressed: () {
                    print('${conteudo.text}');
                  }
              ), // fim TextButton
            ]), // fim Column
          ), //fim Center
        ) //fim Scaffold

        ); //fim MaterialApp
  } //fim build
} // fim MyApp
