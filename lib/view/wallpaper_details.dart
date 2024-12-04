import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:pixela_app/model/wallpaper_resource_model.dart';
import 'package:pixela_app/services/wallpaper_api.dart';
import 'package:pixela_app/widgets/bottom_sheet.dart';
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

  Future setWallpaperLOCK_SCREEN() async {
    await WallpaperApi.setWallpaper(
        widget.wallpaperResourceModel.originalWallpaper,
        WallpaperManager.LOCK_SCREEN);
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
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: WallpaperPereview(
              wallpaper: widget.wallpaperResourceModel.originalWallpaper,
            ),
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

                    // set Wallpaper

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: SetWallpaperButton(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const CustomBottomSheet();
                              });
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
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.5.h, horizontal: 5.w),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_rounded)),
          )
        ],
      ),
    );
  }
}
