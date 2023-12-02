import 'package:education_app/ui/shared/app_colors.dart';
import 'package:education_app/ui/view/quiz_screen.dart';
import 'package:flutter/material.dart';

import '../shared/text_styles.dart';

class QuizLandingScreen extends StatelessWidget {
  const QuizLandingScreen({Key? key}) : super(key: key);

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
            '999',
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
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time to test your knowledge and earn points',
              ),
              Text('Earn Up to 10 points'),
              Text('Race against time and earn 1 point for every correct answer'),
              Text('You have 2 minutes to answer 10 questions'),
              Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryColor,
                ),
                child: Center(
                  child: Text(
                    'This quiz is about Mathematics',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Start Quiz',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
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
