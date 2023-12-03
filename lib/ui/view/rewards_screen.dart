import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/view_models/user_view_model.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
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
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
              Text(
                'You have ${context.watch<UserViewModels>().getPoints} points',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                'Available Rewards',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        if (context.read<UserViewModels>().getPoints < 200) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text('Not enough points!'),
                              content: Text(
                                'You need 200 points to claim this reward!',
                              ),
                            ),
                          );
                          return;
                        }
                        context.read<UserViewModels>().removePoints(200);
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Reward Claimed!'),
                            content: Text(
                              'You have claimed this reward! Your token is 123456789',
                            ),
                          ),
                        );
                      },
                      child: const RewardCard(
                        category: 'Online Course',
                        name: 'Machine Learning Course From ...',
                        price: '200 points',
                        imagePath: 'assets/online-learning.png',
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        if (context.read<UserViewModels>().getPoints < 600) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text('Not enough points!'),
                              content: Text(
                                'You need 300 points to claim this reward!',
                              ),
                            ),
                          );
                          return;
                        }
                        context.read<UserViewModels>().removePoints(600);
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Reward Claimed!'),
                            content: Text(
                              'You have claimed this reward! Your token is 123456789',
                            ),
                          ),
                        );
                      },
                      child: const RewardCard(
                        category: 'Tech Upgrade',
                        name: 'Laptop Accessories Bundle',
                        price: '600 points',
                        imagePath: 'assets/tech.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (context.read<UserViewModels>().getPoints < 500) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text('Not enough points!'),
                              content: Text(
                                'You need 500 points to claim this reward!',
                              ),
                            ),
                          );
                          return;
                        }
                        context.read<UserViewModels>().removePoints(500);
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Reward Claimed!'),
                            content: Text(
                              'You have claimed this reward! Your token is 123456789',
                            ),
                          ),
                        );
                      },
                      child: const RewardCard(
                        category: 'Gaming Gear',
                        name: 'High-Performance Headset',
                        price: '500 points',
                        imagePath: 'assets/headset.png',
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        if (context.read<UserViewModels>().getPoints < 150) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text('Not enough points!'),
                              content: Text(
                                'You need 150 points to claim this reward!',
                              ),
                            ),
                          );
                          return;
                        }
                        context.read<UserViewModels>().removePoints(150);
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Reward Claimed!'),
                            content: Text(
                              'You have claimed this reward! Your token is 123456789',
                            ),
                          ),
                        );
                      },
                      child: const RewardCard(
                        category: 'Food',
                        name: 'Delicious Meal',
                        price: '150 points',
                        imagePath: 'assets/fast-food.png',
                      ),
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
                        const Text(
                          'Featured Reward of the Month',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (context.read<UserViewModels>().getPoints < 1000) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  title: Text('Not enough points!'),
                                  content: Text(
                                    'You need 1000 points to claim this reward!',
                                  ),
                                ),
                              );
                              return;
                            }
                            context.read<UserViewModels>().removePoints(1000);
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('Reward Claimed!'),
                                content: Text(
                                  'You have claimed this reward! Your token is 123456789',
                                ),
                              ),
                            );
                          },
                          child: const RewardCard(
                            category: 'Special Feature',
                            name: 'Exclusive Item',
                            price: '1000 points',
                            imagePath: 'assets/60.png',
                          ),
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

  const RewardCard({
    super.key,
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
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
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
