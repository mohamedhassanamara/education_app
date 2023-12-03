import 'package:education_app/ui/view/quiz_result_screen.dart';
import 'package:flutter/material.dart';
import '../../core/view_models/user_view_model.dart';
import '../shared/text_styles.dart';

class QuizScreen extends StatefulWidget {
  final UserViewModels userViewModel;
  const QuizScreen({super.key, required this.userViewModel});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  int _currentQuestionIndex = 0;
  final List<String> _selectedAnswers = List.filled(10, '');

  List<String> questions = [
    'What is 1 +1?',
    'What is 2 +2?',
    'What is sin(pi)',
    'What is lim(x->0) sin(x)/x',
    'What is lim(x->0) cos(x)/x',
    'What is lim(x->0) tan(x)/x',
    'What is lim(x->0) x/sin(x)',
    'What is lim(x->0) x/cos(x)',
    'What is lim(x->0) x/tan(x)',
    'What is lim(x->0) (sin(x)-x)/x^3',
  ];
  List<List<String>> options = [
    ['1', '2', '3', '4'],
    ['1', '2', '3', '4'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
    ['0', '1', '-1', '2'],
  ];

  List<String> answers = [
    '2',
    '4',
    '0',
    '1',
    '0',
    '1',
    '1',
    '1',
    '1',
    '1',
  ];

  int score = 0;
  void _handleAnswer(String answer) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = answer;
      if (_currentQuestionIndex < questions.length - 1) {
        if (_selectedAnswers[_currentQuestionIndex] == answers[_currentQuestionIndex]) score++;
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultScreen(
              score: score,
              userViewModel: widget.userViewModel,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          'Quiz',
          style: TextStyles.title,
        ),
        actions: [
          Text(
            widget.userViewModel.getPoints.toString(),
            style: TextStyles.title,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.stars_rounded,
            color: Colors.yellow,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 16),
            Text(
              questions[_currentQuestionIndex],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Column(
              children: options[_currentQuestionIndex]
                  .map(
                    (option) => RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedAnswers[_currentQuestionIndex],
                      onChanged: (value) => _handleAnswer(value.toString()),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard),
            label: 'LeaderBoard',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events),
            label: 'Achievements',
          ),
        ],
        selectedIndex: 1,
        indicatorColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
