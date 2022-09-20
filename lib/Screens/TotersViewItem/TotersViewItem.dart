import 'package:flutter/material.dart';

class TotersViewItem extends StatefulWidget {
  final String ImageUrl;
  final String NameItem;
  final String HoursItem;
  final String DesItem;
  final String SaveItem;
  final String PriceItem;
  final String RetingItem;
  final String StatItem;
  final String CommentItem;
  final String CommentUser;

  const TotersViewItem({
   required this.ImageUrl,
    required this.NameItem,
    required this.HoursItem,
    required this.DesItem,
    required this.SaveItem,
    required this.PriceItem,
    required this.RetingItem,
    required this.StatItem,
    required this.CommentItem,
    required this.CommentUser
  });

  @override
  State<TotersViewItem> createState() => _TotersViewItemState();
}

class _TotersViewItemState extends State<TotersViewItem> {
  @override
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
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.ImageUrl))
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
                          child: Text("Mins",
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
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff7e8e3),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(widget.PriceItem,style: TextStyle(
                                  color: Color(0xffcb8f6f),
                                  fontFamily: "Cario",
                                ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.monetization_on,color: Color(0xffcb8f6f),),
                            ),

                          ],
                        ),

                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10,left: 10),
                      child:  Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffe9f1fc),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(widget.RetingItem,style: TextStyle(
                                  color: Color(0xff6da7d3),
                                  fontFamily: "Cario",
                                ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.whatshot,color: Color(0xff6da7d3),),
                            ),

                          ],
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.SaveItem,style:
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
                          Text(widget.StatItem,style:
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
                      padding: const EdgeInsets.only(left: 120,top: 15),
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(widget.CommentUser,style:
                    TextStyle(
                      fontFamily: "Cario",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                    Icon(Icons.star_rate,color: Colors.green),
                    Icon(Icons.star_rate,color: Colors.green),
                    Icon(Icons.star_rate,color: Colors.green),
                    Icon(Icons.star_rate,color: Color(0xffe6e7e9)),
                    Icon(Icons.star_rate,color: Color(0xffe6e7e9),),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.CommentItem,style:
                    TextStyle(
                      fontFamily: "Cario",
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff797979),
                    ),
                    ),
                    Text("اقرآ المزيد",style:
                    TextStyle(
                      fontFamily: "Cario",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    ),
                  ],
                )
              ],

            ),
          ),

        ],
      ),
    );
  }
}