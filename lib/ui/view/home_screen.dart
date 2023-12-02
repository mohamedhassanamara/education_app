import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final courses = [
    {
      'name': 'Math',
      'time': '8:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A22',
    },
    {
      'name': 'physics',
      'time': '10:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A23',
    },
    {
      'name': 'chemistry',
      'time': '12:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A24',
    },
    {
      'name': 'biology',
      'time': '2:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A25',
    },
    {
      'name': 'english',
      'time': '4:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A26',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Upcoming Courses', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 120,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              courses[index]['name']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              courses[index]['time']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              courses[index]['professor']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              courses[index]['class']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Text('Quick insights', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('this week presence',
                      style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                  RichText(
                    text: const TextSpan(
                      text: '4',
                      style: TextStyle(fontSize: 24, decoration: TextDecoration.underline, color: Colors.green),
                      children: [
                        TextSpan(
                          text: '/5',
                          style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Pressence Rate', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                  RichText(
                    text: const TextSpan(
                      text: '79',
                      style: TextStyle(fontSize: 24, decoration: TextDecoration.underline, color: Colors.green),
                      children: [
                        TextSpan(
                          text: '%',
                          style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Late rate', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                  RichText(
                    text: const TextSpan(
                      text: '55',
                      style: TextStyle(fontSize: 24, decoration: TextDecoration.underline, color: Colors.red),
                      children: [
                        TextSpan(
                          text: '%',
                          style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('Points you can earn', style: TextStyle(fontSize: 20)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('attend class at 8:00 am'),
                  Text('+50', style: TextStyle(color: Colors.blueGrey)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('attend class at 12:00 pm'),
                  Text(
                    '+50',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('attend class at 10:00 am'),
                  Text(
                    '+20',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('do quiz'),
                  Text(
                    '+10',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
