import 'package:fb_clone/model/appColors.dart';
import 'package:fb_clone/pages/food/buttonGroup.dart';
import 'package:fb_clone/pages/food/dummy.dart';
import 'package:fb_clone/pages/food/expandable_text.dart';
import 'package:fb_clone/pages/food/profile.dart';
import 'package:fb_clone/pages/food/resturantDetailpage.dart';
import 'package:fb_clone/provider/profile_handler.dart';
// import 'package:fb_clone/provider/quantityAndPriceProvider.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/mediumText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class singleItemPage extends StatefulWidget {
  const singleItemPage({super.key, required this.items});
  final items;
  @override
  State<singleItemPage> createState() => _singleItemPageState();
}

class _singleItemPageState extends State<singleItemPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<resturantProvider>(context, listen: false)
        .fetchSingleResturants(widget.items.restaurantName);
            Provider.of<resturantProvider>(context,listen: false).resetItems();

  }

  @override
  Widget build(BuildContext context) {
    final userId=Provider.of<profileProvider>(context,listen: false).user[0].id;

    final resturantProviders =
        Provider.of<resturantProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: BigText(
          text: widget.items.name,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(77, 139, 137, 137),
            border: Border(top: BorderSide(color: Colors.black12, width: 2))),
        child: Consumer<resturantProvider>(builder: ((context, value, child) {
          return Column(
            children: [
              Row(
                children: [
                  BigText(text: "Quantity"),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        resturantProviders.decreaseQuantity(
                            resturantProviders.quantity, widget.items.rate);
                      },
                      icon: appIcon(
                        icon: Icons.remove,
                        backGroundcolor: Colors.white,
                      ),
                      highlightColor: Colors.transparent),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                        child: smallText(
                      text: resturantProviders.quantity.toString(),
                      size: 15,
                    )),
                  ),
                  IconButton(
                    onPressed: () {
                      resturantProviders.increaseQuantity(resturantProviders.quantity, widget.items.rate);
                    },
                    icon: appIcon(
                      icon: Icons.add,
                      backGroundcolor: Colors.white,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 25, 123, 29),
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                          child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 25, 123, 29),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          
                          children: [
                            TextButton(
                                onPressed: () {
                                  resturantProviders.addCartItem(userId, resturantProviders.quantity.toString(), widget.items.id);
                                },
                                child: smallText(
                                  text: "Add to cart",
                                  size: 16,
                                  color: Colors.white,
                                )),
                                Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: BigText(
                                text: "Rs" + "${resturantProviders.quantity*widget.items.rate}",
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        })),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Image(image: NetworkImage(widget.items.image))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: widget.items.name,
                        ),
                        smallText(
                          text: widget.items.restaurantName,
                          size: 17,
                        )
                      ],
                    ),
                    BigText(text: widget.items.price.toString()),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonGroup(
                        text: "Deliverable",
                        color: Color.fromARGB(255, 25, 123, 29)),
                    buttonGroup(
                        text: "Availabel per plate",
                        color: appColors.mainBlackColor),
                    buttonGroup(
                        text: "Available per pieces",
                        color: appColors.mainBlackColor)
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Color.fromARGB(255, 194, 191, 191),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: expandableText(text: widget.items.description)),
              Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    appIcon(
                      icon: Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Options"),
                        smallText(
                            size: 15,
                            text: "Slect options to add them to the product")
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resturantDetail(
                                resturant: resturantProviders.singleRes[0])));
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                            color: Color.fromARGB(255, 25, 123, 29))),
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          appIcon(
                            icon: Icons.shopping_bag,
                            color: Color.fromARGB(255, 25, 123, 29),
                            size: 30,
                          ),
                          Consumer<resturantProvider>(
                              builder: ((context, value, child) {
                            if (value.singleRes == null) {
                              return CircularProgressIndicator();
                            } else {
                              return InkWell(
                                onTap: () {
                                  resturantProviders.fetchSingleResturantItems(
                                      widget.items.restaurantName);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => resturantDetail(
                                              resturant: resturantProviders
                                                  .singleRes[0])));
                                },
                                child: Column(
                                  children: [
                                    smallText(
                                      text: "View more from",
                                      size: 16,
                                      color: Color.fromARGB(255, 25, 123, 29),
                                    ),
                                    // smallText(text: widget.items.restaurantName,size: 16,color: Color.fromARGB(255, 25, 123, 29)),
                                    // smallText(text:resturantProviders.singleRes[0].resturantName,color: Color.fromARGB(255, 25, 123, 29),size: 16,),
                                  ],
                                ),
                              );
                            }
                          }))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
