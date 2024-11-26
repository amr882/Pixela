import 'package:flutter/material.dart';
import 'package:pixela_app/widgets/buttom_navigation_bar.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CustomBottomNavigationBar(),
        );
      },
    );
  }
}
