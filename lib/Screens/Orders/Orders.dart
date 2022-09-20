import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:flutter/material.dart';


class Orders extends StatefulWidget {

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
         // elevation: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xFF50b592),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("طلبات سابقة",style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cario",
                  ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("الطلبات القادمة",style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cario",
                  ),
                  ),
                ),
              ),

            ],
          ),
        ),
        body: TabBarView(
          children:[
            Center(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Image(
                    image: NetworkImage(
                        "https://github.com/AzozzALFiras/Talabatey_Flutter/blob/main/asset/images/IMG_7727830186FB-1.jpeg?raw=true"),
                    height: 300,
                  ),
                  Text("لاتوجد طلبات سابقة",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      height:2,
                      fontFamily: "Cario",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorApp,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Image(
                    image: NetworkImage(
                        "https://github.com/AzozzALFiras/Talabatey_Flutter/blob/main/asset/images/IMG_7727830186FB-1.jpeg?raw=true"),
                    height: 300,
                  ),
                  Text("لاتوجد طلبات قادمة",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      height:2,
                      fontFamily: "Cario",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorApp,
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );

  }
}