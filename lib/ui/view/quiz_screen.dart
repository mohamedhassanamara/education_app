import 'package:education_app/ui/view/quiz_result_screen.dart';
import 'package:flutter/material.dart';
import '../../core/models/Quizz.dart';
import '../../core/view_models/user_view_model.dart';
import '../shared/text_styles.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class QuizScreen extends StatefulWidget {
  final UserViewModels userViewModel;
  const QuizScreen({super.key, required this.userViewModel});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  int _currentQuestionIndex = 0;

  late List<String>
  _selectedAnswers = List<String>.filled(10, '');
  late Future<Quizz?> _quizzFuture;
  Future<Quizz?> loadData() async {
    var url =
    Uri.https('quiz-generator-kkct.onrender.com','/generate_quizzes');
    print(url);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      return Quizz.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  @override
  initState() {
    super.initState();
    _quizzFuture = loadData();
    // if(_quizzFuture==null)
    //   return;
    // print(quizz.toJson());
    // for (var quizzUnit in _quizzFuture.quesAnsPairs!) {
    //   questions.add(quizzUnit.question!);
    //   options.add(quizzUnit.answers!);
    //   answers.add(quizzUnit.correctChoices![0]);
    //   _selectedAnswers = List<String>.filled(questions.length, '');
    // }
  }


  List<String> questions = [];
  List<List<String>> options = [
    ];

  List<String> answers = [];
  bool dataLoaded = false;
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
      ),body: FutureBuilder<Quizz?>(
      future: _quizzFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Text('No data available');
        } else {
          // Data is available, update your UI here
          Quizz quizz = snapshot.data!;
          print(quizz.toJson());
          if(dataLoaded==false) {
              for (var quizzUnit in quizz.quesAnsPairs!) {
                questions.add(quizzUnit.question!);
                options.add(quizzUnit.answers!);
                answers.add(quizzUnit.correctChoices![0]);
              }
            }

          dataLoaded = true;
            print(questions.length);
          print(_currentQuestionIndex);

          return Padding(
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
          );
        }
      },
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
