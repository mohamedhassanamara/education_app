import 'package:education_app/ui/view/quiz_landing_screen.dart';
import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatefulWidget {
   LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  List<String> divisionNames = ['Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond', 'Master'];
  List<Color> divisionColors = [Colors.brown, Colors.grey, Colors.yellow, Colors.blue, Colors.teal, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text('Division'),
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0), // Adjust the spacing here
                  child: DivisionCard(
                    divisionName: divisionNames[index],
                    color: divisionColors[index],
                  ),
                );
              },
            )
          ),
          Text('Leader Board'),
          Text('Top 10'),
          Stack(
            children: [

              Container(
                height: 450,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 3)
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Promotion zone',style: TextStyle(color: Colors.green),textAlign: TextAlign.center,),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_circle_up,color: Colors.green,),
                        ],
                      );
                    if (index == 9)
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Demotion zone',style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_circle_down,color: Colors.red,),
                        ],
                      );
                    return Container(
                      width: 200,
                      child: Card(
                        child: Column(
                          children: [
                            Text('Student Name'),
                            Text('Student Points'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuizLandingScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 370.0,left: 300),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orangeAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_circle_up,color: Colors.white,),
                        Text('Rank Up',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                      ],
                    ),
                    )
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

  const DivisionCard({required this.divisionName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 55,
          padding: EdgeInsets.all(8),
          decoration: divisionName == 'Gold'? BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ):null,
          child: ClipPath(
            clipper: HexagonClipper(),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  '&',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(divisionName),
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
