import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class DownloadButton extends StatelessWidget {
  final void Function() onTap;
  const DownloadButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 14.h,
        height: 14.h,
        decoration: BoxDecoration(
            color: const Color.fromARGB(85, 249, 249, 249),
            borderRadius: BorderRadius.circular(300)),
        child: Center(
          child: Container(
            width: 12.h,
            height: 12.h,
            decoration: BoxDecoration(
                color: const Color.fromARGB(172, 249, 249, 249),
                borderRadius: BorderRadius.circular(300)),
            child: Center(
              child: Container(
                width: 9.5.h,
                height: 9.5.h,
                decoration: BoxDecoration(
                    color: const Color(0xfff9f9f9),
                    borderRadius: BorderRadius.circular(300)),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/download.svg",
                    height: 4.5.h,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
