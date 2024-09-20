import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geekssyergy/home_page/home_page_view/home_page_view.dart';
import 'package:geekssyergy/login_page/login_page_model/login_page_model.dart';
import 'package:http/http.dart' as http;

class LoginPageController extends ChangeNotifier
{
    loginCheck(email,password,context)async
    {
        final url=Uri.parse("http://192.168.29.135:8080/loginChk");

        final api=await http.post(
            url,
            headers: {
              "Content-Type":"application/json"
            },
            body: jsonEncode({
              "email":email,
              "password":password
            })
        );

        final decodeData=jsonDecode(api.body);
        final loginData=LoginData.fromJson(decodeData);

        if(api.statusCode==200 && loginData.message=="Correct Password")
        {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loginData.message),duration: const Duration(seconds: 2),));
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePageView()));
        }
        else
        {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loginData.message),duration: const Duration(seconds: 2),));
        }

    }
}
