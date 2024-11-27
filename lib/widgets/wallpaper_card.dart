import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WallpaperCard extends StatelessWidget {
  final String wallpaper;
  const WallpaperCard({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: GestureDetector(
          child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
          wallpaper,
          fit: BoxFit.cover,
                  ),
                )),
    );
  }
}
