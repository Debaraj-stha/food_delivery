import 'package:fb_clone/pages/food/single_item_page.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:fb_clone/util/tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class category extends StatefulWidget {
  const category({super.key,this.subCategory});
final subCategory;
  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category>with SingleTickerProviderStateMixin {
  late TabController _controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length: 2, vsync: this,initialIndex: 0);
    Provider.of<resturantProvider>(context,listen: false).fetchSubCategory(widget.subCategory);
    // print(widget.subCategory);
    Provider.of<resturantProvider>(context,listen: false).resetItems();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
        body:Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50,left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Search"),
                      smallText(text: "Ordered by Nearby first",size: 16,)
                    ],
                  ),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:  appIcon(icon: Icons.close,backGroundcolor: Colors.white,size: 30,))
                 
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Color.fromARGB(255, 25, 123, 29),width: 1)
                ),
                child: TextFormField(
                  
                  cursorColor: Color.fromARGB(255, 25, 123, 29),
                  decoration: InputDecoration(
                    
                    contentPadding: EdgeInsets.all(5),
                    border: InputBorder.none,
                  hintText: "Search",
                    prefix: Icon(Icons.search,color: Color.fromARGB(255, 25, 123, 29),),
                  
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 80,
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 25, 123, 29),
                      controller: _controller,
                      splashBorderRadius: BorderRadius.circular(10),
                      overlayColor:MaterialStateProperty.all<Color>(Colors.transparent),
                tabs:[
                  Tab(
                    child: tab(text: "Products",index: 0, conIn: _controller.index),
              ),
                  Tab(
                    child:tab(text: "Resturants", index: 1, conIn: _controller.index))
              ]),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [
                    products(),
                    products()
                ],
              ),
            )
           
          ],
        )
    );
  }
  Widget products(){
    final provider=Provider.of<resturantProvider>(context,listen: false);
    return  SingleChildScrollView(
     child: Consumer<resturantProvider>(builder:(context, value, child) {
      if(value.subcategory==null){
        return CircularProgressIndicator();
      }
      else{
        // print(provider.subcategory);
        return Container(
          // color: Colors.red,
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:provider.subcategory.length ,
          itemBuilder: (context,i){
              return InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>singleItemPage(items:provider.subcategory[i])));
                },
                child: Container(
                  height: 100,
                  
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    border: Border.all(color: Color.fromARGB(255, 17, 17, 17),width: 1),borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(provider.subcategory[i].image),fit: BoxFit.contain)
                        ),
                      ),
                      SizedBox(width: 4,),
                      Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              BigText(text: provider.subcategory[i].name),
                             Container(
                              width: MediaQuery.of(context).size.width-200,
                              child: Text(provider.subcategory[i].description,overflow: TextOverflow.ellipsis,maxLines: 2,)),
                        ],
                      ),
                      Spacer(),
                      BigText(text: provider.subcategory[i].rate.toString())
                    ],
                  ),
                ),
              );
          }),
        );
      }
      },)
     
    );
  }
}