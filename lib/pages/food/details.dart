import 'package:fb_clone/pages/food/buttonGroup.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:fb_clone/util/tab.dart';
import 'package:flutter/material.dart';
import 'package:fb_clone/model/appColors.dart';
import 'package:flutter/rendering.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
    _controller.addListener(handleTabIndex);
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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        title: Text("Resturant name"),
        centerTitle: true,
        actions: [
          // Stack(
          //   children: [
          //     Container(
          //       width: 50,
          //       child: appIcon(
          //         icon: Icons.shopping_cart,
          //         size: 50,
          //         backGroundcolor: Colors.white,
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.bottomLeft,
          //       child: Container(
          //           width: 30,
          //           height: 30,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             // borderRadius: BorderRadius.circular(40)
          //           ),
          //           child: Padding(
          //               padding: EdgeInsets.only(left: 20),
          //               child: BigText(
          //                 text: "0",
          //                 size: 18,
          //                 color: Colors.black,
          //               ))),
          //     )
          //   ],
          // ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                height: 80,
                child:
                    TabBar(isScrollable: true, controller: _controller, tabs: [
                  Tab(
                    child:
                        tab(text: "tab1", conIn: _controller.index, index: 0),
                  ),
                  Tab(
                    child:
                        tab(text: "tab2", conIn: _controller.index, index: 1),
                  ),
                  Tab(
                    child:
                        tab(text: "tab3", conIn: _controller.index, index: 2),
                  ),
                ]),
              ),
            ),
          ),
         
        
        // SliverToBoxAdapter(
        //      child: DefaultTabController(
        //       length: 3,
        //        child: Container(
        //         height: 600,
        //          child: TabBarView(
        //             controller: _controller,
        //             children: [
        //               SliverList(
        //                 delegate: SliverChildBuilderDelegate(
        //                   (context, index) {
        //                     return Text("");
        //                   },
        //                   childCount: 4,
        //                 ),
        //               ),
        //               SliverList(
        //                 delegate: SliverChildBuilderDelegate(
        //                   (context, index) {
        //                     return Text("");
        //                   },
        //                   childCount: 4,
        //                 ),
        //               ),
        //               SliverList(
        //                 delegate: SliverChildBuilderDelegate(
        //                   (context, index) {
        //                     return Text("");
        //                   },
        //                   childCount: 4,
        //                 ),
        //               ),
        //             ],
        //           ),
        //        ),
        //      ),
            
        //   ),
        SliverFillRemaining(
          child: TabBarView(
            controller: _controller,
            children: [
              RepaintBoundary(
                child: ListView.builder(
                    itemCount: 4,
                  itemBuilder: (context, index) {
                    return Text("$index");
                  },
                
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
