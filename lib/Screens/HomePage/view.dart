import 'dart:convert';

import 'package:Toters/Screens/Restaurants/Restaurants.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:Toters/Screens/TotersViewItem/TotersViewItem.dart';
import 'package:http/http.dart';


List<String> FirstItemTable = [];

class HomePage extends StatefulWidget {
// const HomePage({Key? key}) : super(key: key);

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<String> listImages = [
'assets/images/GdbwIuahIVVrli21.jpg',
'assets/images/yLAaBYVyF2Hqf2Fh.jpeg',
'assets/images/RvqSHatXxjCrRg0O.png',

];

Future getDateTwoItem() async{

var url=Uri.parse("http://localhost:4000/FirstItemNew/1");
Response response= await get(url);
String body =response.body;
List<dynamic> list1=json.decode(body);
for (int i=0; i<list1.length; i++){
setState(() {
ListBarOneImageUrl.add(list1[i]["image_url"]);
ListBarOneName.add(list1[i]["Text_Item"]);
ItemPageBar.add(list1[i]["ItemPage"]);
PageidBar.add(list1[i]["id"]);

});
}
}
Future getDateDownItem() async{
var url=Uri.parse("http://localhost:4000/FirstItemNew/2");
Response response= await get(url);
String body =response.body;
List<dynamic> list1=json.decode(body);
for (int i=0; i<list1.length; i++){
setState(() {
DownBarImageUrl.add(list1[i]["image_url"]);
DownBarOneName.add(list1[i]["Text_Item"]);
DownItemPageBar.add(list1[i]["ItemPage"]);
PageidDownBar.add(list1[i]["id"]);

});
}
}
Future getDateUnderListItem() async{
  var url=Uri.parse("http://localhost:4000/HomePage_Dinner/3");
  Response response= await get(url);
  String body =response.body;
  List<dynamic> list1=json.decode(body);
  for (int i=0; i<list1.length; i++){
    setState(() {
      NamearUnderBar.add(list1[i]["Name_ar"]);
      ImageUnderBar.add(list1[i]["Image_url"]);
      RatingUnderBar.add(list1[i]["Rating"]);
      MinUnderBar.add(list1[i]["Min"]);
      MixUnderBar.add(list1[i]["Max"]);
    });
  }
}
Future getDateStoresItem() async{
  var url=Uri.parse("http://localhost:4000/Stores");
  Response response= await get(url);
  String body =response.body;
  List<dynamic> list1=json.decode(body);
  for (int i=0; i<list1.length; i++){
    setState(() {
      NameArabicStore.add(list1[i]["Name_ar"]);
      ImageStore.add(list1[i]["Image_url"]);
      MinStore.add(list1[i]["Min"]);
      MixStore.add(list1[i]["Max"]);
    });
  }
}
Future getDateDinnerItem() async{
  var url=Uri.parse("http://localhost:4000/HomePage_Dinner/1");
  Response response= await get(url);
  String body =response.body;
  List<dynamic> list1=json.decode(body);
  for (int i=0; i<list1.length; i++){
    setState(() {

      NamearDinner.add(list1[i]["Name_ar"]);
      NameEnDinner.add(list1[i]["Name_en"]);
      ImageDinner.add(list1[i]["Image_url"]);
      RatingDinner.add(list1[i]["Rating"]);
      MinDinner.add(list1[i]["Min"]);
      MixDinner.add(list1[i]["Max"]);
    });
  }
}
Future getDateNewItem() async{
  var url=Uri.parse("http://localhost:4000/HomePage_Dinner/2");
  Response response= await get(url);
  String body =response.body;
  List<dynamic> list1=json.decode(body);
  for (int i=0; i<list1.length; i++){
    setState(() {
      NamearNew.add(list1[i]["Name_ar"]);
      NameEnNew.add(list1[i]["Name_en"]);
      ImageNew.add(list1[i]["Image_url"]);
      RatingNew.add(list1[i]["Rating"]);
      MinNew.add(list1[i]["Min"]);
      MixNew.add(list1[i]["Max"]);
    });
  }
}

@override
void initState(){
super.initState();
getDateTwoItem();
getDateDownItem();
getDateStoresItem();
getDateDinnerItem();
getDateNewItem();
getDateUnderListItem();
}
Widget build(BuildContext context) {
return Scaffold(

appBar: AppBar(

actions: [
Column(
children: [
Padding(padding: EdgeInsets.only(left: 20),
child:   Text(" توصيل الئ ",
style: TextStyle(
color: Colors.black,
fontSize: 15,
fontWeight: FontWeight.bold,
fontFamily: "Cario",
),
),
),
Row(
children: [
Icon(Icons.arrow_drop_down,color: Colors.black,),
Text("العراق بغداد ",
style: TextStyle(
color: Colors.black,
fontSize: 15,
fontWeight: FontWeight.bold,
fontFamily: "Cario",
),

),
],
),
],
),
],
backgroundColor: Colors.white,
leading: Icon(Icons.tune,color: Colors.green,),
),

body: ListView(
children: [
Padding(padding: EdgeInsets.only(top: 10,right: 10),
child: Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [

Text("سجل الدخول باستخدام تطبيق توترز واستمتع بمزايا حرصية",
style: TextStyle(
color: Colors.black,
fontSize: 12,
fontWeight: FontWeight.bold,
fontFamily: "Cario",
),
),
Icon(Icons.login,color: ColorApp,size: 25,),
],
),
),
Padding(
padding: const EdgeInsets.only(top: 10),
child: CarouselImages(
scaleFactor: 0.7,
listImages: listImages,
height: 250.0,
borderRadius: 5.0,
cachedNetworkImage: false,
verticalAlignment: Alignment.bottomCenter,
onTap: (index) {
print('Tapped on page $index');
},
),
),
Container(
height: 250,
width: MediaQuery.of(context).size.width,
color: Colors.white,
child: Column(
children: [
Padding(padding: EdgeInsets.only(top: 20),
child:  Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [

Container(
height: 100,
width: MediaQuery.of(context).size.width,
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: 2,
itemBuilder: (BuildContext ctxt, int index) {
return GestureDetector(
onTap: () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RestaurantsPage(NamePage: ItemPageBar[index], TitlePage: ListBarOneName[index], Pageid: PageidBar[index])));
},
child:  Padding(
padding: EdgeInsets.only(left: 20),
child: ListItemFist(ListBarOneImageUrl[index],ListBarOneName[index]),
),
);

}
),
),
],
),
),

Padding(padding: EdgeInsets.only(top: 20),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(
// DownBarImageUrl
// DownBarOneName
height: 100,
width: MediaQuery.of(context).size.width,
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: 3,
itemBuilder: (BuildContext ctxt, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RestaurantsPage(NamePage: DownItemPageBar[index], TitlePage: DownBarOneName[index], Pageid: PageidDownBar[index])));
    },
    child:  Padding(
      padding: const EdgeInsets.only(left: 30),
      child: ListItemLast(DownBarImageUrl[index],DownBarOneName[index]),
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
),
SizedBox(height: 10,child: Container(
  height: 3,
  color: Color(0xfff6f6f9),
),
),

  Column(
children: [
  SizedBox(height: 10),
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: Icon(Icons.arrow_back_ios,color: Colors.green,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10),
            child: Text("خصومات العشاء",style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Cario",
            ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5,right: 25),
            child: Text("احصل علئ خصم 50% علئ مطاعم هذا الاسبوع",style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: "Cario",
            ),
            ),
          ),
        ],
      ),
    ],
  ),
  Container(
    height: 320,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 220,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: NamearDinner.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width - 100 ,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
//Navigator.push(context, MaterialPageRoute(builder: (context)=> TotersViewItem(CommentItem: CommentItem, RetingItem: RetingItem, HoursItem: HoursItem, PriceItem: PriceItem, ImageUrl: url, StatItem: StatItem, SaveItem: SaveItem, NameItem: ItemName, DesItem: DesItem, CommentUser: CommentUser,)));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 10, left: 10,top: 10),
                                  child: Container(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width - 100 ,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image:
                                        DecorationImage(fit: BoxFit.cover, image: NetworkImage(ImageDinner[index]))),
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
                                              Text("${MinDinner[index]} - ${MixDinner[index]} ",style: TextStyle(
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
                                  Text(NamearDinner[index],style: TextStyle(
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
                                          child: Text(RatingDinner[index]),
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
],
),
  Column(
    children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Icon(Icons.arrow_back_ios,color: Colors.green,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,top: 10),
                child: Text("جديد علئ توترز",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cario",
                ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5,right: 25),
                child: Text("جرب المطاعم الجديدة المميزة مع مجموعة وجبات رائعة!",style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Cario",
                ),
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 220,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width - 100 ,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
//Navigator.push(context, MaterialPageRoute(builder: (context)=> TotersViewItem(CommentItem: CommentItem, RetingItem: RetingItem, HoursItem: HoursItem, PriceItem: PriceItem, ImageUrl: url, StatItem: StatItem, SaveItem: SaveItem, NameItem: ItemName, DesItem: DesItem, CommentUser: CommentUser,)));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(padding: EdgeInsets.only(right: 10, left: 10,top: 10),
                                      child: Container(
                                        height: 200,
                                        width: MediaQuery.of(context).size.width - 100 ,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image:
                                            DecorationImage(fit: BoxFit.cover, image: NetworkImage(ImageNew[index]))),
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
                                                  Text("${MinNew[index]} - ${MixNew[index]} ",style: TextStyle(
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
                                      Text(NamearNew[index],style: TextStyle(
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
                                              child: Text(RatingNew[index]),
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
    ],
  ),
  Column(
    children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Icon(Icons.arrow_back_ios,color: Colors.green,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,top: 10),
                child: Text("الافضل لك",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cario",
                ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5,right: 25),
                child: Text("جرب المطاعم الجديدة المميزة مع مجموعة وجبات رائعة!",style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Cario",
                ),
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 220,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                // ListView.builder Axis.vertical
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width - 100 ,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
//Navigator.push(context, MaterialPageRoute(builder: (context)=> TotersViewItem(CommentItem: CommentItem, RetingItem: RetingItem, HoursItem: HoursItem, PriceItem: PriceItem, ImageUrl: url, StatItem: StatItem, SaveItem: SaveItem, NameItem: ItemName, DesItem: DesItem, CommentUser: CommentUser,)));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(padding: EdgeInsets.only(right: 10, left: 10,top: 10),
                                      child: Container(
                                        height: 200,
                                        width: MediaQuery.of(context).size.width  ,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image:
                                            DecorationImage(fit: BoxFit.cover, image: NetworkImage(ImageUnderBar[index]))),
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
                                                  Text("${MinUnderBar[index]} - ${MixUnderBar[index]} ",style: TextStyle(
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
                                      Text(NamearUnderBar[index],style: TextStyle(
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
                                              child: Text(RatingUnderBar[index]),
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
    ],
  ),
],
),
);
}
Container ListItemFist(String ImageItem, String NameItem){
return Container(
height: 100,
width: 180,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10),
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
Image.network(ImageItem,
width: 100,
height: 70,
),
Text(NameItem,
style: TextStyle(
color: Colors.black,
fontSize: 15,
fontWeight: FontWeight.bold,
fontFamily: "Cario",
),
),
],
),
);
}
Container ListItemLast(String ImageItem, String NameItem){
return Container(
height: 100,
width: 100,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10),
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
Image.network(ImageItem,
width: 100,
height: 60,
),
Text(NameItem,
style: TextStyle(
color: Colors.black,
fontSize: 15,
fontWeight: FontWeight.bold,
fontFamily: "Cario",
),
),
],
),
);
}
}