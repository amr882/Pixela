class WallpaperModel {
  final int wallpaperId;
  final String originalWallpaper;
  final String alt;
  final String photographerName;
  WallpaperModel(
      {required this.wallpaperId,
      required this.alt,
      required this.originalWallpaper,
      required this.photographerName});
  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
        wallpaperId: json["id"],
        alt: json["alt"],
        originalWallpaper: json["src"]["original"],
        photographerName: json["photographer"]);
  }
}
