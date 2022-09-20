import 'dart:convert';
import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DisplayItem extends StatefulWidget {
final String ImageUrl;
final String NameItem;
final String HoursItem;
final String DesItem;
final String PriceItem;
final String RetingItem;
final int Pageid;
final String CommentItem;
final String CommentUser;

const DisplayItem({
  required this.ImageUrl,
  required this.NameItem,
  required this.HoursItem,
  required this.DesItem,
  required this.PriceItem,
  required this.RetingItem,
  required this.Pageid,
  required this.CommentItem,
  required this.CommentUser
});

@override
State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
Future getDateStoreItem() async{
  var url=Uri.parse("http://localhost:4000/Store_Items/${widget.Pageid}");
  Response response= await get(url);
  String body =response.body;
  List<dynamic> list1=json.decode(body);
  print(url);
  for (int i=0; i<list1.length; i++){
    setState(() {
      StoreItemName.add(list1[i]["Name"]);
      StoreItemImage.add(list1[i]["Image_url"]);
      StoreItemPrice.add(list1[i]["Price"]);
      StoreItemTagline.add(list1[i]["Tagline"]);
    });
  }
}
@override
void initState() {
  super.initState();
  StoreItemName.clear();
  StoreItemImage.clear();
  StoreItemPrice.clear();
  StoreItemTagline.clear();

  getDateStoreItem();
}
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.NameItem,style:
      TextStyle(
        color: Colors.black,
        fontFamily: "Cario",
        fontSize: 20,
      ),
      ),
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: 10,
          width: 20,
          color: Colors.white,
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
    ),
    body: ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.ImageUrl))
              ),

            ),
            Positioned(
              right: 20,
              bottom: -25,
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xfffefffd),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0,top: 5),
                        child: Text(widget.HoursItem,
                          style:
                          TextStyle(
                            color: Colors.black,
                            fontFamily: "Cario",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0,top: 0),
                        child: Text("دقائق",
                          style:
                          TextStyle(
                            color: Color(0xff797979),
                            fontFamily: "Cario",
                            fontSize: 10,
                          ),
                        ),
                      ),

                    ],
                  )
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.NameItem,style:
              TextStyle(
                color: Colors.black,
                fontFamily: "Cario",
                fontSize: 20,
              ),
              ),

              Text(widget.DesItem,style:
              TextStyle(
                fontFamily: "Cario",
                fontSize: 15,
                color: Color(0xff797979),
              ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [

                  Padding(padding: EdgeInsets.only(right: 10,left: 10),
                    child:  Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff7e8e3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("خصم 20%",style: TextStyle(
                                color: Color(0xffcb8f6f),
                                fontFamily: "Cario",
                              ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.monetization_on,color: Color(0xffcb8f6f),),
                          ),

                        ],
                      ),

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10,left: 10),
                    child:  Container(
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffe9f1fc),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("اكسب نقاط",style: TextStyle(
                                color: Color(0xff6da7d3),
                                fontFamily: "Cario",
                              ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.whatshot,color: Color(0xff6da7d3),),
                          ),

                        ],
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.RetingItem,style:
                  TextStyle(
                    fontFamily: "Cario",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_rate,color: Colors.green),
                            Icon(Icons.star_rate,color: Colors.green),
                            Icon(Icons.star_rate,color: Colors.green),
                            Icon(Icons.star_rate,color: Colors.green),
                            Icon(Icons.star_rate,color: Color(0xffe6e7e9),),
                          ],
                        ),
                        Text("متركز علئ الافضل",style:
                        TextStyle(
                          fontFamily: "Cario",
                          fontSize: 15,
                          color: Color(0xff797979),
                        ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200,top: 15),
                    child: Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff797979),

              ),
              Row(
                children: [
                  Text("data"),
                  Icon(Icons.star_rate,color: Colors.green),
                  Icon(Icons.star_rate,color: Colors.green),
                  Icon(Icons.star_rate,color: Colors.green),
                  Icon(Icons.star_rate,color: Color(0xffe6e7e9)),
                  Icon(Icons.star_rate,color: Color(0xffe6e7e9),),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(widget.CommentUser,
                    overflow: TextOverflow.clip,
                    style:
                    TextStyle(
                      height:2,
                      fontFamily: "Cario",
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 15,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffeeeded),

              ),

Padding(
padding: EdgeInsets.only(left: 10),
child:  Text("شائع",style:
TextStyle(
  fontFamily: "Cario",
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Color(0xff000000),
),
),
),

              Container(
                height: MediaQuery.of(context).size.height - 220,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: StoreItemName.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                        height: 110,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayItem(CommentItem: "Hoka", RetingItem: RatingStore[index], HoursItem: "${MinStore[index]} - ${MixStore[index]} ", PriceItem: PriceItem[index], ImageUrl: ImageStore[index], Pageid: Storeid[index], NameItem: NameArabicStore[index], DesItem: TaglineArabicStore[index], CommentUser: TaglineArabicStore[index],)));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                          height: 100,
                                          width: MediaQuery.of(context).size.width - 250 ,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image:
                                              DecorationImage(fit: BoxFit.cover, image: NetworkImage(StoreItemImage[index]))),
                                        ),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(right: 5),
                                     child: Text(StoreItemName[index],style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "Cario",
                                     ),
                                     ),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(left: 10,right: 10),
                                     child: Container(
                                       height: 70,
                                       width: 200,
                                       child: Text(StoreItemTagline[index],
                                         overflow: TextOverflow.clip,
                                         style: TextStyle(
                                           height:2,
                                           fontFamily: "Cario",
                                           fontSize: 15,
                                           color: Colors.black,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),


                                ],
                              ),

                            ),

                          ],
                        ),

                      );

                    }
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