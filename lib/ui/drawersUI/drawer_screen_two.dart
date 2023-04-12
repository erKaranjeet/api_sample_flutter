import 'dart:ffi';
import 'dart:ui';

import 'package:api_sample_flutter/utils/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class DrawerScreenTwo extends StatefulWidget {
  @override
  DrawerScreenTwoState createState() => DrawerScreenTwoState();
}

class DrawerScreenTwoState extends State<DrawerScreenTwo> {

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
        title: const Text("Drawer Screen Two"),
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
            margin: const EdgeInsets.fromLTRB(0, 85, 0, 0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              itemCount: menuNameList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(1 + double.parse("0.${index + 1}"),
                  ListTile(
                    onTap: () {
                      setState(() {
                        position = index;
                      });
                      scrollToNextPage(position);
                      scaffoldState.currentState?.closeEndDrawer();
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        menuNameList[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) => Container(),
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