import 'package:fb_clone/pages/food/updateDeliveryAddress.dart';
import 'package:fb_clone/util/bigText.dart';
import 'package:fb_clone/util/smallText.dart';
import 'package:flutter/material.dart';
class deliveryAddress extends StatefulWidget {
  const deliveryAddress({super.key});

  @override
  State<deliveryAddress> createState() => _deliveryAddressState();
}

class _deliveryAddressState extends State<deliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 25, 123, 29),
        title: BigText(text: "Delivery address",color: Colors.white,),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child:Card(
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Color.fromARGB(255, 25, 123, 29),
              width: 2,
            )
          ),
          child: Container(
            height: 80,
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                smallText(text: "Govindamarga,Dharan 15",size: 16,),
                Container(
                  // height: 80,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(5))
                          ),
                          child: Icon(Icons.delete,color: Colors.white,),
                        ),
                      ),
                        InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>updateDeliveryAddress()));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(5))
                          ),
                          child: Icon(Icons.edit,color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  
  }
}