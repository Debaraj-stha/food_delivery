import 'package:fb_clone/model/appColors.dart';
import 'package:fb_clone/pages/food/expandable_text.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:flutter/material.dart';
import 'package:fb_clone/util/dimension.dart';
class recomondedFood extends StatefulWidget {
  const recomondedFood({super.key});

  @override
  State<recomondedFood> createState() => _recomondedFoodState();
}

class _recomondedFoodState extends State<recomondedFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(child: appIcon(icon: Icons.close),onTap: () => Navigator.pop(context),),
                appIcon(icon: Icons.shopping_cart)
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                     color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                 
                  child: Center(child: BigText(text:"food name")),
                ),
                preferredSize: Size.fromHeight(0)),
            pinned: true,
            backgroundColor: appColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "asset/food4.jfif",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: expandableText(text:
                  "The BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the applicat The BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the applicatThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the applicatThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in generalThe BottonNavigationBar widget is used to show the bottom of an app. It can consist of multiple items such as icons, text, or both that leads to a different route depending upon the design of the application. It is meant to help the user navigate to different sections of the application in general"),
                )
              ],
            )
          )
        ],
      ),
   bottomNavigationBar: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appIcon(icon: Icons.remove,backGroundcolor: appColors.mainColor,color: Colors.white,size: 24,),
          BigText(text: "Rs 890 "+ " X " +" 0",color: appColors.mainBlackColor,),
          appIcon(icon: Icons.add,backGroundcolor: appColors.mainColor,color: Colors.white,size: 24,)
        ],
      ),
      Container(
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
                padding: EdgeInsets.only(left: dimension.width20,right: dimension.width20,top: dimension.height10,bottom: dimension.height10),
               child: Icon(Icons.favorite,color: appColors.mainColor,size: 24,),
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
    ],
   ),
    );
  }
}
