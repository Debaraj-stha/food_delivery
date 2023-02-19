import 'package:dots_indicator/dots_indicator.dart';
import 'package:fb_clone/pages/food/login.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  PageController controller = PageController();
  double currentPage=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage=controller.page!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            child: smallText(
              text: "Skip",
              size: 16,
              color: Color.fromARGB(255, 25, 123, 29),
            ),
            onPressed: () {
              SessionManager().set("isVisited", true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
               height: MediaQuery.of(context).size.height - 300,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: controller,
              
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.blue,
                            height: MediaQuery.of(context).size.height/2,
                            child: Image(image: AssetImage("asset/image1.png")),
                          ),
                          BigText(
                            text: "Your Hunger partner Order ",
                            color: Color.fromARGB(255, 25, 123, 29),
                          ),
                          smallText(text: "Get your favourite food at your door step only in 3 steps",)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.blue,
                            height: MediaQuery.of(context).size.height/2,
                            child: Image(image: AssetImage("asset/image2.png")),
                          ),
                          BigText(
                            text:"Register Your account ",
                            color: Color.fromARGB(255, 25, 123, 29),
                          ),
                          smallText(text: "Register your account with name,email and phone number",)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.blue,
                            height: MediaQuery.of(context).size.height/2,
                            child: Image(image: AssetImage("asset/image3.png")),
                          ),
                          BigText(
                            text:"Order your favourite food",
                            color: Color.fromARGB(255, 25, 123, 29),
                          ),
                          smallText(text: "Order your favourite food from 200+ resturant around Dharan and Itahari",)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.blue,
                            height: MediaQuery.of(context).size.height/2,
                            child: Image(image: AssetImage("asset/image4.png")),
                          ),
                          BigText(
                            text:"Get delivered at yyour door steps",
                            color: Color.fromARGB(255, 25, 123, 29),
                          ),
                          smallText(text: "Your ordered will be delivered within 30-45 minutes at your door step",)
                        ],
                      ),
                    )
                ],
              )
            ),
            DotsIndicator(
          dotsCount: 4,
          position: currentPage,
          decorator: DotsDecorator(
            activeColor: Color.fromARGB(255, 25, 123, 29),
            size: const Size.square(9.0),
            // activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
            ElevatedButton(
              onPressed: () {
                controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: BigText(text: "Next", color: Colors.white),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 25, 123, 29),
                  minimumSize: Size.fromHeight(50)),
            )
          ],
        ),
      ),
    );
  }
}
