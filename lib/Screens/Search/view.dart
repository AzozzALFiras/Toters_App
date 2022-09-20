import 'dart:convert';

import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future getDateStoreItem() async{
    var url=Uri.parse("http://localhost:4000/Searchs");
    Response response= await get(url);
    String body =response.body;
    List<dynamic> list1=json.decode(body);
    print(url);
    for (int i=0; i<list1.length; i++){
      setState(() {
        SearchImage.add(list1[i]["image_url"]);
        SearchName.add(list1[i]["Name"]);
        SearchTagline.add(list1[i]["Tagline"]);
        SearchCounts_Stores.add(list1[i]["Counts_Stores"]);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getDateStoreItem();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'البحث عن متجر او صنف',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [

          Container(
            height: MediaQuery.of(context).size.height - 220,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: StoreItemName.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                    height: 170,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayItem(CommentItem: "Hoka", RetingItem: RatingStore[index], HoursItem: "${MinStore[index]} - ${MixStore[index]} ", PriceItem: PriceItem[index], ImageUrl: ImageStore[index], Pageid: Storeid[index], NameItem: NameArabicStore[index], DesItem: TaglineArabicStore[index], CommentUser: TaglineArabicStore[index],)));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width - 220 ,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:
                                    DecorationImage(fit: BoxFit.cover, image: NetworkImage(SearchImage[index]))),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(SearchName[index],style: TextStyle(
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
                                      child: Text(SearchTagline[index],
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Text("${SearchCounts_Stores[index]} متجر",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        height:2,
                                        fontFamily: "Cario",
                                        fontSize: 20,
                                        color: ColorApp,
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
    );
  }
  Container order(){
    return   Container(
      height: MediaQuery.of(context).size.width*0.3,
      color: Color(0xff00B491),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 15),
        child: Stack(
          children:[
            Image.asset("images/Capture.PNG",),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 85,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Anything!",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New on Toters! IF it fits on a",style: TextStyle(color: Colors.white,fontSize: 15),),
                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 20,),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("motorbike we can deliver it.",style: TextStyle(color: Colors.white,fontSize: 15,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Column mun (){
    return   Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,left: 15),
          child: Row(
            children: [
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg59C5w9lEvUcKqz1j3A0lwy1Lic_hSgPfz1IiL68UHN-zNnCAEcD8LN9ec7_TZp-adFY&usqp=CAU",height: 115,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Happy Hour",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                    SizedBox(height: 10,),
                    Text("Get happy with up to 50%",style: TextStyle(color: Colors.grey,),),
                    Text("OFF from select bef...",style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                    Text("28 Stores",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}