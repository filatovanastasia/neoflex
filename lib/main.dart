import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const Color primaryColor = Color(0xFF2D0052);
  static const Color accentColor = Color(0xFFFF6A00);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neoflex квест',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 166, 103),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: const Color.fromARGB(255, 253, 166, 104),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neoflex квест'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'О компании Neoflex',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset('lib/assets/mascot2.png',
                    height: 300,
                    width: 300,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.business, size: 300)),
              ),
              const SizedBox(height: 20),
              const Text(
                '''
        Neoflex — ведущий российский IT-интегратор, основанный в 2005 году. Компания разрабатывает кастомные цифровые решения для крупнейших банков, страховых компаний, ритейлеров и госсектора. В числе клиентов — Сбер, ВТБ, Газпромбанк, Альфа-Банк и многие другие.

        Neoflex предлагает широкий спектр продуктов: от платформы для отчетности в ЦБ — Neoflex Reporting, до решения для управления API — NEOMSA APIM, а также систему Neoflex MLOps Center для внедрения моделей машинного обучения.

        Компания активно использует микросервисную архитектуру, облачные технологии, машинное обучение и большие данные. Большое внимание уделяется дизайн-мышлению и работе с пользовательским опытом.

        С 2016 года Neoflex начал развивать проекты в области интернета вещей (IoT), а в 2020 году вышел на рынок Китая и открыл центр разработки в Пензе. География присутствия компании постоянно расширяется.

        В 2024 году Neoflex представил инновационный продукт для оценки кредитных рисков — Neoflex Reporting Risk, а общее число сотрудников достигло 1400 человек.

        Компания также является партнером международных вендоров, в том числе Lightbend, и активно развивает собственные образовательные инициативы, акселераторы и карьерные треки для молодых специалистов.
                ''',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/mascot_small.png',
                        height: 50,
                        width: 50,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox.shrink()),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const QuizScreen(),
                          ),
                        );
                      },
                      child: const Text('Пройти тест'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswerIndex});
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;
  int _neoflexiki = 0;

  final List<Question> _questions = [
    Question(
      question: 'В каком году была основана компания Неофлекс?',
      options: ['1995', '1999', '2005', '2010'],
      correctAnswerIndex: 2,
    ),
    Question(
      question:
          'Какой продукт предназначен для автоматизации обязательной отчетности ЦБ?',
      options: [
        'Neoflex FrontOffice',
        'Neoflex MLOps Center',
        'Neoflex Reporting',
        'Neoflex Foundation'
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      question:
          'Какая архитектура активно используется компанией Neoflex в построении высоконагруженных приложений?',
      options: [
        'Монолитная',
        'Клиент-серверная',
        'Плагин-ориентированная',
        'Микросервисная'
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      question:
          'Какое направление деятельности активно развивалось в компании в 2016 году?',
      options: [
        'Искусственный интеллект',
        'Интернет вещей (IoT)',
        'Кибербезопасность',
        'Веб-разработка'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question: 'В каком году был открыт центр разработки Neoflex в Пензе?',
      options: ['2021', '2020', '2019', '2018'],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          'С каким из следующих международных вендоров Neoflex заключила партнерство?',
      options: ['Microsoft', 'Lightbend', 'Oracle', 'Red Hat'],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          'Какой продукт был представлен в 2024 году для расчета кредитных рисков?',
      options: [
        'Neoflex Reporting Studio',
        'NEOMSA APIM',
        'Neoflex Reporting Risk',
        'Neoflex Datagram'
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      question:
          'Какой географический регион был охвачен проектами Neoflex впервые в 2020 году?',
      options: ['Южная Америка', 'Китай', 'Канада', 'Скандинавия'],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          'Какая методология активно применяется Neoflex для фокусировки на пользовательском опыте?',
      options: ['Agile', 'Design Thinking', 'Prince2', 'Waterfall'],
      correctAnswerIndex: 1,
    ),
    Question(
      question: 'Сколько сотрудников насчитывалось в Neoflex к 2024 году?',
      options: ['Около 1000', 'Более 1200', 'Около 1400', 'Более 1600'],
      correctAnswerIndex: 2,
    ),
  ];

  void _checkAnswer(int selectedIndex) {
    final question = _questions[_currentQuestionIndex];

    if (selectedIndex == question.correctAnswerIndex) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _neoflexiki = _score *
            20; // за каждый правильный ответ начисляется 20 неофлексиков
        _quizCompleted = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тест'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _quizCompleted ? _buildResultScreen() : _buildQuestionScreen(),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final question = _questions[_currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              'Вопрос ${_currentQuestionIndex + 1} из ${_questions.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          question.question,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        ...question.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ElevatedButton(
              onPressed: () => _checkAnswer(index),
              child: Text(option),
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildResultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Тест завершен!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('lib/assets/mascot_happy.png',
              height: 180,
              width: 180,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink()),
          const SizedBox(height: 20),
          Text(
            'Ваш результат: $_score из ${_questions.length}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Вы заработали: $_neoflexiki неофлексиков',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _restartQuiz,
            child: const Text('Пройти тест заново'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShopScreen(neoflexiki: _neoflexiki),
                ),
              );
            },
            child: const Text('Перейти в магазин'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
            ),
          ),
        ],
      ),
    );
  }
}
class ShopScreen extends StatefulWidget {
  final int neoflexiki;

  const ShopScreen({Key? key, required this.neoflexiki}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late int _neoflexiki;

  @override
  void initState() {
    super.initState();
    _neoflexiki = widget.neoflexiki;
  }

  void _buyItem(int price, String itemName) {
    if (_neoflexiki >= price) {
      setState(() {
        _neoflexiki -= price;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Поздравляем!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ты купил $itemName!\n\nСделай скриншот этого экрана, приходи в офис, покажи его нам и мы отдадим тебе твой приз!',
              ),
              const SizedBox(height: 20),
              Image.asset(
                'lib/assets/mascot_love.png',
                height: 150,
                width: 150,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ок'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Возвращаемся только на главную
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false, // Удаляем все предыдущие экраны
        );
        return false; // Отменяем стандартное поведение возврата
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Магазин'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'У вас: $_neoflexiki неофлексиков',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed:
                    _neoflexiki >= 60 ? () => _buyItem(60, 'значок') : null,
                child: const Text('Значок - 60 неофлексиков'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed:
                    _neoflexiki >= 100 ? () => _buyItem(100, 'ручку') : null,
                child: const Text('Ручка - 100 неофлексиков'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed:
                    _neoflexiki >= 180 ? () => _buyItem(180, 'блокнотик') : null,
                child: const Text('Блокнотик - 180 неофлексиков'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
