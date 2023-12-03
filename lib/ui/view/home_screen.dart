import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final courses = [
    {
      'name': 'Math',
      'time': '8:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A22',
      'image': 'assets/math.png',

    },
    {
      'name': 'Physics',
      'time': '10:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A23',
      "image": "assets/physics.png"
    },
    {
      'name': 'Chemistry',
      'time': '12:00 am',
      'professor': 'Prof. John Doe',
      'class': 'A24',
      "image": "assets/chemistry.png"
    },
    {
      'name': 'Biology',
      'time': '2:00 pm',
      'professor': 'Prof. John Doe',
      'class': 'A25',
      'image': 'assets/biology.png',
    },
    {
      'name': 'English',
      'time': '4:00 pm',
      'professor': 'Prof. John Doe',
      'class': 'A26',
      'image': 'assets/english.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              StyledTitle(title: 'Upcoming Courses'),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 150,
                      child:
                      Card(
                        color: Colors.blue,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
          
                            // Image overlay on top right
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 50, // Adjust the width of the image
                                height: 50, // Adjust the height of the image
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 0.7,
                                    image: AssetImage(courses[index]["image"]!), // Replace with the actual image path
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            // Card content
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    courses[index]['name']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Time: ${courses[index]['time']!}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Professor: ${courses[index]['professor']!}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Class: ${courses[index]['class']!}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              StyledTitle(title: 'Quick insights'),
              const SizedBox(height: 20),
              StyledTextRow('This week presence', '4/5', Colors.green),
              StyledTextRow('Presence Rate', '79%', Colors.green),
              StyledTextRow('Late rate', '55%', Colors.red),
              const SizedBox(height: 10),
              StyledTitle(title: 'Points you can earn'),
              StyledRow('Attend class at 8:00 am', '+50', Colors.blueGrey),
              StyledRow('Attend class at 12:00 pm', '+50', Colors.blueGrey),
              StyledRow('Attend class at 10:00 am', '+20', Colors.blueGrey),
              StyledRow('Do quiz', '+10', Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper function to create styled rows
Widget StyledRow(String title, String value, Color valueColor) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.only(top: 16, bottom: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: valueColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}


// Helper function to create styled text rows
Widget StyledTextRow(String title, String value, Color valueColor) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
        ),
        RichText(
          text: TextSpan(
            text: value,
            style: TextStyle(fontSize: 24, decoration: TextDecoration.underline, color: valueColor),
            children: [
              TextSpan(
                text: '',
                style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: valueColor),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



class StyledTitle extends StatelessWidget {
  final String title;

  StyledTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}