import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WallpaperCard extends StatelessWidget {
  final String wallpaper;
  const WallpaperCard({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
          child: SizedBox(

              // 20.h,
              height:40.h,
              // 33.h,
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    wallpaper,
                    fit: BoxFit.cover,
                  ),
                )
              ]))),
    );
  }
}
