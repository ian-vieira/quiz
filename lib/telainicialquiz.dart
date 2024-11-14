import 'package:flutter/material.dart';
import 'telaquiz.dart'; // Importa a página do quiz
import 'telainfo.dart'; // Importa a página de informações

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Quiz App'),
        backgroundColor: Colors.blue.shade100, // Cor do AppBar com azul bebê
      ),
      body: Container(
        color: Colors.blue.shade100, // Cor de fundo da tela para azul bebê
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
                width: 300, // Largura desejada
                height: 300, // Altura desejada
                fit: BoxFit.cover, // Ajusta a imagem para cobrir a área
              ),
              const Text(
                'Bem-vindo ao Quiz!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navega para a página do quiz
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Cor de fundo do botão (amarelo)
                  foregroundColor: Colors.black, // Cor do texto (preto)
                ),
                child: const Text('Iniciar Quiz'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navega para a página de informações
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformacoesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Cor de fundo do botão (amarelo)
                  foregroundColor: Colors.black, // Cor do texto (preto)
                ),
                child: const Text('Informações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
