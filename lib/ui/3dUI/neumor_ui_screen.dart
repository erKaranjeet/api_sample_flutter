import 'package:api_sample_flutter/utils/tapper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NeumorUiScreen extends StatefulWidget {

  @override
  NeumorUiScreenState createState() => NeumorUiScreenState();
}

class NeumorUiScreenState extends State<NeumorUiScreen> {

  Color colorOne = const Color(0xFF190c37);
  Color colorTwo = const Color(0xFFf6f7fb);
  Color colorThree = const Color(0xFFff9008);
  Color selectedBackColor = const Color(0xFF190c37);
  Color selectedGrad1Color = const Color(0xFF1f0f40);
  Color selectedGrad2Color = const Color(0xFF190936);
  Color selectedTitleTextColor = const Color(0xffbcacdb);
  Color selectedTextColor = const Color(0xff8172a4);
  Color shadowColor1 = const Color(0xFF30234e);
  Color shadowColor2 = const Color(0xFF12062e);
  Color selectedDotColor1 = const Color(0xFFfc8700);
  Color selectedDotColor2 = const Color(0xffb96501);
  Color unselectedDotColor = const Color(0xFF12032c);

  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedBackColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  selectedGrad1Color,
                  selectedGrad2Color,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Positioned(
            top: 45.0,
            right: 24.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBackColor = const Color(0xFF190c37);
                      selectedGrad1Color = const Color(0xFF1f0f40);
                      selectedGrad2Color = const Color(0xFF190936);
                      selectedTextColor = const Color(0xFFFFFFFF);
                      shadowColor1 = const Color(0xFF30234e);
                      shadowColor2 = const Color(0xFF12062e);
                      selectedTitleTextColor = const Color(0xffbcacdb);
                      selectedDotColor1 = const Color(0xFFfc8700);
                      selectedDotColor2 = const Color(0xffb96501);
                      unselectedDotColor = const Color(0xFF12032c);
                    });
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: colorOne,
                      borderRadius: BorderRadius.circular(15.0),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBackColor = const Color(0xffe8e8e8);
                      selectedGrad1Color = const Color(0xFFf6f7fb);
                      selectedGrad2Color = const Color(0xFFeeeff3);
                      selectedTextColor = const Color(0xFFf4c58c);
                      shadowColor1 = const Color(0xfffdfdfd);
                      shadowColor2 = const Color(0xffe2e4ea);
                      selectedTitleTextColor = const Color(0xff23262d);
                      selectedDotColor1 = const Color(0xFFffb415);
                      selectedDotColor2 = const Color(0xffb68111);
                      unselectedDotColor = const Color(0xFFe2e3e7);
                    });
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: colorTwo,
                      borderRadius: BorderRadius.circular(15.0),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBackColor = const Color(0xFFff9008);
                      selectedGrad1Color = const Color(0xFFff9008);
                      selectedGrad2Color = const Color(0xFFe47e02);
                      selectedTextColor = const Color(0xffffdf82);
                      shadowColor1 = const Color(0xFFffa533);
                      shadowColor2 = const Color(0xFFe07117);
                      selectedTitleTextColor = const Color(0xfffbf9fe);
                      selectedDotColor1 = const Color(0xFFfffdff);
                      selectedDotColor2 = const Color(0xffb6b6b6);
                      unselectedDotColor = const Color(0xFFe47e02);
                    });
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: colorThree,
                      borderRadius: BorderRadius.circular(15.0),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Reset PIN',
                  style: TextStyle(
                    color: selectedTitleTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'Enter your current PIN',
                  style: TextStyle(
                    color: selectedTitleTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                32.heightBox,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: count >= 1 ? [
                            selectedDotColor1,
                            selectedDotColor2,
                          ] : [
                            unselectedDotColor,
                            unselectedDotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    8.widthBox,
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: count >= 2 ? [
                            selectedDotColor1,
                            selectedDotColor2,
                          ] : [
                            unselectedDotColor,
                            unselectedDotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    8.widthBox,
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: count >= 3 ? [
                            selectedDotColor1,
                            selectedDotColor2,
                          ] : [
                            unselectedDotColor,
                            unselectedDotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    8.widthBox,
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: count >= 4 ? [
                            selectedDotColor1,
                            selectedDotColor2,
                          ] : [
                            unselectedDotColor,
                            unselectedDotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    8.widthBox,
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: count >= 5 ? [
                            selectedDotColor1,
                            selectedDotColor2,
                          ] : [
                            unselectedDotColor,
                            unselectedDotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    8.widthBox,
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: count >= 6 ? [
                            selectedDotColor1,
                            selectedDotColor2,
                          ] : [
                            unselectedDotColor,
                            unselectedDotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 48.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  32.heightBox,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '6',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  32.heightBox,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '7',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '8',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '9',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  32.heightBox,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0,
                        child:  Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(35.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 6) {
                              count ++;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: selectedTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      32.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count > 0) {
                              count --;
                            }
                          });
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                selectedGrad2Color,
                                selectedGrad1Color,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 10.0,
                                  spreadRadius: 6,
                                  offset: const Offset(-3, -2)
                              ),
                              BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 10.0,
                                  spreadRadius: 4,
                                  offset: const Offset(1, 2)
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.backspace_outlined,
                              color: selectedTextColor,
                              size: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}