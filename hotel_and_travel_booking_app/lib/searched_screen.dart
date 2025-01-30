import 'package:flutter/material.dart';
import 'package:hotel_and_travel_booking_app/constant/app_colors.dart';

import 'constant/app_text.dart';

class SearchedScreen extends StatefulWidget {
  SearchedScreen({super.key});

  @override
  State<SearchedScreen> createState() => _SearchedScreenState();
}

class _SearchedScreenState extends State<SearchedScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  bool isSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabController.addListener(() {
      setState(() {});
      print("new state");
    });
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bali_background_image.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.share, color: Colors.white, size: 30),
                              Icon(Icons.favorite_outline,
                                  color: Colors.white, size: 30),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "BALI",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Text("Indonesia",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFFFFFFFF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4.9",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Icon(Icons.star, color: Colors.yellow)
                          ],
                        )),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFF2F5FA)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TabBar(
                        controller: tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          color: Color(AppColors.indicatorColor),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        // onTap: (int1) {
                        //   setState(() {
                        //     selectedTab = int1;
                        //   });
                        //   print(selectedTab);
                        // },
                        tabs: <Widget>[
                          Tab(
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tabController.index == 0
                                      ? null
                                      : Colors.white),
                              child: Center(child: Text("Hotels")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tabController.index == 1
                                      ? null
                                      : Colors.white),
                              child: Center(child: Text("Foods")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tabController.index == 2
                                      ? null
                                      : Colors.white),
                              child: Center(child: Text("Activities")),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 250,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image1.png"),
                                                  opacity: 1,
                                                  fit: BoxFit.fitWidth),
                                            )),
                                        Container(
                                          height: 250,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/Rectangle 796.png"),
                                                opacity: 1,
                                                fit: BoxFit.fitWidth),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "10+",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Text("DETAILS",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                      AppText.text1,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    ContinueButton()
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 250,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image2.png"),
                                                  opacity: 1,
                                                  fit: BoxFit.fitWidth),
                                            )),
                                        Container(
                                          height: 250,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/unsplash_YsI.png"),
                                                opacity: 1,
                                                fit: BoxFit.fitWidth),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "10+",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Text("DETAILS",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                      AppText.text2,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    ContinueButton(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 250,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image3.png"),
                                                  opacity: 1,
                                                  fit: BoxFit.fitWidth),
                                            )),
                                        Container(
                                          height: 250,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/unsplash_4Ec.png"),
                                                opacity: 1,
                                                fit: BoxFit.fitWidth),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "10+",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Text("DETAILS",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                      AppText.text3,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    ContinueButton()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF18C0C1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white)
                ],
              )),
        ));
  }
}
