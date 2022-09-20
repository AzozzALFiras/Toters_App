import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
const Profile({Key? key}) : super(key: key);

@override
State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey.shade200,
appBar: AppBar(
elevation: 0,
backgroundColor: Colors.white,
actions: [
Padding(padding: EdgeInsets.only(right: 10,left: 20),
child:Icon(Icons.arrow_forward_ios,color: Colors.black54,),
),
],
title:Center(child:  Text("اعدادات الحساب",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),)
),
body: SingleChildScrollView(
child: Column(
children: [
Padding(
padding: const EdgeInsets.all(10.0),
child: Container(
height: MediaQuery.of(context).size.width,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10),
),
child: Padding(
padding: const EdgeInsets.only(right: 10,left: 10,top: 20),
child: Column(
children: [
Directionality(
textDirection: TextDirection.rtl,
child:  TextField(
decoration: InputDecoration(
border: OutlineInputBorder(),
labelText: 'اسم الاول',

),
)
),
SizedBox(height: 15,),
Directionality(
textDirection: TextDirection.rtl,
child:  TextField(
decoration: InputDecoration(
border: OutlineInputBorder(),
labelText: 'اسم العائله',

),
)
),
SizedBox(height: 10,),
Directionality(
textDirection: TextDirection.rtl,
child:  TextField(
decoration: InputDecoration(
border: OutlineInputBorder(),
labelText: 'اللقب',

),
)
),
SizedBox(height: 10,),
Directionality(
textDirection: TextDirection.rtl,
child:  TextField(
decoration: InputDecoration(
border: OutlineInputBorder(),
labelText: 'تاريخ الولادة',

),
)
),
SizedBox(height: 10,),

ElevatedButton(onPressed:(){}, child: Text("حفط",
  style:TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: "Cario"

),
),
style: ElevatedButton.styleFrom(elevation:2,
primary: ColorApp,
),
),
],
),
),
),
),
Padding(
padding: const EdgeInsets.all(10.0),
child: Container(
height: MediaQuery.of(context).size.width/2,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10),
),
child: Padding(
padding: const EdgeInsets.only(right: 15,left: 15,top: 15),
child: Column(
children: [
Directionality(
textDirection: TextDirection.rtl,
child:  TextFormField(
decoration: const InputDecoration(
border: UnderlineInputBorder(),
labelText: 'البريد الكتروني',
),
),
),
SizedBox(height: 10,),
Directionality(
textDirection: TextDirection.rtl,
child:  TextFormField(
decoration: const InputDecoration(
border: UnderlineInputBorder(),
labelText: 'رقم الهاتف',
),
),
),
],
),
),
),
),
Padding(
padding: const EdgeInsets.all(10.0),
child: Container(
height: MediaQuery.of(context).size.width/3,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10),
),
child: Padding(
padding: const EdgeInsets.only(right: 15,left: 15,top: 15),
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Text("تغير كلمة المرور",style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorApp,
    fontFamily: "Cario"

),
),
SizedBox(width: 10,),
Icon(Icons.lock,color: Colors.grey,),
],
),
SizedBox(height: 10,),
Container(
height: 1,
color: Colors.grey,
),
SizedBox(height: 10,),
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Padding(
padding:  EdgeInsets.only(right: 30),
child: Text("حذف الحساب",
  style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: ColorApp,
fontFamily: "Cario"

),
),
),
SizedBox(width: 10,),
Icon(Icons.delete,color: Colors.grey,),
],
),
],
),
),
),
),
],
),
),
);
}
}