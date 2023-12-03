import 'package:education_app/core/enums/user_enums.dart';
import 'package:education_app/ui/view/quiz_landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/users.dart';
import '../../core/view_models/user_view_model.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen>{
  late UserViewModels userViewModel;
  late List<User> users;
  late List<User> sortedUsers;
  loadUsers() async {
    userViewModel = context.watch<UserViewModels>();
    users = [
      User(
        name: 'Adem',
        points: 920,
      ),
      User(
        name: 'Mike',
        points: 855,
      ),
      User(
        name: 'John',
        points: 700,
      ),
      User(
        name: 'Sara',
        points: 872,
      ),
      User(
        name: 'Abdslem',
        points: 841,
      ),
      User(
        name: 'Kamel',
        points: 436,
      ),
      User(
        name: 'Simo',
        points: 781,
      ),
      User(
        name: 'Samir',
        points: 699,
      ),
      User(
        name: 'Jamel',
        points: 752,
      ),
      User(
        name: 'You',
        points: userViewModel.getPoints,
      ),
    ];
    users.sort((a, b) => a.points.compareTo(b.points) * -1);
  }
  @override
  void initState() {
    super.initState();

  }

  List<String> divisionNames = ['Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond', 'Master'];
  List<Color> divisionColors = [Colors.brown, Colors.grey, Colors.yellow, Colors.blue, Colors.teal, Colors.orange];

  @override
  Widget build(BuildContext context) {
    loadUsers();
    return Scaffold(
      body: Column(
        children: [
          const Text('Division', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Adjust the spacing here
                  child: DivisionCard(
                    divisionName: Division.values[index].toString(),
                    color: divisionColors[index],
                  ),
                );
              },
            ),
          ),
          const Text('Leader Board'),
          const Text('Top 10'),
          Stack(
            children: [
              SizedBox(
                height: 450,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 2) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: Card(
                              color: users[index].name == 'You' ? Colors.blueGrey : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(users[index].name),
                                    Text(users[index].points.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Promotion zone',
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_circle_up,
                                color: Colors.green,
                              ),
                            ],
                          )
                        ],
                      );
                    }
                    if (index == 6) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: Card(
                              color: users[index].name == 'You' ? Colors.blueGrey : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(users[index].name),
                                    Text(users[index].points.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Demotion zone',
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_circle_down,
                                color: Colors.red,
                              ),
                            ],
                          )
                        ],
                      );
                    }
                    return Column(
                      children: [
                        SizedBox(
                          width: 350,
                          child: Card(
                            color: users[index].name == 'You' ? Colors.blueGrey : null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(users[index].name),
                                  Text(users[index].points.toString()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return QuizLandingScreen(
                          userViewModel: userViewModel,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 370.0, left: 300),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orangeAccent,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_circle_up,
                          color: Colors.white,
                        ),
                        Text(
                          'Rank Up',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DivisionCard extends StatelessWidget {
  final String divisionName;
  final Color color;

  const DivisionCard({super.key, required this.divisionName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 55,
          padding: const EdgeInsets.all(8),
          decoration: divisionName == context.read<UserViewModels>().division.toString()
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                )
              : null,
          child: ClipPath(
            clipper: HexagonClipper(),
            child: Container(
              color: color,
              child: const Center(
                child: Text(
                  '&',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(divisionName.substring(9)),
      ],
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, 3 * size.height / 4);
    path.lineTo(0, size.height / 4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
