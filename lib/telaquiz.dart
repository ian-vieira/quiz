import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _correctAnswers = 0;
  int _bonusPoints = 0;
  bool _answered = false;
  int? _selectedAnswerIndex;
  late Timer _timer;
  int _timeLeft = 20;

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
    'options': ['3.1421', '3.1416', '3.1415', '3.1432'],
    'answer': 2,
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmG0Sbobcd8Gc-cwgSpC5cKIcw5hlhvYhXbw&s',
    'difficulty': 'medium',
  },
    {
      'question': 'Qual dos cálculos abaixo representa o cálculo de juros composto',
      'options': ['M = C * (1 + i)^t²', 'M = C * (1 + i)^t', 'M = C² * (1 + i)^t', 'M = C * (0,1 + i)^t'],
      'answer': 1,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRImXZkQGP3u9-bDeL3qkudMnHNLrDMf1ohWg&s',
      'difficulty': 'medium',
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
      'options': ['Max Verstappen', 'Dando Molis', 'Lance Stroll', 'Checo Perez'],
      'answer': 0,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhUaAz4JZDNR9yycCeXsW6NRzM5lu2PoLmQA&s',
      'difficulty': 'medium',
      },
    {
      'question': 'Supondo que a linha azul seja o valor das ações da empresa Ian S.A, Em qual momento houve a melhor hora de compra dessas ações?',
      'options': ['entre o 2º e o 3º periodo', 'entre o 3º e o 4º periodo', 'entre o 4º e o 5º periodo', 'entre o 5º e o 6º periodo'],
      'answer': 3,
      'imageUrl': 'https://images.datacamp.com/image/upload/v1680170287/image10_ed33f6d41e.png',
      'difficulty': 'easy',
      },
    {
      'question': 'Qual das frases possui predicativo verbal?',
      'options': ['dida é perverso', 'Caique vive cansado', 'ian é lindo♥', 'Ariel trouxe pedra'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk8Au3rCYtpuiiIb8pzaM5BfoQnv8g806KnA&s',
      'difficulty': 'easy',
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
      'question': 'Nome dado a uma estrela que supostamente é orbitada por coletores de energia é:',
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
      'question': 'Se os catetos do triângulo acima equivale a 7 e 3, qual é o valor aproximado da hipotenusa : ("x" representa o valor da hipotenusa)',
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
      'answer': 1,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyx_Xp9Gp_7t8czZPo3VxBkJTr6lRhBUYKoA&s',
      'difficulty': 'easy',
      },
      {
      'question': 'A estrela mais Próxima do Sol é',
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
      'question': 'Em um mapa de escala 1:50.000, uma cidade que tem 4,5 km de extensão entre seus extremos será representada com:',
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
      'question': 'De quem é essa silhueta',
      'options': ['Alguma das winx', 'Sandy', 'Sininho', 'Fada do dente'],
      'answer': 2,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu1Si2-z5LFqQKzJIDnAqlUKrgfp6c7LSt6Q&s',
      'difficulty': 'esay',
      },
      {
      'question': 'Qual das palavras abaixo é um adjetivo em inglês?',
      'options': ['Run', 'Quickly', 'Drink', 'Geek'],
      'answer': 3,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YRNESMJi_RKBwA7FenYD9Rr7WvW8BpK6MA&s',
      'difficulty': 'medium',
      },
      {
      'question': 'Componente do computador responsável por guardar as informações passageiras',
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
  'question': 'Quantos graus tem um ângulo reto',
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
    String difficulty = _questions[_currentQuestionIndex]['difficulty'];
    _timeLeft = difficulty == 'easy' ? 20 : 30;

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
    _timer.cancel();
    setState(() {
      _answered = true;
    });

    Future.delayed(Duration(seconds: 2), _nextQuestion);
  }

  void _answerQuestion(int selectedOption) {
    final question = _questions[_currentQuestionIndex];
    _timer.cancel();

    setState(() {
      _selectedAnswerIndex = selectedOption;

      if (selectedOption == question['answer']) {
        String difficulty = question['difficulty'];
        int baseScore;

        if (difficulty == 'easy') {
          baseScore = 1;
        } else if (difficulty == 'medium') {
          baseScore = 2;
        } else {
          baseScore = 3;
        }

        int timePenalty = 0;
        if (_timeLeft < 5) {
          timePenalty = -1;
        } else if (_timeLeft < 10 && _timeLeft >= 5) {
          timePenalty = 0;
        } else {
          timePenalty = 1;
        }

        int finalScore = baseScore + timePenalty;
        _score += finalScore.clamp(0, baseScore);

        if (selectedOption == question['answer']) {
          _correctAnswers++;
          _bonusPoints += timePenalty > 0 ? timePenalty : 0;
        }
      }

      _answered = true;
    });

    Future.delayed(Duration(seconds: 0), _nextQuestion);
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _answered = false;
        _selectedAnswerIndex = null;
        _startTimer(); // Reiniciar o cronômetro para a próxima questão
      } else {
        _showScoreDialog();
      }
    });
  }

void _showScoreDialog() {
  int totalPoints = _score + _bonusPoints;
  totalPoints = totalPoints.clamp(0, 80);

  String performance;
  if (totalPoints < 40) {
    performance = 'Desempenho Ruim';
  } else if (totalPoints >= 40 && totalPoints < 60) {
    performance = 'Desempenho Médio';
  } else {
    performance = 'Desempenho Bom';
  }

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Quiz Concluído!'),
      content: Text(
        'Você acertou $_correctAnswers de ${_questions.length} perguntas.\n\n'
        'Pontuação Total: $totalPoints pontos de 80.\n'
        'Pontos bônus: $_bonusPoints pontos de 30.\n'
        'Pontuação ajustada com base no tempo de resposta.\n\n'
        'Avaliação: $performance',
      ),
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
            Navigator.of(context).pop();
          },
          child: Text('Sair'),
        ),
      ],
    ),
  );
}


  void _resetQuiz() {
    // Cancelar o timer atual e reiniciar
    _timer.cancel();
    setState(() {
      _score = 0;
      _correctAnswers = 0;
      _bonusPoints = 0;
      _currentQuestionIndex = 0;
      _answered = false;
      _selectedAnswerIndex = null;
      _timeLeft = 20; // Reiniciar o tempo com base na dificuldade (20 segundos por padrão)
    });

    _startTimer(); // Reiniciar o cronômetro
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFADD8E6),
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.blue,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (question.containsKey('imageUrl'))
            Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.network(
                  question['imageUrl'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          SizedBox(height: 10),

          // Cronômetro circular sem texto fora
          CustomPaint(
            size: Size(30, 30),  // Reduzir ainda mais o tamanho do cronômetro
            painter: TimerPainter(
              timeLeft: _timeLeft,
            ),
          ),
          
          SizedBox(height: 10),

          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Questão ${_currentQuestionIndex + 1}:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  question['question'],
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          ...List.generate(question['options'].length, (index) {
            final isCorrect = index == question['answer'];
            final isSelected = index == _selectedAnswerIndex;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: _answered ? null : () => _answerQuestion(index),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    _answered
                        ? (isSelected
                            ? (isCorrect ? Colors.green : Colors.red)
                            : (isCorrect ? Colors.green : Colors.grey))
                        : Colors.yellow[700],
                  ),
                  minimumSize: MaterialStateProperty.all(Size(150, 10)),
                ),
                child: Text(
                  question['options'][index],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final int timeLeft;

  TimerPainter({required this.timeLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = _getColor(timeLeft)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    // Desenha o círculo de fundo
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, backgroundPaint);

    // Desenha o círculo com base no tempo restante
    double progress = (timeLeft / 30).clamp(0.0, 1.0); // Ajuste para o tempo
    double sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -pi / 2, // Iniciar no topo
      sweepAngle,
      false,
      circlePaint,
    );

    // Desenha o texto com o tempo restante
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$timeLeft',
        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width);

    textPainter.paint(canvas, size.center(Offset.zero) - Offset(textPainter.width / 2, textPainter.height / 2));
  }

  Color _getColor(int timeLeft) {
    if (timeLeft <= 5) {
      return Colors.red;
    } else if (timeLeft <= 10) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}