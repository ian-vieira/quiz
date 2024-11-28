import 'package:flutter/material.dart';
import 'telaquiz.dart';
import 'telainfo.dart'; 

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Quiz App'),
        backgroundColor: Colors.blue.shade100, 
      ),
      body: Container(
        color: Colors.blue.shade100, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
                width: 300, 
                height: 300, 
                fit: BoxFit.cover, 
              ),
              const Text(
                'Bem-vindo ao Quiz!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, 
                  foregroundColor: Colors.black, 
                ),
                child: const Text('Iniciar Quiz'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformacoesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, 
                  foregroundColor: Colors.black,
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
