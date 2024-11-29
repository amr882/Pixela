import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixela_app/model/wallpaper_resource_model.dart';
import 'package:sizer/sizer.dart';

class WallpaperDetails extends StatefulWidget {
  final WallpaperResourceModel wallpaperResourceModel;
  const WallpaperDetails({super.key, required this.wallpaperResourceModel});

  @override
  State<WallpaperDetails> createState() => _WallpaperDetailsState();
}

class _WallpaperDetailsState extends State<WallpaperDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.wallpaperResourceModel.originalWallpaper,
            fit: BoxFit.cover,
            height: 100.h,
          ),
          Container(
            height: 100.h,
            width: 100.w,
            color: const Color.fromARGB(228, 255, 255, 255),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Image.network(
                    widget.wallpaperResourceModel.originalWallpaper,
                    width: 70.w,
                    height: 70.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      right: 10.w,
                      top: 6.h,
                      child: SvgPicture.asset("assets/clock.svg"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
