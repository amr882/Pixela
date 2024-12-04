import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Container(
              width: 12.w,
              height: 0.8.h,
              decoration: BoxDecoration(
                  color: const Color(0xffb3b3b3),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Text(
            "What would you like to do?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.h),
          ),
          Container(
            height: 25.h,
            width: 90.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffb3b3b3),
                )),
            child: Column(
              children: [
                //home screen
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  child: GestureDetector(
                    //home screen
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/home screen.svg",
                          height: 4.5.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text("set on home screen")
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Color(0xffb3b3b3),
                ),

                //LOCK_SCREEN
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  child: GestureDetector(
                    //LOCK_SCREEN
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/lock screen.svg",
                          height: 4.5.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text("set on lock screen")
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Color(0xffb3b3b3),
                ),
                // both
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  child: GestureDetector(
                    // both
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/both.svg",
                          height: 4.5.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text("Set on both screen")
                      ],
                    ),
                  ),
                ),

                // cancel button
              ],
            ),
          )
        ],
      )),
    );
  }
}
