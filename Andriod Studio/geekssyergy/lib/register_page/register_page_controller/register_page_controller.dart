import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geekssyergy/login_page/login_page_view/login_page_view.dart';
import 'package:geekssyergy/register_page/register_page_model/register_page_model.dart';
import 'package:http/http.dart' as http;

class RegisterPageController extends ChangeNotifier
{
    addData(name,age,email,password,context)async
    {
        final url=Uri.parse("http://192.168.29.135:8080/addData");

        final api=await http.post(
            url,
            headers: {
              "Content-Type":"application/json"
            },
            body: jsonEncode({
              "name":name,
              "age":int.parse(age),
              "email":email,
              "password":password
            })
        );

        final decodeData=jsonDecode(api.body);
        final signUpCode=SignUpData.fromJson(decodeData);

        if(api.statusCode==200 && signUpCode.message=="Data added successfully")
        {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(signUpCode.message),duration:const Duration(seconds: 2),));
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPageView()));
        }
        else
        {
            if (kDebugMode)
            {
              print("Error ${api.statusCode}");
            }
        }
    }
}
