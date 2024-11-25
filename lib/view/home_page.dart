import 'package:flutter/material.dart';
import 'package:pixela_app/model/wallpaper_resource_model.dart';
import 'package:pixela_app/services/wallpaper_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WallpaperResourceModel> wallpapers = [];
  int perPage = 20;
  int currentPage = 1;
  bool isLoading = false;

  Future<void> fetchWallpapers() async {
    if (isLoading) return;
    isLoading = true;

    try {
      final req = await WallpaperApi.getWallpapers(perPage, currentPage);
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
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent &&
              notification is ScrollUpdateNotification &&
              !isLoading) {
            fetchWallpapers();
          }
          return true;
        },
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: wallpapers.length,
          itemBuilder: (context, index) {
            return Text(wallpapers[index].wallpaperId.toString());
          },
        ),
      ),
    );
  }
}
