import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geekssyergy/Common_Widget/common_widget.dart';
import 'package:geekssyergy/register_page/register_page_view/register_page_view.dart';
import 'package:geekssyergy/resources/resources.dart';
import 'package:geekssyergy/riverpod/riverpod.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    CommonWidget commonWidget = CommonWidget();

    return SafeArea(
      child: Consumer(
        builder: (context, watch, child) {
          final loginListener=watch.watch(loginProvider);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                "Login Page",
                style: TextStyle(color: Color.goldColor),
              ),
              centerTitle: true,
              backgroundColor: Color.greenColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset("Images/splashscreen.png")),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  commonWidget.myTextField(emailController, "Email"),
                  commonWidget.myTextField(passwordController, "Password"),
                  const SizedBox(
                    height: 20,
                  ),
                  commonWidget.myButton(() {
                        loginListener.loginCheck(emailController.text, passwordController.text, context);
                      }, "Login", Color.greenColor, Color.goldColor),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Don't have an Account? ",
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    TextSpan(
                        text: "Click here",
                        style: const TextStyle(
                            color: Color.greenColor,
                            fontSize: 17.5,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPageView()));
                          }),
                  ]))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
