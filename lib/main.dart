import 'package:education_app/core/viewmodel/user_view_model.dart';
import 'package:education_app/ui/shared/app_colors.dart';
import 'package:education_app/ui/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserViewModels()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondaryColor,
          primary: AppColors.primaryColor,
          background: AppColors.backgroundColor,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

