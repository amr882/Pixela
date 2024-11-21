import 'dart:convert';
import 'package:http/http.dart' as http;

class WallpaperApi {
  static String url = "https://api.pexels.com/v1/curated?page=3&per_page=40";
  static String api_key = "086c91c57e654d5f9b421025241402";

  static Future getWallpaper() async {
    final respon = await http.get(
        Uri.parse(
          url,
        ),
        headers: {"Authorization": api_key});

    if (respon.statusCode == 200) {
      jsonDecode(respon.body);
    }
  }
}
