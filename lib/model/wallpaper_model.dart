class WallpaperModel {
  final int per_page;
  final int page;
  List<dynamic> wallpaper;

  WallpaperModel(
      {required this.page, required this.per_page, required this.wallpaper});

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
        page: json["page"],
        per_page: json["per_page"],
        wallpaper: json["photos"] as List<dynamic>);
  }
}
