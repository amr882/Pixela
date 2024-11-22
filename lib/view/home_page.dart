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
  int per_page = 5;

  Future getWallpapers() async {
    try {
      final req = await WallpaperApi.getWallpapers(per_page);
      setState(() {
        wallpapers = req.wallpaper;
        print(wallpapers);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
