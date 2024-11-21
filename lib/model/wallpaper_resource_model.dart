class WallpaperResourceModel {
  final int wallpaperId;
  final String originalWallpaper;
  final String alt;
  final String photographerName;
  WallpaperResourceModel(
      {required this.wallpaperId,
      required this.alt,
      required this.originalWallpaper,
      required this.photographerName});
  factory WallpaperResourceModel.fromJson(Map<String, dynamic> json) {
    return WallpaperResourceModel(
        wallpaperId: json["id"],
        alt: json["alt"],
        originalWallpaper: json["src"]["portrait"],
        photographerName: json["photographer"]);
  }
}
