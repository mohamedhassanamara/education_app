import 'package:education_app/ui/view/rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/view_models/user_view_model.dart';
import '../shared/achievements_screen.dart';
import '../shared/text_styles.dart';
import 'home_screen.dart';
import 'leader_board_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const LeaderBoardScreen(),
    const RewardsScreen(),
    AchievementsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://avatars.githubusercontent.com/u/139426?s=400&u=8e2f0d9e4d3b6b3b5b6b3b5b6b3b5b6b3b5b6b3b&v=4',
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello',
              style: TextStyles.subtitle,
            ),
            Text(
              'Abdslem yajour',
              style: TextStyles.subtitle,
            ),
          ],
        ),
        actions: [
          Text(
            context.watch<UserViewModels>().getPoints.toString(),
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
      body: screens[selectedIndex],
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
        selectedIndex: selectedIndex,
        indicatorColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onDestinationSelected: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
    );
  }
}
