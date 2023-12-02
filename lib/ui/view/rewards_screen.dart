import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Rewards'),
            Text('You have 999 points'),
            Text('You can redeem your points for the following rewards'),
            Text('Food'),
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Card(
                      child: Column(
                        children: [
                          Image.asset('assets/logo.png',height: 70,width: 70,),
                          Text('Reward Name'),
                          Text('Reward Price'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Text('Clothes'),
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Card(
                      child: Column(
                        children: [
                          Image.asset('assets/logo.png',height: 70,width: 70,),
                          Text('Reward Name'),
                          Text('Reward Price'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}