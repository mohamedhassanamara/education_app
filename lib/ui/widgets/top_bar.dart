import 'package:education_app/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '999',
              style: TextStyles.title,
            ),
            const Icon(
              Icons.stars_rounded,
              color: Colors.yellow,
            )
          ],
        ),
      ],
    );
  }
}
