import 'package:flutter/material.dart';
import 'package:pixela_app/model/wallpaper_resource_model.dart';
import 'package:pixela_app/services/wallpaper_api.dart';
import 'package:pixela_app/widgets/wallpaper_card.dart';
import 'package:sizer/sizer.dart';

class FindWallpaper extends StatefulWidget {
  const FindWallpaper({super.key});

  @override
  State<FindWallpaper> createState() => _FindWallpaperState();
}

class _FindWallpaperState extends State<FindWallpaper> {
  List foundWallpapers = [];
  int currentPage = 1;
  final TextEditingController _cotroller = TextEditingController();
  Future findWallpaper(String searchWord) async {
    print("++++++++++++++++++++++++++++++++++++try");
    try {
      final req = await WallpaperApi.findWallpaper(currentPage, searchWord);
      setState(() {
        foundWallpapers.addAll(req.wallpaper
            .map((item) => WallpaperResourceModel.fromJson(item))
            .toList());
        currentPage++;
      });
    } catch (e) {
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++$e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent &&
              notification is ScrollUpdateNotification) {
            findWallpaper(_cotroller.text);
          }
          return true;
        },
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: TextField(
                controller: _cotroller,
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Find Wallpaper..",
                  hintStyle: TextStyle(color: Color(0xffb6b6b6)),
                  filled: true,
                  fillColor: Color(0xffEFEEEE),
                  suffixIcon:
                      Icon(Icons.search_rounded, color: Color(0xffb6b6b6)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                onSubmitted: (val) => findWallpaper(_cotroller.text),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: foundWallpapers.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPortrait ? 2 : 4,
                      childAspectRatio: 0.63),
                  itemBuilder: (context, i) {
                    final wallpaper = foundWallpapers[i];
                    return WallpaperCard(
                      wallpaper: wallpaper.originalWallpaper,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
