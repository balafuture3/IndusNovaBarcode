import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:packingvsdispatch/Screens/GatePassMismatch.dart';

import 'Packing.dart';
import 'Picking.dart';

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
                      height: height / 5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)))),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Dashboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          height: height -64,
                          width: width,
                          child: GridView.count(
                            crossAxisSpacing: width / 40,
                            mainAxisSpacing: height / 60,
                            crossAxisCount: 2,
                            children: <Widget>[
                              InkWell(
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
                                              "Box Packing",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    )),
                              ),
                              InkWell(
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
                                              "Box Picking",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    )),
                              ),
                              InkWell(
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
                                              "Gate Pass Mismatch",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    )),
                              ),
                            ],
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
