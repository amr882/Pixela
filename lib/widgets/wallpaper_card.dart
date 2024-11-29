import 'package:flutter/material.dart';

class WallpaperCard extends StatelessWidget {
  final String wallpaper;
  final void Function() onTap;
  const WallpaperCard(
      {super.key, required this.wallpaper, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: GestureDetector(
          onTap: onTap,
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
