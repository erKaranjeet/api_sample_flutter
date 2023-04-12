import 'package:api_sample_flutter/ui/home_screen.dart';
import 'package:api_sample_flutter/ui/login_screen.dart';
import 'package:api_sample_flutter/utils/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {

  late TextEditingController fNameController, lNameController, emailController, passwordController, cPasswordController;
  bool isPassVisible = true;

  @override
  void initState() {
    super.initState();

    fNameController = TextEditingController();
    lNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70.0),
                          topRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          FadeAnimation(
                            1,
                            Container(
                              margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.black54,
                                elevation: 15.0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                                  child: TextFormField(
                                    controller: fNameController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.singleLineFormatter
                                    ],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "First Name",
                                      // helperText: "abc@example.com",
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, left: 40.0, right: 40.0),
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.black54,
                                elevation: 15.0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                                  child: TextFormField(
                                    controller: lNameController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.singleLineFormatter
                                    ],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "Last Name",
                                      // helperText: "abc@example.com",
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.6,
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, left: 40.0, right: 40.0),
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.black54,
                                elevation: 15.0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                                  child: TextFormField(
                                    controller: emailController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.singleLineFormatter
                                    ],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "Email ID",
                                      // helperText: "abc@example.com",
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.9,
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, left: 40.0, right: 40.0),
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.black54,
                                elevation: 15.0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                                  child: TextFormField(
                                    controller: passwordController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    obscureText: isPassVisible,
                                    autocorrect: false,
                                    obscuringCharacter: "*",
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.singleLineFormatter
                                    ],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "Password",
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            2.2,
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, left: 40.0, right: 40.0),
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.black54,
                                elevation: 15.0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                                  child: TextFormField(
                                    controller: cPasswordController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    obscureText: isPassVisible,
                                    autocorrect: false,
                                    obscuringCharacter: "*",
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.singleLineFormatter
                                    ],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: "Confirm Password",
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          FadeAnimation(
                            2.5,
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.black54, blurRadius: 3.0),
                                  ],
                                  color: Colors.black,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            2.8,
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 40.0),
                                padding: const EdgeInsets.only(
                                    bottom: 50.0, left: 45.0, right: 45.0),
                                child: const Center(
                                  child: Text(
                                    "Already have any account? Sign In",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
