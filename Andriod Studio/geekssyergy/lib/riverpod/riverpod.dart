
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geekssyergy/home_page/home_page_controller/home_page_controller.dart';
import 'package:geekssyergy/login_page/login_page_controller/login_page_controller.dart';
import 'package:geekssyergy/register_page/register_page_controller/register_page_controller.dart';

final registerProvider=ChangeNotifierProvider<RegisterPageController>((ref){
  return RegisterPageController();
});

final loginProvider=ChangeNotifierProvider<LoginPageController>((ref){
  return LoginPageController();
});

final homeProvider=ChangeNotifierProvider<HomePageController>((ref){
  return HomePageController();
});
