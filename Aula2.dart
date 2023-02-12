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
 * Instancia Objetos da classe TextEditingController para passarmos no parâmetro controller dos nossos TextFields
*/
TextEditingController conteudo = TextEditingController();
TextEditingController controllerUsuario = TextEditingController();
TextEditingController controllerSenha = TextEditingController();

// Variável booleana que armazena se o usuário está logado ou não
bool isLogado = false;
 
/*
 * Nosso Widget MyApp, onde toda construção da nossa tela inicial do app é feita
 * Ele é Stateful, ou seja, pode ter vários estados e apresentar modificações na tela
*/
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
 
// Estado inicial do nosso app
class _MyAppState extends State<MyApp> {
  /*
   * Função build:
   * função dentro do seu Widget MyApp que faz a construção da sua página
  */
  @override // @override é uma tag obrigatória para a função build nesse tipo de construção
  build(c) {
    // A função build retorna um Widget, no nosso caso, instanciando um Widget MaterialApp
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.indigo,
        ), // parâmetro theme, recebendo um ThemeData que define o dark mode e a paleta de cor principal do app
        debugShowCheckedModeBanner:
            false, // ao passar false para este parâmetro, esconde-se uma tag de debug que ficaria no canto da tela
 
        /*
         * Para o parâmetro 'home' do nosso MaterialApp, instanciamos um objeto da classe Scaffold.
         * O Scaffold é caracterizado por fornecer uma estrutura base para a construção do nosso App, assim podemos pular toda uma construção estrutural chata e repetitiva
        */
        home: Scaffold(
          /*
           * Para o parâmetro 'body' do nosso Scaffold, instanciamos um objeto da classe Center.
           * O Center é caracterizado por concentrar o Widget filho(child) dele no centro da tela.
          */
          appBar: isLogado
              ? AppBar(
                  title: Text('Bem-vindo(a), ${controllerUsuario.text}'),
                  actions: [
                   // Acrescentamos um botão de Logoff no AppBar
                    PopupMenuButton(
                      itemBuilder: (c) => [
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text('Logout'),
                            onTap: () {
                              setState(() {
                                isLogado = false;
                                controllerUsuario.text = '';
                                controllerSenha.text = '';
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                )
              : null,
          body: Center(
            /*
             * Para o filho(child) do nosso Center, instanciamos um objeto da classe Column.
             * O Column é caracterizado por formar uma coluna de altura ilimitada e comprimento definido comprimento de seus filhos(children).
             * Um diferencial do Column é que ele tem um parâmetro children ao invés de child, ou seja, pode receber a quantidade de "filhos" que vc desejar.
            */
            child: isLogado
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text('Imprima um texto',
                            style: TextStyle(fontSize: 42.0)),
 
                        // O Padding serve para criar um espaçamento ao redor do nosso Widget
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 55, 50, 15),
 
                          child: TextField(
                            // No parâmetro 'controller' do nosso TextField, passamos o TextEditingController que instanciamos nas primeiras linhas do nosso código.
                            controller: conteudo,
 
                            // Para o parâmetro decoration, passamos alguns recursos de estilização para deixar nosso app bonito e dinâmico
                            decoration: const InputDecoration(
                                label: Text('Insira um texto'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            8.0))) //fim OutlineInputBorder
                                ), //fim InputDecoration
                          ), //fim TextField
                        ), // fim Padding
 
                        OutlinedButton(
                            child: const Text('Imprimir'),
                            /*
                 * O parâmetro onPressed de um botão recebe uma função que será executada toda vez que o botão for pressionado.
                 * Neste caso, criamos uma função anônima, diretamente no corpo do TextButton que irá executar um comando print;
                 * dentro do print, colocamos um 'conteudo.text' que chama diretamente um atributo do Objeto conteudo, da classe TextEditing Controller, que criamos.
                */
                            onPressed: () {
                              print(conteudo.text);
                            }), // fim TextButton
                      ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tela de Login',
                          style: TextStyle(fontSize: 42.0)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 55, 50, 5),
 
                        child: TextField(
                          // No parâmetro 'controller' do nosso TextField, passamos o TextEditingController que instanciamos nas primeiras linhas do nosso código.
                          controller: controllerUsuario,
 
                          // Para o parâmetro decoration, passamos alguns recursos de estilização para deixar nosso app bonito e dinâmico
                          decoration: const InputDecoration(
                              label: Text('Usuário'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0))) //fim OutlineInputBorder
                              ), //fim InputDecoration
                        ), //fim TextField
                      ), // fim Padding
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 5, 50, 15),
 
                        child: TextField(
                          // No parâmetro 'controller' do nosso TextField, passamos o TextEditingController que instanciamos nas primeiras linhas do nosso código.
                          controller: controllerSenha,
                         // Para a senha, passamos true para o parâmetro obscureText para que o conteúdo da senha não fique exposto enquanto digita
                          obscureText: true,
 
                          // Para o parâmetro decoration, passamos alguns recursos de estilização para deixar nosso app bonito e dinâmico
                          decoration: const InputDecoration(
                              label: Text('Senha'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0))) //fim OutlineInputBorder
                              ), //fim InputDecoration
                        ), //fim TextField
                      ), // fim Padding
                     
                     // Botão de login
                      TextButton(
                       // Para o parâmetro onPressed, testamos se o usuário e senha estão corretos para então definir isLogado como true
                        onPressed: () {
                         // A função do setState permite que a tela atualize em estado após o término da função, fazendo com que possamos apresentar mudanças na tela durante a execução do app
                          setState(() {
                            if (controllerUsuario.text == 'marcelo') {
                              if (controllerSenha.text == '123') {
                                isLogado = true;
                              }
                            }
                          });
                        },
                        child: const Icon(Icons.login),
                      ),
                    ],
                  ), // fim Column
          ), //fim Center
        ) //fim Scaffold
 
        ); //fim MaterialApp
  } //fim build
} // fim MyApp
