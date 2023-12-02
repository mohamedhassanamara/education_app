// import 'package:flutter/material.dart';
//
// class RewardsScreen extends StatelessWidget {
//   const RewardsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//       body: Center(
//         child: Column(
//           children: [
//             Text('Rewards'),
//             Text('You have 999 points'),
//             Text('You can redeem your points for the following rewards'),
//             Text('Food'),
//             Container(
//               height: 150,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 150,
//                     child: Card(
//                       child: Column(
//                         children: [
//                           Image.asset('assets/logo.png',height: 70,width: 70,),
//                           Text('Reward Name'),
//                           Text('Reward Price'),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Text('Clothes'),
//             Container(
//               height: 150,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 150,
//                     child: Card(
//                       child: Column(
//                         children: [
//                           Image.asset('assets/logo.png',height: 70,width: 70,),
//                           Text('Reward Name'),
//                           Text('Reward Price'),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                child: Column(
                  children: [
                    // Display a promotional banner or announcements
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Use your desired color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        '🎉 Special Offer: Earn double points today! 🎉',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Your Points',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'You have 999 points',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                'Available Rewards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RewardCard(
                      category: 'Food',
                      name: 'Delicious Meal',
                      price: '150 points',
                      imagePath: 'assets/fast-food.png',
                    ),
                    RewardCard(
                      category: 'Clothes',
                      name: 'Stylish Shirt',
                      price: '200 points',
                      imagePath: 'assets/veste.png',
                    ), RewardCard(
                      category: 'Tech Upgrade',
                      name: 'Laptop Accessories Bundle',
                      price: '600 points',
                      imagePath: 'assets/tech.png',
                    ),
                    RewardCard(
                      category: 'Gaming Gear',
                      name: 'High-Performance Headset',
                      price: '500 points',
                      imagePath: 'assets/headset.png',
                    ),
                    // Add more categories as needed
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Featured Reward of the Month', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        RewardCard(
                          category: 'Special Feature',
                          name: 'Exclusive Item',
                          price: '1000 points',
                          imagePath: 'assets/60.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class RewardCard extends StatelessWidget {
  final String category;
  final String name;
  final String price;
  final String imagePath;

  RewardCard({
    required this.category,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: const TextStyle(color: Colors.blue)),
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(price, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}