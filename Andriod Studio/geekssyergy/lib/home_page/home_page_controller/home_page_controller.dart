import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geekssyergy/home_page/home_page_model/home_page_model.dart';
import 'package:http/http.dart' as http;

class HomePageController extends ChangeNotifier
{
    List<Result> movieResult=[];
    int count=0;
    bool isLoading=false;

    HomePageController()
    {
        movieDataList();
    }

    movieDataList()async
    {

        isLoading=true;
        notifyListeners();

        final url=Uri.parse("https://hoblist.com/api/movieList");

        final api=await http.post(
            url,
            headers: {
              "Content-Type":"application/json"
            },
            body: jsonEncode({
              "category": "movies",
              "language": "kannada",
              "genre": "all",
              "sort": "voting"
            })
        );

        final decodeData=jsonDecode(api.body);
        final movieData=HomeScreenData.fromJson(decodeData);

        if(api.statusCode==200)
        {
            movieResult=movieData.result;
            isLoading=false;
            count=movieResult.length;
            notifyListeners();
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
