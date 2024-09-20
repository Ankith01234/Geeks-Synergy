import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geekssyergy/Common_Widget/common_widget.dart';
import 'package:geekssyergy/login_page/login_page_view/login_page_view.dart';
import 'package:geekssyergy/resources/resources.dart';
import 'package:geekssyergy/riverpod/riverpod.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState createState() => HomePageViewState();
}

class HomePageViewState extends ConsumerState<HomePageView> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ref.read(homeProvider).movieDataList();
  // }

  @override
  Widget build(BuildContext context) {
    CommonWidget commonWidget=CommonWidget();
    return SafeArea(
      child: Consumer(
        builder: (context, watch, child) {
          final homeListener = watch.watch(homeProvider);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Home Page",
                style: TextStyle(color: Color.whiteColor),
              ),
              backgroundColor: Color.greenColor,
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPageView()));
                  },child: const Text("Logout",style: TextStyle(color: Color.whiteColor,fontSize: 18),)),
                )
              ],
            ),
            body: homeListener.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: homeListener.count,
                            itemBuilder: (BuildContext context, index) {
                              final rec = homeListener.movieResult[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Color.darkColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width: 150,
                                                    height: 200,
                                                    child:
                                                        Image.network(rec.poster)),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    width: 200,
                                                    child: SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Text(
                                                          "Name : ${rec.title}",
                                                          style: const TextStyle(
                                                              fontSize: 18),
                                                        )),
                                                  ),
                                                  SizedBox(
                                                      height: 20,
                                                      width: 200,
                                                      child: SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Text(
                                                            " ${rec.genre}",
                                                            style: const TextStyle(
                                                                fontSize: 18),
                                                          ))),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 200,
                                                    child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Text(
                                                        " ${rec.director}",
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: 20,
                                                      width: 200,
                                                      child: SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Text(
                                                            " ${rec.stars}",
                                                            style: const TextStyle(
                                                                fontSize: 18),
                                                          ))),
                                                ]),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 200,
                                            child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Color.greenColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),child:const Text("Watch Trailer",style: TextStyle(color: Color.whiteColor),)))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                        ElevatedButton(onPressed: (){
                          showPop(context);
                        }, style: ElevatedButton.styleFrom(backgroundColor: Color.greenColor),child:const Text("Company Info",style: TextStyle(color: Color.whiteColor),)),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  showPop(context)
  {
      showDialog(context: context, builder: (context){
        return SizedBox(
          width: 100,
          height: 100,
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Company Details"),
                IconButton(onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            content: const SizedBox(
              height: 250,
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name : Geeksynergy Technologies Pvt Ltd",style: TextStyle(fontSize: 20),),
                  Text("Address: Sanjayanagar, Bengaluru-56",style: TextStyle(fontSize: 20),),
                  Text("Phone: 7854123609",style: TextStyle(fontSize: 20),),
                  Text("Email: Geekssynergy@gmail.com",style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),
        );
      });
  }

}
