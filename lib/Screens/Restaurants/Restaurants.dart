
import 'dart:convert';

import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:Toters/Screens/DisplayItem/DisplayItem.dart';
import 'package:Toters/Screens/TagsPage/view.dart';
import 'package:Toters/Screens/TotersViewItem/TotersViewItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class RestaurantsPage extends StatefulWidget {
final String TitlePage;
final String NamePage;
final int Pageid;


const RestaurantsPage({
required this.TitlePage,
required this.NamePage,
  required this.Pageid,

});



@override
State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {

Future getDateStoresItem() async{
var url=Uri.parse("http://localhost:4000/HomePage_Dinner/${widget.Pageid}");
Response response= await get(url);
String body =response.body;
List<dynamic> list1=json.decode(body);
print(url);
for (int i=0; i<list1.length; i++){
setState(() {
NameArabicStore.add(list1[i]["Name_ar"]);
ImageStore.add(list1[i]["Image_url"]);
RatingStore.add(list1[i]["Rating"]);
MinStore.add(list1[i]["Min"]);
MixStore.add(list1[i]["Max"]);
TaglineArabicStore.add(list1[i]["Tagline_ar"]);
PriceItem.add(list1[i]["Price"]);
Storeid.add(list1[i]["id"]);



});
}
}
Future getDateTagsItem() async{
  var url=Uri.parse("http://localhost:4000/Tags");
  Response response= await get(url);
  String body =response.body;
  List<dynamic> list1=json.decode(body);
  for (int i=0; i<list1.length; i++){
    setState(() {
      NameTags.add(list1[i]["Text_Tags"]);
      ImageTags.add(list1[i]["Image_Tags"]);
      IdTags.add(list1[i]["id"]);
    });
  }
}

@override
void initState(){
super.initState();
NameTags.clear();
ImageTags.clear();
IdTags.clear();
NameArabicStore.clear();
ImageStore.clear();
RatingStore.clear();
MinStore.clear();
MixStore.clear();
getDateStoresItem();
if(widget.NamePage == "RestaurantsPage") {
  getDateTagsItem();
}
}
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(widget.TitlePage,style:
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
body: Container(
height: MediaQuery.of(context).size.height,
width: MediaQuery.of(context).size.width,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30),
),
child: Column(
  children: [
    if(widget.NamePage == "RestaurantsPage")
    Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: NameTags.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              height: 350,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TagsPage(Pageid: IdTags[index], TitlePage: NameTags[index],)));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 80 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(ImageTags[index]),
                            ),
                          ),
                        ),
                        Text(NameTags[index],
                        style: TextStyle(
                          fontFamily: "Cario",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
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
    Container(
      height: MediaQuery.of(context).size.height - 220,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: NameArabicStore.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              height: 350,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayItem(CommentItem: "Hoka", RetingItem: RatingStore[index], HoursItem: "${MinStore[index]} - ${MixStore[index]} ", PriceItem: PriceItem[index], ImageUrl: ImageStore[index], Pageid: Storeid[index], NameItem: NameArabicStore[index], DesItem: TaglineArabicStore[index], CommentUser: TaglineArabicStore[index],)));
                    },

                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(padding: EdgeInsets.only(right: 10, left: 10,top: 10),
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width ,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:
                                    DecorationImage(fit: BoxFit.cover, image: NetworkImage(ImageStore[index]))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Padding(padding: EdgeInsets.only(top: 180,right: 25),
                                  child:  Container(
                                    height: 50,
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
                                    child: Padding(padding: EdgeInsets.only(left: 0,top: 0),
                                      child: Column(
                                        children: [
                                          Text("${MinStore[index]} - ${MixStore[index]} ",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Cario",
                                              fontSize: 15
                                          ),),
                                          Text("دقائق",
                                            style: TextStyle(
                                                color: Color(0xff818181),
                                                fontFamily: "Cario",
                                                fontSize: 10
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 30,
                              bottom: 180,
                              child: Row(
                                children: [
                                  Icon(Icons.favorite_border,color: Colors.white,size: 30,),

                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(NameArabicStore[index],style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cario",
                              ),
                              ),
                            ],
                          ),
                        ),

                        Padding(padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(right: 10),
                                child:  Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffe6f2fb),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text("اكسب نقاط",style: TextStyle(
                                            color: Color(0xff7ea8bd),
                                            fontFamily: "Cario",
                                          ),
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.playlist_add_outlined,color: Color(0xff7ea8bd),),

                                    ],
                                  ),

                                ),),
                              Container(
                                height: 30,
                                width: 50,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xfff6f6f9),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Text(RatingStore[index]),
                                    ),
                                    Icon(Icons.star_rate,color: Colors.green,),

                                  ],
                                ),

                              ),
                            ],
                          ),
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

);
}
}

