import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:packingvsdispatch/Screens/GatePassMismatch.dart';
import 'package:packingvsdispatch/Screens/LoginPage.dart';

import 'BoxPickandPlace.dart';
import 'BoxPickList.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawerEnableOpenDragGesture: false, // THIS WAY IT WILL NOT OPEN
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          child: SafeArea(
            child: Container(
              color: Colors.white,
              height: height,
              width: width,
              child: Stack(
                children: [
                  Container(
                      height: height / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)))),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                              IconButton(icon: Icon(Icons.logout,color: Colors.white,), onPressed:(){
                                LoginScreenState.emailController.text="";
                                LoginScreenState.passwordController.text="";
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false,
                                );

                              } ),

                            ],
                          ),
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("logo.png",height: height/9,),
                          ],
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Indus ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                              Text(
                                "Nova ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                              Text(
                                "Packaging",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                            ],),
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: height-height/3,
                            width: width,
                            child: GridView.count(
                              crossAxisSpacing: width / 40,
                              mainAxisSpacing: height / 60,
                              crossAxisCount: 2,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Packing()),
                                    );
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      elevation: 8,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("packing.jpeg",
                                              height: height / 8,
                                              width: double.infinity),
                                          SizedBox(
                                            height: height / 40,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(3),
                                              width: double.infinity,
                                              color: Colors.deepOrange,
                                              child: Text(
                                                "Box Pick and Place",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Picking()),
                                    );
                                  },
                                  child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("picking.jpg",
                                              height: height / 8,
                                              width: double.infinity),
                                          SizedBox(
                                            height: height / 40,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(3),
                                              width: double.infinity,
                                              color: Colors.teal,
                                              child: Text(
                                                "Box Pick List",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GatePassMismatch()));
                                  },
                                  child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("mismatch.jpeg",
                                              height: height / 8,
                                              width: double.infinity),
                                          SizedBox(
                                            height: height / 40,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(3),
                                              width: double.infinity,
                                              color: Colors.blue,
                                              child: Text(
                                                "Dispatch Scanning",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
