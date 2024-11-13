import 'dart:async';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false; // Para verificar se a pergunta foi respondida
  int? _selectedAnswerIndex; // Índice da resposta selecionada
  late Timer _timer; // Timer para controlar o tempo de resposta
  int _timeLeft = 20; // Tempo restante para a questão (inicialmente 20 segundos)

  final List<Map<String, dynamic>> _questions = [
    {
    'question': 'Qual é o nome da célula responsável pela produção de anticorpos no sistema imunológico?',
    'options': ['Neurônio', 'Hematócito', 'Linfócito B', 'Eritrócito'],
    'answer': 2,
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_q8jxMUUVplSTwMgZQPUtRAcIBSsD5gzpA&s',
    'difficulty': 'medium',
  },
      {
    'question': 'Qual é o valor de π (Pi) com 4 casas decimais?',
    'options': ['3.142', '3.1416', '3.1415', '3.1432'],
    'answer': 2,
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmG0Sbobcd8Gc-cwgSpC5cKIcw5hlhvYhXbw&s',
    'difficulty': 'medium',
  },
    {
      'question': 'Quantos continentes existem na Terra?',
      'options': ['7', '6', '5', '8'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0HVK-6SQ-YqPR8SLV5kQJ4Wxy6BZjlwemdg&s',
      'difficulty': 'easy',
      },
    {
      'question': 'qual o log de 100 na base 10',
      'options': ['1', '3', '4', '2'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSKd4EC7piZijmsFh_yvzFyw-an9M8LyTirA&s',
      'difficulty': 'medium',
      },
    {
      'question': 'quem é o melhor piloto atual da f1?',
      'options': ['Max', 'Dando Molis', 'Stroll', 'Checo'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhUaAz4JZDNR9yycCeXsW6NRzM5lu2PoLmQA&s',
      'difficulty': 'medium',
      },
    {
      'question': 'qual é a raiz de 144?',
      'options': ['11', '12', '13', '14'],
      'answer': 1,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKJMHp3N8p6xg-VKiSzjMs1fI8TTYZaACiIg&s',
      'difficulty': 'easy',
      },
    {
      'question': 'Qual das frases possui predicativo verbal?',
      'options': ['dida é perverso', 'Katarina vive cansada', 'ian é lindo♥', 'Ariel trouxe pedra'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk8Au3rCYtpuiiIb8pzaM5BfoQnv8g806KnA&s',
      'difficulty': 'medium',
      },
    {
      'question': 'Que carro é esse?',
      'options': ['Dodge Hellcat', 'Mustang Cobra', 'Ford Shelby', 'Dodge Demon'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE6tdrkyeEc2eB5zu_smFiwkiu6L43mvRSww&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Qual o nome disso?',
      'options': ['EnderMen', 'Zombie', 'Nigglas', 'Creeper'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5PsgCtDGAWTMk-Q1_mHWfU-JuEQnfLFieUg&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Com exceção da linha do equador, as linhas apresentadas na imagem são chamadas de:?',
      'options': ['linhas latitudinais', 'linhas altitudinais', 'linhas transversais', 'linhas longitudinais'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ006KkmT_XW8jqPCvc_tD7zOz4ARmKYPlHQ&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Nome dado a uma estrela, que supostamente é orbitada por coletores de energia, é:',
      'options': ['Estrela Quantica', 'Electrica Vim Stellam', 'Estrela de Dyson', 'N.D.A'],
      'answer': 2,
      'imageUrl': 'https://earthsky.org/upl/2018/08/Dyson-sphere-Kevin-Gill-Wiki-Commons-sq.png',
      'difficulty': 'medium',
      },
      {
      'question': 'O nome desse esmalte da Risque é:',
      'options': ['Diamante do Baile', 'Ocean blue', 'O escandalo de whistledown', 'Azul tifane'],
      'answer': 2,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQjhzSAbLPd1lySo6uOSIaM9CGRClaXZCvdA&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Se os catetos do triângulo acima equivale a 7 e 3, qual é o valor da hipotenusa ,aproximadamente: ("x" representa o valor da hipotenusa)',
      'options': ['7<x<8', '8<x<9', 'x = 7,3', 'x = 6,67'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNSda7mjMU29urZ6b6kH-P9hMAb-S2oekCtg&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Os amortecedores têm por função:',
      'options': ['evitar o atrito dos pneus com o solo.', 'auxiliar a mudança de direção nas curvas.', 'reduzir os movimentos bruscos da mola.', 'aumentar a vida dos pneus.'],
      'answer': 2,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7Th6TdtC6wEr4SxsWSNYSjvGHeFsIw7He4g&s',
      'difficulty': 'medium',
      },
      {
      'question': 'O nome do processo de reprodução celular representado acima é:',
      'options': ['Difusão', 'Meiose', 'citose', 'Mitose'],
      'answer': 3,
      'imageUrl': 'https://d23vy2bv3rsfba.cloudfront.net/questoes_imagens/0_e7cb0be3c361a219750cfbd93320388a_1051193.jpg.png',
      'difficulty': 'easy',
      },
      {
      'question': 'A estrela mais Proxima do Sol é',
      'options': ['Lua', 'Lalande 21185', 'Sirius', 'Ross 154'],
      'answer': 1,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQruT802-ZMn5eJ9Sdr25h1DsyJ_3NmaVa9w&s',
      'difficulty': 'medium',
      },
      {
      'question': 'qual a parte do corpo que não é reconhecido pelo sistema imunológico',
      'options': ['Olhos', 'unhas', 'céu da boca', 'língua'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0tS6KhuoRL-YknjytctHpXI0e7hDiOvlJUw&s',
      'difficulty': 'medium',
      },
      {
      'question': 'um mapa de escala 1:50.000, uma cidade que tem 4,5 Km de extensão entre seus extremos será representada com',
      'options': ['90 cm.', '9 cm.', '225 mm.', '11 mm.'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3QUeRJ7FXwbP0d9PwQDFbpCY05Qj1le8KfQ&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Determine a diferença de potencial em um fio condutor com resistência de 20 Ohms, por onde passa uma corrente de 5 Amperes.',
      'options': ['110 V', '90 V', '225 V', '100 V'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTkHHNXOLLCZecWyZZtXMELhvFGwaCzClMtEepPX_1kwX8I2I4SvJNB9CKPkhF3eaIgZU&usqp=CAU',
      'difficulty': 'medium',
      },
      {
      'question': 'de quem é essa silhueta',
      'options': ['Alguma fela da puta das winx', 'Sandy', 'Sininho', 'Fada do dente'],
      'answer': 2,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu1Si2-z5LFqQKzJIDnAqlUKrgfp6c7LSt6Q&s',
      'difficulty': 'esay',
      },
      {
      'question': 'Qual das palavras abaixo é um adjetivo em inglês?',
      'options': ['Run', 'Quickly', 'Drink', 'Geek'],
      'answer': 2,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YRNESMJi_RKBwA7FenYD9Rr7WvW8BpK6MA&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Componente do computador responsavel por guardar as informações passageiras',
      'options': ['Memoria ram', 'Memoria Hd', 'Memoria Ssd', 'Memoria NvmE'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU_-LUu_teFd00NCRyoIytFY-Hdsp-pS6cyQ&s',
      'difficulty': 'easy',
      },
      {
  'question': 'Em que ano o homem pisou na Lua pela primeira vez?',
  'options': ['1969', '1971', '1968', '1970'],
  'answer': 0,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRij6H4M6NqjaSSLuOYt0-lDGpYAoFbZdWH4w&s',
  'difficulty': 'medium',
},
{
  'question': 'Qual é o nome do maior oceano do mundo?',
  'options': ['Atlântico', 'Índico', 'Ártico', 'Pacífico'],
  'answer': 3,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrcZfG6qit_RYgPngpY-hspyZ6k02JK50Ncw&s',
  'difficulty': 'easy',
},
{
  'question': 'Quantos graus tem um ângulo reto?',
  'options': ['45', '60', '90', '180'],
  'answer': 2,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu2YX3skFQkalDCbxBu3_0Sp4VxTw8ydgNiQ&s',
  'difficulty': 'easy',
},
{
  'question': 'Quem escreveu "Dom Quixote"?',
  'options': ['Gabriel García Márquez', 'Miguel de Cervantes', 'William Shakespeare', 'Fernando Pessoa'],
  'answer': 1,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShwqZOa0k6uWYSQAkLb10GxAr5sjFmzUcbPg&s',
  'difficulty': 'medium',
},
{
  'question': 'Qual é o gás mais abundante na atmosfera terrestre?',
  'options': ['Oxigênio', 'Nitrogênio', 'Dióxido de carbono', 'Hidrogênio'],
  'answer': 1,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9QnPcludsB_LJjy86OLIEt1NlTSovizpgA&s',
  'difficulty': 'medium',
},
{
  'question': 'Quem pintou "A Última Ceia"?',
  'options': ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
  'answer': 2,
  'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Leonardo_da_Vinci_-_The_Last_Supper_high_res.jpg/450px-Leonardo_da_Vinci_-_The_Last_Supper_high_res.jpg',
  'difficulty': 'easy',
},
{
  'question': 'Quantos lados tem um octógono?',
  'options': ['6', '8', '10', '12'],
  'answer': 1,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtXkViEdpez_J4m8kZzWaHkCHKwBY_mvePA&s',
  'difficulty': 'easy',
},
{
  'question': 'A estrutura química a seguir pertence a:',
  'options': ['Amoxicilina', 'Mel', 'Acido Sulfurico', 'Acetona'],
  'answer': 3,
  'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5A2BjRhgLug1QU_D7jGODszvTV2JlVB_2eg&s',
  'difficulty': 'medium',
},

      
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Define o tempo de resposta baseado na dificuldade da questão
    String difficulty = _questions[_currentQuestionIndex]['difficulty'];
    _timeLeft = difficulty == 'easy' ? 20 : 30;

    // Inicia o timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timeUp();
        }
      });
    });
  }

  void _timeUp() {
    // Se o tempo acabar, considera a pergunta como respondida automaticamente
    _timer.cancel(); // Cancela o timer
    setState(() {
      _answered = true;
    });

    // Avançar para a próxima pergunta após 2 segundos
    Future.delayed(Duration(seconds: 2), _nextQuestion);
  }

  void _answerQuestion(int selectedOption) {
    final question = _questions[_currentQuestionIndex];
    _timer.cancel(); // Cancela o timer assim que a resposta é dada

    setState(() {
      _selectedAnswerIndex = selectedOption;
      if (selectedOption == question['answer']) {
        _score++;
      }
      _answered = true; // Marca como respondida
    });

    // Avança para a próxima pergunta após 2 segundos
    Future.delayed(Duration(seconds: 2), _nextQuestion);
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _answered = false; // Permite responder a nova pergunta
        _selectedAnswerIndex = null; // Reseta a resposta selecionada
        _startTimer(); // Inicia o timer para a próxima pergunta
      } else {
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Concluído!'),
        content: Text('Você acertou $_score de ${_questions.length} perguntas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetQuiz();
            },
            child: Text('Tentar Novamente'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Volta para a tela inicial
            },
            child: Text('Sair'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
      _answered = false; // Reseta o estado de resposta
      _selectedAnswerIndex = null; // Reseta a resposta selecionada
      _timeLeft = 20; // Reseta o tempo
    });
  }

  @override
  void dispose() {
    // Cancela o timer quando o widget for removido da árvore
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuizQuestion()
          : Center(
              child: Text(
                'Parabéns! Você completou o quiz.',
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }

  Widget _buildQuizQuestion() {
    final question = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagem da pergunta (se existir)
          if (question.containsKey('imageUrl'))
            Center(
              child: SizedBox(
                width: 250, // Diminuindo o tamanho da imagem
                height: 250, // Diminuindo o tamanho da imagem
                child: Image.network(
                  question['imageUrl'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          SizedBox(height: 20), // Espaço entre a imagem e o cronômetro

          // Cronômetro (Tempo restante)
          Text(
            'Tempo Restante: $_timeLeft segundos',
            style: TextStyle(fontSize: 18, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20), // Espaço entre o cronômetro e a pergunta

          // Exibe o número da questão e a pergunta na mesma linha
          Row(
            children: [
              Text(
                'Questão ${_currentQuestionIndex + 1}: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  question['question'],
                  style: TextStyle(fontSize: 18),
                  softWrap: true, // Garante quebra de linha na pergunta se necessário
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Espaço entre a pergunta e as opções de resposta

          // Opções de respostas
          ...List.generate(question['options'].length, (index) {
            final isCorrect = index == question['answer'];
            final isSelected = index == _selectedAnswerIndex;

            return ElevatedButton(
              onPressed: _answered
                  ? null
                  : () => _answerQuestion(index), // Desabilita quando já respondido
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _answered
                      ? (isSelected
                          ? (isCorrect ? Colors.green : Colors.red)
                          : (isCorrect ? Colors.green : Colors.grey)) // Se for correto e não selecionado, fica verde
                      : Colors.white, // Cor padrão enquanto não respondido
                ),
              ),
              child: Text(question['options'][index]),
            );
          }),
        ],
      ),
    );
  }
}