// import 'dart:ffi';

import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:fb_clone/model/appColors.dart';
import 'package:fb_clone/pages/food/category.dart';
import 'package:fb_clone/pages/food/details.dart';
import 'package:fb_clone/pages/food/dummy.dart';
import 'package:fb_clone/pages/food/papular_food_detail.dart';
import 'package:fb_clone/pages/food/recomonded_food_details.dart';
import 'package:fb_clone/pages/food/resturantDetailpage.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/dimension.dart';
import 'package:fb_clone/util/icon_and_text.dart';
import 'package:fb_clone/util/mediumText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class foodPageBody extends StatefulWidget {
  const foodPageBody({super.key});

  @override
  State<foodPageBody> createState() => _foodPageBodyState();
}

class _foodPageBodyState extends State<foodPageBody> {
  PageController controller = PageController(viewportFraction: 0.85);
  double currentPAgeVAlue = 0;
  double scaleFactor = 0.8;
  double height = dimension.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPAgeVAlue = controller.page!;
      });
      print(currentPAgeVAlue.toString());
    });
    Provider.of<resturantProvider>(context,listen: false).fetchCategory();
    Provider.of<resturantProvider>(context,listen: false).fetchNearByResturant("dharan");
  }

  @override
  // void dispose() {
  //   controller.dispose();
  // }

  Widget build(BuildContext context) {
    final resturantProviders=Provider.of<resturantProvider>(context,listen:false);
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
              Container(
          // color: Colors.red,
          height:220 ,
          // color: Colors.red,
          child: PageView.builder(
              controller: controller,
              itemCount: 5,
              itemBuilder: (context, i) {
                return buildPage(i);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: currentPAgeVAlue,
          decorator: DotsDecorator(
            activeColor: appColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Categories"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),



       // categories
       Container(
        height: 120,
         child: Consumer<resturantProvider>(builder: ((context, value, child) {
           if(value.category==null){
            return CircularProgressIndicator();
           }
           else{
            return ListView.builder(
              itemCount: resturantProviders.category.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                final cat = resturantProviders.category[i];
                return InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>category(subCategory: cat.doc.subCategory,))),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    width:80,
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(image: NetworkImage(cat.doc.image),fit: BoxFit.cover,)
                              ),
                            
                        ),
                        Text(cat.doc.name),
                      ],
                    ),
                  ),
                );
              });
           }
         })),
       ),
        
 // nearBy resturants
  Container(
     margin: EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BigText(text: "Nearby Resturants")
      ],
    ),
  ),
  Container(
    margin: EdgeInsets.only(left: 10),
          height: 220,
    child: Consumer<resturantProvider>(builder: ((context, value, child) {
      if(value.resturants==null){
        return CircularProgressIndicator();
      }
      else{
        return ListView.builder(
                itemCount: resturantProviders.nearByRes.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>resturantDetail()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width-100,
                      // padding: EdgeInsets.all(10),
                        // height: 10,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,5),
                              color: Color.fromARGB(255, 206, 200, 200),
                              blurRadius: 0.5
                            ),
                             BoxShadow(
                              offset: Offset(5,5),
                              color: Color.fromARGB(255, 206, 200, 200),
                              blurRadius: 0.5
                            ),
                             BoxShadow(
                              offset: Offset(5,0),
                              color: Color.fromARGB(255, 206, 200, 200),
                              blurRadius: 0.5
                            )
                          ],
                            borderRadius: BorderRadius.circular(6),
                          // image: DecorationImage(image: NetworkImage(resturantProviders.nearByRes[i].image),fit: BoxFit.cover,)
                            ),
                          child: Stack(
                            children:[
                             Container(child: Image(image:NetworkImage(resturantProviders.nearByRes[i].image),fit: BoxFit.cover,)),
                             Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                    color: Color.fromARGB(255, 178, 171, 171).withOpacity(.5),
                                    height: 60,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        smallText(text: resturantProviders.nearByRes[i].resturantName,color: Colors.white,size: 16,),
                                        smallText(text: resturantProviders.nearByRes[i].location,color: Colors.white,size: 16,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            smallText(text: resturantProviders.nearByRes[i].openTime + " to ",color: Colors.white,size: 14,),
                                            smallText(text: resturantProviders.nearByRes[i].closeTime,color: Colors.white,size: 14,)
                                          ],
                                        )
                                      ],
                                    ),
                              ),
                             )
                             ]), 
                      ),
                    ),
                  );
                });
      }
    })),
  ),
 
        
//For You


Container(
   margin: EdgeInsets.only(left: 10),
  child:   Row(
      children: [
        BigText(text: "For You")
  
      ]
    ),
),
  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 3,
    mainAxisExtent: 150,
    mainAxisSpacing: 4),
    shrinkWrap: true,
  
    physics: NeverScrollableScrollPhysics(),
    itemCount: 8,
  
     itemBuilder: (context,i){
      return Container(
         margin: EdgeInsets.only(left: 10,right: 10),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:Border.all(width: 2,color: Colors.grey)
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: 80,
              child: Image(image: AssetImage("asset/food${i}.jfif"),fit: BoxFit.contain,height: 60,width: 80,),
            ),
            BigText(text: "food name ${i}"),
            Text("food details goes here if have",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,),),
            Text("Rs. 225.00",style: TextStyle(color: Colors.green,fontSize: 16),)

          ],
        ),
      );
     }),


     //Top resturant
      Container(
     margin: EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BigText(text: "Top Ressturant")
      ],
    ),
  ),
  Container(
    
     margin: EdgeInsets.only(left: 10),
          height: 300,
          child: ListView.builder(
              itemCount: 9,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width-100,
                    height: 300,
                  // padding: EdgeInsets.all(10),
                    // height: 10,
                    decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                    //  color: Colors.red
                        ),
                       child: Expanded(
                         child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                            child: Image(image: AssetImage("asset/food${i}.jfif"),height: 140,fit: BoxFit.cover,),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                   mediumText(text: "Resturant name",color: Color.fromARGB(255, 21, 20, 20),),
                                   mediumText(text: "Resturant address",color: Color.fromARGB(255, 21, 20, 20)),
                                   Row(
                                    children: [
                                          mediumText(text: "Delivery",size: 15,color: Colors.greenAccent,),
                                          mediumText(text: "Pickup",size: 15,color: Colors.redAccent,)
                       
                                    ],
                                   )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: mediumText(text: "4.16km",color: Color.fromARGB(255, 21, 20, 20)),
                                    ),
                                    Row(
                                      children: [
                                        appIcon(icon: Icons.alarm,color:appColors.mainColor,),
                                        mediumText(text: "8 am to 2 am",color: Color.fromARGB(255, 21, 20, 20))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                         ),
                       ),
                  ),
                );
              }),
        ),
        
        //papular
        // ListView.builder(
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemCount: 8,
        //     itemBuilder: (context, i) {
        //       return Container(
        //         margin: EdgeInsets.only(
        //             left: dimension.width20,
        //             right: dimension.width20,
        //             bottom: dimension.height10),
        //         child: Row(
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 recomondedFood();
        //               },
        //               child: Container(
        //                 width: dimension.listViewImg,
        //                 height: dimension.listViewImg,
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(20),
        //                     color: Colors.white38,
        //                     image: DecorationImage(
        //                         image: AssetImage('asset/food${i}.jfif'),
        //                         fit: BoxFit.cover)),
        //               ),
        //             ),
        //             Expanded(
        //               child: Container(
        //                 height: dimension.listViewTextSize,
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.only(
        //                         topRight: Radius.circular(20),
        //                         bottomRight: Radius.circular(20)),
        //                     color: Colors.white),
        //                 child: Padding(
        //                   padding: EdgeInsets.only(
        //                       left: dimension.width10,
        //                       right: dimension.width10),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       BigText(text: "Nutrientation fruit and meal"),
        //                       SizedBox(
        //                         height: dimension.height10,
        //                       ),
        //                       smallText(text: "with  very fressness"),
        //                       SizedBox(
        //                         height: dimension.height10,
        //                       ),
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           iconAndText(
        //                               icon: Icons.circle_sharp,
        //                               text: "Normal",
        //                               iconColor: appColors.iconColor1),
        //                           iconAndText(
        //                               icon: Icons.location_on,
        //                               text: "1.7km",
        //                               iconColor: appColors.mainColor),
        //                           iconAndText(
        //                               icon: Icons.access_time_rounded,
        //                               text: "32 min",
        //                               iconColor: appColors.iconColor2)
        //                         ],
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       );
        //     })
      ],
    );
  }

  Widget buildPage(int i) {
   
    Matrix4 matrix = new Matrix4.identity();
    if (i == currentPAgeVAlue.floor()) {
      var currentScale = 1 - (currentPAgeVAlue - i) * (1 - scaleFactor);
      var currenTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currenTrans, 0);
    } else if (i == currentPAgeVAlue.floor() + 1) {
      var currentScale =
          scaleFactor + (currentPAgeVAlue - i + 1) * (1 - scaleFactor);
      var currenTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currenTrans, 0);
    } else if (i == currentPAgeVAlue.floor() - 1) {
      var currentScale = 1- (currentPAgeVAlue - i) * (1 - scaleFactor);
      var currenTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currenTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }
    Matrix4 matrix1=new Matrix4.identity();
    if(i==currentPAgeVAlue.floor()){
      var currentScale=1-(currentPAgeVAlue-i)*(1-scaleFactor);
      var currentTrans=height*(1-currentPAgeVAlue)/2;
      matrix1=Matrix4.diagonal3Values(1,currentScale,1)..setTranslationRaw(0, currentTrans, 0);
    }
    else if(i==currentPAgeVAlue.floor()+1){
      var currentScale=scaleFactor+(1-currentPAgeVAlue-1-i)*(1-scaleFactor);
      var currentTrans=height*(1-currentPAgeVAlue)/2;
    }
        return Transform(
      transform: matrix,
      child: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>recomondedFood()));
        },
        child: Stack(
          children: [
           Container(
              height:220,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: i.isEven ? Colors.greenAccent : Colors.blueAccent,
                  image: DecorationImage(
                      image: AssetImage('asset/food${i}.jfif'),
                      fit: BoxFit.cover)),
            ),
        
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0, 5),
                        blurRadius: 5),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]
                  // image: DecorationImage(image: AssetImage('asset/food${i}.jfif'),fit: BoxFit.cover)
                  ),
              child: Container(
              
                padding:
                    EdgeInsets.only(top: dimension.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(text: "Food ${i}"),
                    SizedBox(
                      height: dimension.height10,
                    ),
                    
                    SizedBox(
                      height: dimension.height20,
                    ),
                    BigText(text: "Resturnat name,address",size: 17,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                            children: List.generate(5, (index) {
                          return Icon(Icons.star,
                              color: appColors.mainColor, size: 15);
                        })),
                        SizedBox(
                          width: 10,
                        ),
                        smallText(text: "4.5"),
                        SizedBox(
                          width: 10,
                        ),
                        
                      ],
                    ),
                  ],
                  
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
