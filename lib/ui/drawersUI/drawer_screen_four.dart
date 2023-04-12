import 'dart:ffi';
import 'dart:ui';

import 'package:api_sample_flutter/utils/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class DrawerScreenFour extends StatefulWidget {
  @override
  DrawerScreenFourState createState() => DrawerScreenFourState();
}

class DrawerScreenFourState extends State<DrawerScreenFour> {

  late PageController pageController;
  late List<String> menuNameList;

  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  int position = 0;

  @override
  void initState() {
    super.initState();
    menuNameList = [];
    pageController = PageController(initialPage: position);

    for (int i=0; i<10; i++) {
      menuNameList.add("Menu Name " + (i + 1).toString());
    }
  }

  void scrollToNextPage(int page) {
    pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.easeInOutSine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.black,
      primary: true,
      extendBody: false,
      appBar: AppBar(
        // true to show back button else false
        automaticallyImplyLeading: true,
        title: const Text("Drawer Screen Four"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.dehaze),
            onPressed: () {
              scaffoldState.currentState?.openEndDrawer();
            },
          ),
        ]
      ),
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          width: 250.0,
          elevation: 5.0,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: [
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ],
                tileMode: TileMode.mirror,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/icons/ic_log_off.png",
                      color: Colors.white,
                      width: 25.0,
                      height: 25.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Expanded(
                      child: Text(
                        "Wednesday Addams",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          "assets/images/wednesday_addams.png",
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "example @example.com",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.deepOrangeAccent,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    itemCount: menuNameList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      bool even = (index % 2) == 0;
                      return FadeAnimation(1 + double.parse("0.${index + 1}"),
                        !even ? ListTile(
                          onTap: () {
                            setState(() {
                              position = index;
                            });
                            scrollToNextPage(position);
                            scaffoldState.currentState?.closeEndDrawer();
                          },
                          title: Padding(
                            padding: const EdgeInsets.only(top: 20.0, right: 50.0),
                            child: Text(
                              menuNameList[index],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                            : ExpansionTile(
                          childrenPadding: const EdgeInsets.only(right: 40.0),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                            child: Text(
                              menuNameList[index],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          children: [
                            ListTile(
                              onTap: () {
                                setState(() {
                                  position = index;
                                });
                                scrollToNextPage(position);
                                scaffoldState.currentState?.closeEndDrawer();
                              },
                              title: Padding(
                                padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                                child: Text(
                                  "Sub ${menuNameList[index]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  position = index;
                                });
                                scrollToNextPage(position);
                                scaffoldState.currentState?.closeEndDrawer();
                              },
                              title: Padding(
                                padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                                child: Text(
                                  "Sub ${menuNameList[index]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  position = index;
                                });
                                scrollToNextPage(position);
                                scaffoldState.currentState?.closeEndDrawer();
                              },
                              title: Padding(
                                padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                                child: Text(
                                  "Sub ${menuNameList[index]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) => Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background_cat.png",
            width: double.infinity,
            height: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            reverse: false,
            itemCount: menuNameList.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Text(
                  menuNameList[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}