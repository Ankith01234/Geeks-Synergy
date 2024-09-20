import 'package:flutter/material.dart';
import 'package:geekssyergy/Common_Widget/common_widget.dart';
import 'package:geekssyergy/resources/resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geekssyergy/riverpod/riverpod.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
  Widget build(BuildContext context) {
    CommonWidget commonWidget = CommonWidget();

    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Consumer(
        builder: (context, watch, child) {
          final registerListener=watch.watch(registerProvider);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Register Page",
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
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset("Images/splashscreen.png")),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  commonWidget.myTextField(nameController, "Name"),
                  commonWidget.myTextField(ageController, "Age"),
                  commonWidget.myTextField(emailController, "Email"),
                  commonWidget.myTextField(passwordController, "Password"),
                  const SizedBox(
                    height: 40,
                  ),
                  commonWidget.myButton(() {
                    registerListener.addData(nameController.text, ageController.text, emailController.text, passwordController.text, context);
                  }, "Register", Color.greenColor, Color.goldColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
