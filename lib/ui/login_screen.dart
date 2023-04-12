import 'package:api_sample_flutter/ui/home_screen.dart';
import 'package:api_sample_flutter/ui/sign_up_screen.dart';
import 'package:api_sample_flutter/utils/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController, passwordController;
  bool isPassVisible = true;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/ic_logo.png",
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
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
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                      1.6,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          width: double.infinity,
                          margin:
                              const EdgeInsets.only(left: 45.0, right: 45.0),
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                              "Login",
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
                      1.9,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 70.0),
                          padding: const EdgeInsets.only(
                              bottom: 50.0, left: 45.0, right: 45.0),
                          child: const Center(
                            child: Text(
                              "Don't have any account? Sign Up",
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
            ],
          ),
        ),
      ),
    );
  }

  void isPasswordVisible() {
    if (isPassVisible) {
      isPassVisible = false;
    } else {
      isPassVisible = true;
    }
  }
}
