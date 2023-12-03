import 'package:education_app/core/view_models/user_view_model.dart';
import 'package:education_app/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/text_styles.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final UserViewModels userViewModel;
  const QuizResultScreen({Key? key, required this.score, required this.userViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          'Quiz Result',
          style: TextStyles.title,
        ),
        actions: [
          Text(
            userViewModel.getPoints.toString(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You scored $score points'),
            GestureDetector(
              onTap: () {
                userViewModel.addPoints(score);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                ),
                child: const Center(
                  child: Text(
                    'Go back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
