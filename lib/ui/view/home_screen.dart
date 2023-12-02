import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Upcoming Courses'),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  child: Card(
                    child: Column(
                      children: [
                        Text('Course Name'),
                        Text('Course Description'),
                        Text('Course Price'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text('Quick insights'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('this week presence'),
              Text('3/5'),
            ],
          ),
          Text('Points you can earn'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('attend class at 8:00 am'),
              Text('+50'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('attend class at 12:00 pm'),
              Text('+50'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('attend class at 10:00 am'),
              Text('+20'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('do quiz'),
              Text('+10'),
            ],
          ),
        ],
      ),
    );
  }
}
