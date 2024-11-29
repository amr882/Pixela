import 'package:flutter/material.dart';
import 'package:pixela_app/model/wallpaper_resource_model.dart';
import 'package:pixela_app/widgets/download_button.dart';
import 'package:pixela_app/widgets/wallpaper_pereview.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class WallpaperDetails extends StatefulWidget {
  final WallpaperResourceModel wallpaperResourceModel;
  const WallpaperDetails({super.key, required this.wallpaperResourceModel});

  @override
  State<WallpaperDetails> createState() => _WallpaperDetailsState();
}

class _WallpaperDetailsState extends State<WallpaperDetails> {
  shareWallpaper() async {
    await Share.share(widget.wallpaperResourceModel.originalWallpaper);
  }

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

          // wallpaper preview
          WallpaperPereview(
            wallpaper: widget.wallpaperResourceModel.originalWallpaper,
          ),

          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // share
                    GestureDetector(
                      onTap: shareWallpaper,
                      child: Container(
                        width: 6.h,
                        height: 6.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(120, 0, 0, 0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.share_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // download button

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: DownloadButton(
                        onTap: () {
                          // download wallpaper
                        },
                      ),
                    ),
                    // add to fav
                    Container(
                      width: 6.h,
                      height: 6.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(120, 0, 0, 0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
