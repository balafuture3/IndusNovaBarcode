

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:packingvsdispatch/CommonFunctions/CommonFunctions.dart';
import 'package:packingvsdispatch/Screens/Dashboard.dart';
import 'package:packingvsdispatch/Screens/LoginPage.dart';
import 'package:packingvsdispatch/Model/PackageGetBOXDetailsResponse.dart';

import '../Model/BoxSaveResponse.dart';
class Packing extends StatefulWidget {
  @override
  PackingState createState() => PackingState();
}

class PackingState extends State<Packing> {
  bool loading=false;

  PackageGetBOXList li;

  bool datatablevisibility=false;

  BoxSaveResponseList li1;

  Future<http.Response> apicall() async {
    setState(() {
      loading = true;
    });
//     String username = 'mobileuser';
//     String password = 'sap@1234';
//     String basicAuth =
//         'Basic ' + base64Encode(utf8.encode('$username:$password'));
//     print(basicAuth);
// print(LoginScreenState.csrftoken);
    var url;

    // Map<String, String> headers = {
    //   "Accept": "application/json",
    //   'Authorization': basicAuth,
    //   // "x-csrf-token": LoginScreenState.csrftoken.toString(),
    //   // "Content-Type": "application/json",
    // };
    url = "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/getBoxDetails?box=${BarcodeController.text}";

    print(url);
    // print(headers);
    var response = await http.get(url,);


    print(response.body);

    if (response.statusCode == 200)
    {
      // datatablevisibility=true;
      // int timeInMillis = 1586348737122;
      // var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      // var formattedDate = DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(timeInMillis));
      // print("headers:  ${response.headers["x-csrf-token"]}");
      // print("headers:  ${response.headers["content-type"]}");
      // print("headers:  ${response.headers["sap-processing-info"]}");
      li = PackageGetBOXList.fromJson(json.decode(response.body));
      datatablevisibility=true;
      if (li.details[0].success=="X")
      {
        setState(() {
          loading = false;
        });
        print(li.details[0].boxnumber);
        datatablevisibility=true;
        RackScanController.text= li.details[0].grossweight.toString();
      }
      setState(() {
        loading = false;
      });

    } else {
      setState(() {
        loading = false;
      });
      print("Retry");
    }
    print("response: ${response.statusCode}");
    print("response: ${response.body}");
    return response;
  }

  Future<http.Response> saveapicall() async {
    setState(() {
      loading = true;
    });
     // CommonFunctionsState.loginapicall(LoginScreenState.emailController.text,LoginScreenState.passwordController.text).then((value) async {
     //  String username = 'mobileuser';
     //  String password = 'sap@1234';
     //  String basicAuth =
     //      'Basic ' + base64Encode(utf8.encode('$username:$password'));
     //  print(basicAuth);
     //  print(LoginScreenState.csrftoken);
      var url;

      // Map data = {
      //   "BoxNumber": "AG00011097",
      //   "Bin": "DUMMY",
      //   "GrossWeight": "20"
      // };
      // var body = json.encode(data);
      // print("body:$body");
      // Map<String, String> headers = {
      //   "Accept": "application/json",
      //   'Authorization': basicAuth,
      //   "x-csrf-token": LoginScreenState.csrftoken,
      //   "cookie":LoginScreenState.cookie,
      //   "Content-Type": "application/json",
      // };
      url =
      "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pack?box=${BarcodeController.text}&bin=${BinScanController.text}&grossweight=${RackScanController.text}&user=${LoginScreenState.emailController.text}";
    // http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pack?box=AG00011097&bin=DUMMY&grossweight=10&user=ADMIN

      var response = await http.get(url);
print(url);

      setState(() {
        loading = false;
      });
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
if(response.statusCode==200) {

  li1=BoxSaveResponseList.fromJson(json.decode(response.body));
  if (li1.details[0].success=="X") {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0),
            title: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      "logo.png",height:  MediaQuery.of(context).size.height/8,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Text(
                    "Indus Nova Packaging",
                    style: TextStyle(color: Colors.yellow,fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    li1.details[0].message.toString(),
                    style: TextStyle(color: Colors.white,fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                        child: TextButton(
                          child: Text('OK',style: TextStyle(color: Colors.white),textAlign: TextAlign.end,),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],

              ),
            ),

            // actions: <Widget>[
            //   TextButton(
            //     child: Text('OK'),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );

        });
  }
  else {
    showDialog(context: context, child: AlertDialog(
      content: Column(
        children: [

          Container(
            child: Text(li1.details[0].message),
          ),
        ],
      ),
    ));
  }
}
      return response;


  }
  String _scanBarcode;
  TextEditingController BarcodeController = new TextEditingController();
  TextEditingController RackScanController = new TextEditingController();
  TextEditingController BinScanController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Future<void> scanBarcodeNormal() async {
    //   String barcodeScanRes;
    //   // Platform messages may fail, so we use a try/catch PlatformException.
    //   try {
    //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
    //         "#ff6666", "Cancel", true, ScanMode.BARCODE);
    //     print(barcodeScanRes);
    //
    //     showDialog<void>(
    //       context: context,
    //       barrierDismissible: false, // user must tap button!
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text("BarCode Data : $barcodeScanRes"),
    //           actions: <Widget>[
    //             TextButton(
    //               child: Text('OK'),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //           ],
    //         );
    //       },
    //     );
    //   } on PlatformException {
    //     barcodeScanRes = 'Failed to get platform version.';
    //   }
    //
    //   // If the widget was removed from the tree while the asynchronous platform
    //   // message was in flight, we want to discard the reply rather than calling
    //   // setState to update our non-existent appearance.
    //   if (!mounted) return;
    //
    //   setState(() {
    //     _scanBarcode = barcodeScanRes;
    //   });
    // }

    return Scaffold(
      body:SafeArea(
        child: loading==false?SingleChildScrollView(
          child: Container(
              width: width,
              height: height,
              child:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new TextField(
                      onSubmitted: (value){
                        apicall();

                      },

                      controller: BarcodeController,
                      decoration: InputDecoration(
                        labelText: 'Package Slip Bar Code',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:16.0,right:16.0,bottom: 16.0),
                    child: new TextField(
                      controller: BinScanController,
                      decoration: InputDecoration(
                        labelText: 'Scan Bin',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:16.0,right:16.0,bottom: 16.0),
                    child: new TextField(
                      onSubmitted:(value) {
                        setState(() {
                          li.details[0].grossweight=RackScanController.text;
                        });

                      },
                      controller: RackScanController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Box Weight',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: datatablevisibility,
                    child:  li!=null?ExpansionTile(
                      initiallyExpanded: true,
                      title: Text("Package Details"),
                      children: [

                        li.details[0].success=="X"?
                        Container(
                          height:height/2,
                          child: ListView(


                              children: [

                                Row(

                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "QP Number:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].qpnumber.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Posting Date:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child:  Text(
                                            li.details[0].postingdate.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Pack No:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].packno.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Doc Date:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child:  Text(
                                            li.details[0].documentdate.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Box Number:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].boxnumber.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Plant:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].plant.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Material:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].material.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Material Description:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].materialname.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Old Material:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].oldmaterial.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Stock Seg:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].stocksegment.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Yield:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].yield.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                          ))
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Conf.Unit:",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right:24.0),
                                            child: Text(
                                              li.details[0].confunit.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:24.0,right:24,top:10,bottom: 10),
                                      child: Text(
                                        "Box Weight:",
                                        softWrap: true,
                                        style:   TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right:24.0),
                                              child: Text(
                                            li.details[0].grossweight.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w600),
                                              )  )
                                        ]),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                ),

                              ],
                            ),
                        ):Container(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("No Details Found"),
                          ),
                        )],
                    
                    ):Text("No Results"),
                      ),
                  SizedBox(height: height/30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: FlatButton(
                            onPressed: () {
                              if (BarcodeController.text.length !=0 &&
                                  BinScanController.text.length != 0 &&
                                  RackScanController.text.length != 0 )
                                saveapicall();
                              else {
                                if (BarcodeController.text.length == 0)
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                        Text("Bar code cannot be empty"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                else if (RackScanController.text.length == 0)
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Rack number cannot be empty"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                else if (BinScanController.text.length == 0)
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                        Text("Bin Cannot be empty"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );

                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: FlatButton(
                            onPressed: () {

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),

                ],
              )
          ),




    ):Center(child: CircularProgressIndicator()),
      ),
      appBar: AppBar(
        title:
            Text("Box Pick and Place"),
    ),
    );

  }
}
