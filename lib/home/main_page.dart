// import 'dart:html';
import 'package:fb_clone/pages/food/introPage.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:location/location.dart';
import 'package:fb_clone/home/food_page_body.dart';
import 'package:fb_clone/model/appColors.dart';
import 'package:fb_clone/model/locationModel.dart';
import 'package:fb_clone/model/userModel.dart';
import 'package:fb_clone/pages/food/category.dart';
import 'package:fb_clone/pages/food/home.dart';
import 'package:fb_clone/pages/food/login.dart';
import 'package:fb_clone/pages/food/orders.dart';
import 'package:fb_clone/pages/food/profile.dart';
import 'package:fb_clone/provider/profile_handler.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

// import 'package:googlr';
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  

  List<User> u = [];
  int selectedIndex = 0;
  List<Widget> tabView = <Widget>[
  homepage(),
    myOrders(),
    category(),
    profile(),
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
    getSession();
    Provider.of<profileProvider>(context,listen: false).getLocation();
   
  }

  getSession() async {
    final user = await SessionManager().get("user");
    if (user == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    } else {
      Provider.of<profileProvider>(context, listen: false).setUser(user);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: tabView.elementAt(selectedIndex),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: GNav(
            rippleColor: Colors.white, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            // tab button border/ tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Color.fromARGB(
                255, 255, 253, 253), // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: Colors.green, // selected tab background color
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Orders',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.list,
                text: 'Menu',
              )
            ],
            selectedIndex: selectedIndex,
            onTabChange: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
        ));
  }
}
