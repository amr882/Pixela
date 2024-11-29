import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class WallpaperPereview extends StatelessWidget {
  final String wallpaper;
  const WallpaperPereview({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Image.network(
              wallpaper,
              width: 85.w,
              height: 85.h,
              fit: BoxFit.cover,
            ),
            Positioned(
                right: 16.w,
                top: 6.h,
                child: SvgPicture.asset("assets/clock.svg"))
          ],
        ),
      ),
    );
  }
}
