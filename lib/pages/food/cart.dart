import 'dart:isolate';
import 'dart:ui';

import 'package:fb_clone/provider/profile_handler.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:fb_clone/util/appIcon.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class myCart extends StatefulWidget {
  const myCart({super.key});

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  @override
  late String userId;
  
      void downloadFile()async{
   final status=await Permission.storage.request();
   if(status.isGranted){
    final baseStorage=await getExternalStorageDirectory();
    final id=await FlutterDownloader.enqueue(url: "https://static.videezy.com/system/resources/previews/000/006/879/original/Lab38.mp4", savedDir: baseStorage!.path,fileName: "download filoe",openFileFromNotification: true);
   }
   else{
    print("no permissionis given");
   }
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = Provider.of<profileProvider>(context, listen: false).user[0].id;
    Provider.of<resturantProvider>(context, listen: false).getCardItem(userId);
     ReceivePort receivePort=ReceivePort();
  int p=0;
    IsolateNameServer.registerPortWithName(receivePort.sendPort, "download");
    receivePort.listen((message) { 
      setState(() {
        p=message.progress;
      });
    });
    FlutterDownloader.registerCallback(downloadCallBack);
  }
 
static downloadCallBack(id,status,progress){
SendPort? sendPort=IsolateNameServer.lookupPortByName("download");
sendPort?.send(progress);
}
  @override
  Widget build(BuildContext context) {
    final cartProviders =
        Provider.of<resturantProvider>(context, listen: false);
     
  
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        title: smallText(
          text: "My Cart",
          size: 16,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Column(
            children: [
              Consumer<resturantProvider>(builder: (context, value, child) {
                if (value.cartItems == null) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, i) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          cartProviders.cartItems[i].image),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    smallText(
                                      text: cartProviders.cartItems[i].name,
                                      size: 18,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          child: appIcon(
                                            icon: Icons.remove,
                                            color: Colors.black,
                                            backGroundcolor: Colors.white,
                                          ),
                                          onTap: () {},
                                        ),
                                        Container(
                                          width: 30,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[350],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(cartProviders
                                                  .cartItems[i].quantity
                                                  .toString())),
                                        ),
                                        InkWell(
                                          child: appIcon(
                                              icon: Icons.remove,
                                              color: Colors.black,
                                              backGroundcolor: Colors.white),
                                          onTap: () {},
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Container(
                                                  // height: 50,
                                                  // color: Colors.grey,
                                                  child: BigText(
                                                      text: cartProviders
                                                          .cartItems[i].name),
                                                ),
                                                icon: Icon(
                                                  Icons.error,
                                                  color: Colors.blue,
                                                  size: 30,
                                                ),
                                                content: Container(
                                                  height: 100,
                                                  child: Column(
                                                    children: [
                                                      smallText(
                                                        text:
                                                            "Remove From Cart",
                                                        size: 16,
                                                      ),
                                                      smallText(
                                                        text:
                                                            "Are you sure want to remove this item from cart?",
                                                        size: 15,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: smallText(
                                                          text: "Cancel")),
                                                  TextButton(
                                                    onPressed: () {
                                                      cartProviders
                                                          .deleteCartItem(
                                                              cartProviders
                                                                  .cartItems[i]
                                                                  .id);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .green)),
                                                  )
                                                ],
                                              ));
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  BigText(
                                    text: cartProviders.cartItems[i].rate.toString(),
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      });
                      
                }
              }),
              Consumer<resturantProvider>(builder: (context,value,child){
                if(value.cartItems==null){
                  return Container();
                }
                else{
                  double totalAmmount=0;
                  for(int i=0;i<value.cartItems.length;i++){
                    totalAmmount+=value.cartItems[i].rate*value.cartItems[i].quantity;
                  }
                  return  Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black38))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: customField(
                              "Total item",
                              cartProviders.cartItems.length.toString(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: customField(
                              "Sub total",
                              "Rs. $totalAmmount",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: customField(
                              "Discount",
                              "0.00",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20,top: 10),
                      child: customField("Total","Rs. $totalAmmount"), 
                    )
                  ],
                ),
              );
                }
              }),
             TextButton(child: Text("download image"),onPressed: (){
                downloadFile();
             },),
              ElevatedButton(onPressed: (){

              }, child: Text("CHECKOUT",style: TextStyle(fontFamily: "Roboto",fontSize: 18,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 25, 123, 29),
                minimumSize: Size.fromHeight(50)
              ),
              ),
              TextButton(onPressed: (){

              }, child: Text("sliding panel"))
            ],
          ),
        ),
      ),
    );
  }

  Widget customField(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,style: TextStyle(fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.w500),),
        // smallText(text: text1,size: 16,),
        BigText(text: text2)
      ],
    );
  }
}
