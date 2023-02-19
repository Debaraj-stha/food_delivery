// import 'dart:html';

import 'package:fb_clone/pages/food/DeliveryAddress.dart';
import 'package:fb_clone/pages/food/changePassword.dart';
import 'package:fb_clone/pages/food/logOut.dart';
import 'package:fb_clone/provider/profile_handler.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/profile_page_link.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  const profile({super.key, required});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  nextPage() {}
  @override
  Widget build(BuildContext context) {
    final profileProviders =
        Provider.of<profileProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 232, 229, 229),
        padding: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Settings"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: smallText(
                      text: "Profile And App Setting",
                      size: 15,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              //  color: Colors.white,
                              // border: Border.all(color: Colors.black12,width: 1)
                              ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 5, 35, 60),
                                    border: Border.all(
                                        color: Colors.black12, width: 1)),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: profileProviders.user[0].name),
                                  smallText(
                                    text: profileProviders.user[0].email,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        profilePageList(
                            text: "Edit Profile",
                            icon: Icons.edit,
                            callback: nextPage(),
                            color: Colors.black,
                            isBorder: true),
                        profilePageList(
                            text: "Change Password",
                            icon: Icons.security,
                            callback: changePassword(),
                            color: Colors.black,
                            isBorder: true),
                        profilePageList(
                            text: "Delivery address",
                            icon: Icons.location_city,
                            callback: deliveryAddress(),
                            color: Colors.black,
                            isBorder: true),
                        profilePageList(
                            text: "Favourites",
                            icon: Icons.favorite_rounded,
                            callback: nextPage(),
                            color: Colors.black,
                            isBorder: true),
                        InkWell(
                          onTap: () {
                            logOut(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                //  color:Colors.red,
                                // border: Border(

                                // bottom: widget.isBorder==true?BorderSide(color: Colors.black12):BorderSide.none
                                // )
                                ),
                            child: Row(
                              children: [
                                appIcon(
                                  icon: Icons.edit,
                                  color: Colors.black,
                                  backGroundcolor: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                BigText(
                                  text: "Logout",
                                  color: Colors.red,
                                  size: 18,
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      logOut(context);
                                    },
                                    icon: Icon(Icons.arrow_circle_right))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  profilePageList(
                      text: "Notification",
                      icon: Icons.notifications_active,
                      callback: nextPage(),
                      color: Colors.black),
                  profilePageList(
                      text: "Rate and Review",
                      icon: Icons.feedback_outlined,
                      callback: nextPage(),
                      color: Colors.black),
                  profilePageList(
                      text: "Privacy and Policy",
                      icon: Icons.policy,
                      callback: nextPage(),
                      color: Colors.black),
                  profilePageList(
                      text: "Contact US",
                      icon: Icons.email,
                      callback: nextPage(),
                      color: Colors.black),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: smallText(text: "copyright"),
            )
          ],
        ),
      ),
    );
  }
}
