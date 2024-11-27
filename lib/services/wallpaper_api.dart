import 'dart:convert';

import 'package:pixela_app/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class WallpaperApi {
  static String api_key =
      "2eW4ze4csVtNnVXkgkRVB7Bm1v4qtk7wztOINAZ6CAfOtfVxKz5j6iAh";

// to get all wallpapers from api
  static Future<WallpaperModel> getWallpapers(int currentPage) async {
    final respone = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?page=$currentPage&per_page=10"),
        headers: {"Authorization": api_key});
    if (respone.statusCode == 200) {
      return WallpaperModel.fromJson(jsonDecode(respone.body));
    } else {
      throw Exception("error getting wallpaper data");
    }
  }

//  search for wallpaper
  static Future<WallpaperModel> findWallpaper(
      int currentPage, String searchWord) async {
    final respone = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchWord&page=$currentPage&per_page=10"),
        headers: {"Authorization": api_key});

    if (respone.statusCode == 200) {
      return WallpaperModel.fromJson(jsonDecode(respone.body));
    } else {
      throw Exception("error getting wallpaper data");
    }
  }
}
