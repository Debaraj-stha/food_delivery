import 'package:fb_clone/pages/food/expandable_text.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/dimension.dart';
import 'package:fb_clone/util/icon_and_text.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:fb_clone/model/appColors.dart';
class papularFoodDetail extends StatefulWidget {
  const papularFoodDetail({super.key});

  @override
  State<papularFoodDetail> createState() => _papularFoodDetailState();
}

class _papularFoodDetailState extends State<papularFoodDetail> {
  int _selectedIndex=0;
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: dimension.papularFoodImgSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/food8.jfif"),
                        fit: BoxFit.cover)),
              )
              ),
              Positioned(left: dimension.width20,right: dimension.width20,top: dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const appIcon(icon: Icons.arrow_back_ios),
                  const appIcon(icon: Icons.shopping_basket)
                ],
              ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: dimension.papularFoodImgSize-20,
                child: Container(
                 padding: EdgeInsets.only(top: dimension.height20,left: dimension.width20,right: dimension.width20),
                 decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                  color: Colors.white
                 ),
                 child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: "Food0"),
                  SizedBox(
                    height: dimension.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                          children: List.generate(5, (index) {
                        return Icon(Icons.star,
                            color: appColors.mainColor, size: 15);
                      })),
                      const SizedBox(
                        width: 10,
                      ),
                      const smallText(text: "4.5"),
                      const SizedBox(
                        width: 10,
                      ),
                      const smallText(text: "comments")
                    ],
                  ),
                  SizedBox(
                    height: dimension.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconAndText(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: appColors.iconColor1),
                      iconAndText(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: appColors.mainColor),
                      iconAndText(
                          icon: Icons.access_time_rounded,
                          text: "32 min",
                          iconColor: appColors.iconColor2)
                    ],
                  ),
                  const expandableText(text: "The BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in general.")
                ],
              ),
                ),             
             
              ),
                 
        ],
      
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 232, 232),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
               padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                padding: EdgeInsets.only(left: dimension.width20*2.5,right: dimension.width20*2.5,top: dimension.height10,bottom: dimension.height10),
                child: Row(
                  children: [
                    appIcon(icon: Icons.remove,backGroundcolor: appColors.mainColor,color: Colors.white,size: 24,),
                    BigText(text: "0"),
                    appIcon(icon: Icons.add,backGroundcolor: appColors.mainColor,color: Colors.white,size: 24,)
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              decoration: BoxDecoration(
                color: appColors.mainColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: BigText(text: "Rs 1000| Add to cart",color: Colors.white,),)
            
          ],
        ),
      )
    );
    
  }
}
