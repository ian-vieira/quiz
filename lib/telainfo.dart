import 'package:flutter/material.dart';

class InformacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações sobre o Quiz App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Este é um aplicativo simples de quiz que permite testar seus conhecimentos em diversas áreas. '
              'O quiz contém perguntas de múltiplas escolhas com diferentes níveis de dificuldade. '
              'Você pode responder as perguntas dentro de um tempo limite e ver seu desempenho ao final.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Desenvolvido por: Ian de Jesus Vieira',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            
            Text('Regras:',style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 163, 53, 45)),),
            SizedBox(height: 20,),

            Text('1- Questão facil ganha 1 ponto',style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 163, 53, 45)),),
            SizedBox(height: 20,),

            Text('2- Questão difícil ganha 2 pontos',style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 163, 53, 45)),),
            SizedBox(height: 20,),

            Text('3- Quem tiver mais pontos ganha',style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 163, 53, 45)),),
            SizedBox(height: 20,),

            Text('4- Sem choro! O Quiz é sobre tudo!. Se voce não acertar pelo menos uma questão, você é burro',style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 163, 53, 45)),),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela inicial
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
