import 'package:flutter/material.dart';
import 'package:pixela_app/model/wallpaper_resource_model.dart';
import 'package:pixela_app/services/wallpaper_api.dart';
import 'package:pixela_app/widgets/wallpaper_card.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WallpaperResourceModel> wallpapers = [];
  int currentPage = 1;
  bool isLoading = false;

  Future<void> fetchWallpapers() async {
    if (isLoading) return;
    isLoading = true;

    try {
      final req = await WallpaperApi.getWallpapers(currentPage);
      setState(() {
        wallpapers.addAll(req.wallpaper
            .map((item) => WallpaperResourceModel.fromJson(item))
            .toList());
        currentPage++;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  @override
  void initState() {
    fetchWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification &&
                        !isLoading) {
                      fetchWallpapers();
                    }
                    return true;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: GridView.builder(
                        itemCount: wallpapers.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isPortrait ? 2 : 4,
                            childAspectRatio: 0.66),
                        itemBuilder: (context, i) {
                          final wallpaper = wallpapers[i];
                          return WallpaperCard(
                            wallpaper: wallpaper.originalWallpaper,
                          );
                        }),
                  ),
                )),
    );
  }
}
