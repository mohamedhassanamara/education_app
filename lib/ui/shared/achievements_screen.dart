import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  AchievementsScreen({Key? key}) : super(key: key);

  final List<String> achievementsDescrption = [
    'Perfect week streak with no absences',
    'Earned plus than 10000 points',
    'Spend plus than 1000 points',
    'Never late to class',
    '50 Perfect Quiz',
    'Never Skipped a class',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 50),
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                height: 80,
                width: 80,
                child: Image.asset('assets/${index + 1}.png'),
              ),
              Text(
                achievementsDescrption[index],
                textAlign: TextAlign.center,
              )
            ],
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}
