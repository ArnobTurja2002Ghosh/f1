import 'package:flutter/material.dart';
import 'package:hotel_and_travel_booking_app/constant/app_colors.dart';
import 'package:hotel_and_travel_booking_app/searched_screen.dart';
import 'package:hotel_and_travel_booking_app/widgets/search_options_text_field.dart';

import 'constant/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Color(
        AppColors.backgroundColor,
      ),
      appBar: AppBar(
        backgroundColor: Color(
          AppColors.backgroundColor,
        ),
        leadingWidth: 100,
        leading: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/profile.png"),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Hello,  Alpay",
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/notification.png"),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SearchOptionsTextField(
                  leadingImage: "assets/images/shape.png",
                  title: "location",
                  actionImage: "assets/images/notification.png",
                ),
                SearchOptionsTextField(
                  leadingImage: "assets/images/shape.png",
                  title: "location",
                  actionImage: "assets/images/notification.png",
                ),
                SearchOptionsTextField(
                  leadingImage: "assets/images/shape.png",
                  title: "location",
                  actionImage: "assets/images/notification.png",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchedScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(AppColors.tealColor),
                    ),
                    child: Center(
                        child: Text(
                      "Search",
                      style: AppTextStyle.textStyle14WhiteW400,
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(AppColors.greyColor),
            ),
          )),
        ],
      ),
    );
  }
}
