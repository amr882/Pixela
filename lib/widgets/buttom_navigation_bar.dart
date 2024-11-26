import 'package:flutter/material.dart';
import 'package:pixela_app/view/category_page.dart';
import 'package:pixela_app/view/favorite_page.dart';
import 'package:pixela_app/view/home_page.dart';
import 'package:pixela_app/view/settings_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var _currentIndex = 0;
  List pages = [
    const HomePage(),
    const CategoryPage(),
    const FavoritePage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SalomonBottomBar(
              backgroundColor: const Color(0xfff9f9f9),
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.home,
                    color: Color(0xff292d32),
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Color(0xff292d32)),
                  ),
                  selectedColor: const Color(0xfff0f0f0),
                ),

                /// category
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.category_rounded,
                    color: Color(0xff292d32),
                  ),
                  title: const Text(
                    "Category",
                    style: TextStyle(color: Color(0xff292d32)),
                  ),
                  selectedColor: const Color(0xfff0f0f0),
                ),

                /// favorite
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: Color(0xff292d32),
                  ),
                  title: const Text(
                    "Favorite",
                    style: TextStyle(color: Color(0xff292d32)),
                  ),
                  selectedColor: const Color(0xfff0f0f0),
                ),

                /// settings
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.settings_rounded,
                    color: Color(0xff292d32),
                  ),
                  title: const Text(
                    "Settings",
                    style: TextStyle(color: Color(0xff292d32)),
                  ),
                  selectedColor: const Color(0xfff0f0f0),
                ),
              ],
            ),
          ),
        ),
        body: pages[_currentIndex],
      ),
    );
  }
}
