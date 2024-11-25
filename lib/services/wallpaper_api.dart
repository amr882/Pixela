import 'dart:convert';

import 'package:pixela_app/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class WallpaperApi {
  static String api_key =
      "2eW4ze4csVtNnVXkgkRVB7Bm1v4qtk7wztOINAZ6CAfOtfVxKz5j6iAh";

  static Future<WallpaperModel> getWallpapers(
      int perPage, int currentPage) async {
    final respone = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?page=$currentPage&per_page=$perPage"),
        headers: {"Authorization": api_key});
    if (respone.statusCode == 200) {
      return WallpaperModel.fromJson(jsonDecode(respone.body));
    } else {
      throw Exception("error getting wallpaper data");
    }
  }
}
