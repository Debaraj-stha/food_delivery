import 'package:fb_clone/model/itemsModel.dart';
import 'package:fb_clone/pages/food/buttonGroup.dart';
import 'package:fb_clone/pages/food/category.dart';
import 'package:fb_clone/provider/profile_handler.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:fb_clone/util/tab.dart';
import 'package:flutter/material.dart';
import 'package:fb_clone/model/appColors.dart';
import 'package:provider/provider.dart';

class resturantDetail extends StatefulWidget {
  const resturantDetail({super.key, required this.resturant});
  final resturant;
  @override
  State<resturantDetail> createState() => _resturantDetailState();
}

class _resturantDetailState extends State<resturantDetail>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late int tabLength;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<resturantProvider>(context, listen: false)
        .fetchSingleResturantItems(widget.resturant.resturantName);
    tabLength = Provider.of<resturantProvider>(context, listen: false)
        .subCategories
        .length;
    _controller =
        TabController(length: tabLength, vsync: this, initialIndex: 0);
    _controller.addListener(handleTabIndex);
    Provider.of<resturantProvider>(context, listen: false)
        .fetchCategoryTabItem(widget.resturant.resturantName);
    print(tabLength);
  }

  void handleTabIndex() {
    setState(() {});
  }

  @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  Widget build(BuildContext context) {
    final resturantProviders =
        Provider.of<resturantProvider>(context, listen: false);
    List<Items> categoryTabItem =
        Provider.of<resturantProvider>(context, listen: false).categoryTabItem;
            final userId=Provider.of<profileProvider>(context,listen: false).user[0].id;
     
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        title: Text(widget.resturant.resturantName),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Container(
                width: 50,
                child: appIcon(
                  icon: Icons.shopping_cart,
                  size: 50,
                  backGroundcolor: Colors.white,
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
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: BigText(
                          text: "0",
                          size: 18,
                          color: Colors.black,
                        ))),
              )
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 25, 123, 29),
            actions: [
              Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 25, 123, 29)),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
            bottom: PreferredSize(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  // margin: EdgeInsets.only(bottom: 6),
                  height: 90,

                  padding: EdgeInsets.only(top: 20, left: 8, right: 8),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(widget.resturant.image),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: widget.resturant.resturantName),
                          SizedBox(
                            height: 3,
                          ),
                          smallText(
                            text: widget.resturant.location,
                            size: 16,
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.telegram_outlined,
                            color: Color.fromARGB(255, 25, 123, 29),
                          ))
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(0)),
            expandedHeight: 300,
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Image(
              image: NetworkImage(widget.resturant.image),
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            
              child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonGroup(
                          text: "Open",
                          color: Color.fromARGB(255, 25, 123, 29),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        buttonGroup(
                          text: "Delivery",
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        buttonGroup(
                          text: "Pickup",
                          color: Colors.indigo,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(5, (index) {
                          return Icon(Icons.star,
                              color: appColors.yellowColor, size: 15);
                        })),
                      ],
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 8,bottom: 8,left: 8),
                    // color: Colors.red,
                    child: smallText(
                        size: 15,
                        color: Color.fromARGB(115, 17, 16, 16),
                        text:
                            "WebChatGPT is a large language model developed by OpenAI that can be used for natural language processing tasks such as text generation and language translation. It is based on the GPT-3.5 (Generative Pretrained …"))
              ],
            ),
          )),
          SliverAppBar(
            // floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: DefaultTabController(
                length: resturantProviders.subCategories.length,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  height: 50,
                  // color: Colors.red,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color.fromARGB(255, 25, 123, 29),
                    controller: _controller,
                    onTap: (value) {
                    },
                    tabs: resturantProviders.subCategories
                        .map((String name) => Tab(
                          // text: name,
                        child: Text(name,style: TextStyle(color:_controller.index==resturantProviders.subCategories.indexOf(name)?Color.fromARGB(255, 25, 123, 29):Colors.black,fontFamily: "Roboto",fontSize:18 ),),
                              
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _controller,
              children: resturantProviders.subCategories.map((tab) {
                return RepaintBoundary(
                  child: ListView.builder(
                    itemCount: categoryTabItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(tab);
                      if (categoryTabItem[index].subCategory == tab) {
                        // return ListTile(
                        //   title: Text(categoryTabItem[index].name),
                        //   subtitle: Text(categoryTabItem[index].restaurantName),
                        // );
                      return  Container(
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              // padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(categoryTabItem[index].image))),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: categoryTabItem[index].name),
                                Container(
                                  width: MediaQuery.of(context).size.width-300,
                                  child: smallText(
                                    text: categoryTabItem[index].description,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Consumer<resturantProvider>(builder: (context,value,child){
                              Map<String, String>? item = resturantProviders.getItem(categoryTabItem[index].id);
                              int itemRate=item==null?1:int.parse(item['rate']!);
                              int intItemQuantity=item==null?1:int.parse(item['quantity']!);
                              int itemPrice=itemRate*intItemQuantity;
                                return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: item==null?categoryTabItem[index].price.toString():itemPrice.toString()),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        resturantProviders.decreaseListQuantity(categoryTabItem[index].id,item==null?"1":item['quantity']!,userId,categoryTabItem[index].rate.toString());
                                          resturantProviders.decreaseCartItem(userId, categoryTabItem[index].id,item==null?"1":item['quantity']!+1.toString());
                                      },
                                      icon: appIcon(
                                        icon: Icons.remove,
                                        backGroundcolor: Colors.white,
                                      ),
                                    ),
                                    
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: BigText(text: item==null?"1":item['quantity'].toString())),
                                    IconButton(
                                      onPressed: (){
                                        resturantProviders.updateItem("1", categoryTabItem[index].rate.toString(), userId, categoryTabItem[index].id);
                                        resturantProviders.increaseQuantity(resturantProviders.quantity, categoryTabItem[index].rate);
                                          resturantProviders.addCartItem(userId,item==null?"1":item['quantity'].toString(),categoryTabItem[index].id );
                                      },
                                      icon: appIcon(
                                        icon: Icons.add,
                                        backGroundcolor: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                            },),
                            
                          ],
                        )
                      );
                      }
                      return Container();
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
