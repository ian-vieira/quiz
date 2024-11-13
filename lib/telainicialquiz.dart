import 'package:flutter/material.dart';
import 'telaquiz.dart'; // Importa a página do quiz
import 'telainfo.dart'; // Importa a página de informações

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
              width: 300, // Largura desejada
              height: 300, // Altura desejada
              fit: BoxFit.cover, // Ajusta a imagem para cobrir a área
            ),
            Text(
              'Bem-vindo ao Quiz!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega para a página do quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Iniciar Quiz'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de informações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformacoesPage()),
                );
              },
              child: Text('Informações'),
            ),
          ],
        ),
      ),
    );
  }
}
