import 'package:fb_clone/home/food_page_body.dart';
import 'package:fb_clone/pages/food/cart.dart';
import 'package:fb_clone/provider/profile_handler.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late String userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getLocation();
    getCartItems();
  }

  void getLocation(){
Timer(Duration(seconds: 5),(){
  print("object");
    // Provider.of<resturantProvider>(context,listen: false).getLocationData();
});
  }
  void getCartItems() {
    Timer(Duration(seconds: 2), () {
      // print("5 seconds have passed");

      userId = Provider.of<profileProvider>(context, listen: false).user[0].id;
      Provider.of<resturantProvider>(context, listen: false)
          .getCardItem(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final resturantProviders =
        Provider.of<resturantProvider>(context, listen: false);
    return Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 60, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "NoName Restro",
                  color: Color.fromARGB(255, 34, 141, 37),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => myCart()));
                                  },
                                  child: appIcon(
                                    icon: Icons.shopping_cart,
                                    size: 50,
                                    backGroundcolor: Colors.green,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(40)
                                ),
                                child: Consumer<resturantProvider>(builder: (context,value,child){
                                  return Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: BigText(
                                      text: resturantProviders.cartItems.length
                                          .toString(),
                                      size: 18,
                                      color: Colors.white,
                                    ));
                                },)
                                ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appIcon(
                icon: Icons.location_disabled,
                backGroundcolor: Colors.white,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Consumer<resturantProvider>(builder: (context,value,child){
                        if(value.country==""){
                          return CircularProgressIndicator();
                        }
                        else{
                          return  BigText(text: resturantProviders.country);
                        }
                      }),
                      appIcon(
                        icon: Icons.arrow_drop_down,
                        backGroundcolor: Colors.white,
                      )
                    ],
                  ),
                  smallText(
                    text: resturantProviders.country,
                    size: 15,
                  )
                ],
              ),
              Spacer(),
              appIcon(
                icon: Icons.search,
                color: Colors.white,
                backGroundcolor: Colors.green,
                size: 30,
              )
            ],
          ),
        ),
        Expanded(child: SingleChildScrollView(child: foodPageBody())),
      ],
    );
  }
}
