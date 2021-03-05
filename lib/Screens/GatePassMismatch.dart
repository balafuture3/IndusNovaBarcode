import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:packingvsdispatch/CommonFunctions/CommonFunctions.dart';
import 'package:packingvsdispatch/Screens/Dashboard.dart';
import 'package:packingvsdispatch/Screens/LoginPage.dart';
import 'package:packingvsdispatch/Model/PackageGetBOXDetailsResponse.dart';

import '../Model/BoxSaveResponse.dart';

class GatePassMismatch extends StatefulWidget {
  @override
  GatePassMismatchState createState() => GatePassMismatchState();
}

class GatePassMismatchState extends State<GatePassMismatch> {
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        GatePassController.text=barcodeScanRes;
      // showDialog<void>(
      //   context: context,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("BarCode Data : $barcodeScanRes"),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('OK'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  Future<void> scanBarcodeNormal1() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        InvoiceNumberController.text=barcodeScanRes;
      // showDialog<void>(
      //   context: context,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("BarCode Data : $barcodeScanRes"),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('OK'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  Future<void> scanBarcodeNormal2() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        InvoiceNumber2Controller.text=barcodeScanRes;
      // showDialog<void>(
      //   context: context,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("BarCode Data : $barcodeScanRes"),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('OK'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal3() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        PackingSlipController.text=barcodeScanRes;
      // showDialog<void>(
      //   context: context,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("BarCode Data : $barcodeScanRes"),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('OK'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal4() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        PackingListController.text=barcodeScanRes;
      // showDialog<void>(
      //   context: context,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("BarCode Data : $barcodeScanRes"),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('OK'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  Future<void> scanBarcodeNormal5() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        MaterialIdentificationController.text=barcodeScanRes;
      // showDialog<void>(
      //   context: context,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("BarCode Data : $barcodeScanRes"),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('OK'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  bool loading = false;

  PackageGetBOXList li;

  bool datatablevisibility = false;

  BoxSaveResponseList li1;

  var control1 = true;

  bool control2=true;

  bool control3=true;

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
    url =
        "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/getBoxDetails?box=${GatePassController.text}";

    print(url);
    // print(headers);
    var response = await http.get(
      url,
    );

    print(response.body);

    if (response.statusCode == 200) {
      datatablevisibility = true;
      // int timeInMillis = 1586348737122;
      // var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      // var formattedDate = DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(timeInMillis));
      // print("headers:  ${response.headers["x-csrf-token"]}");
      // print("headers:  ${response.headers["content-type"]}");
      // print("headers:  ${response.headers["sap-processing-info"]}");
      li = PackageGetBOXList.fromJson(json.decode(response.body));
      setState(() {
        loading = false;
      });
      print(li.details[0].boxnumber);
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
        "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pack?box=${GatePassController.text}&bin=${BinScanController.text}&grossweight=${InvoiceNumberController.text}&user=${LoginScreenState.emailController.text}";
    // http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pack?box=AG00011097&bin=DUMMY&grossweight=10&user=ADMIN

    var response = await http.get(url);
    print(url);

    setState(() {
      loading = false;
    });
    print("response: ${response.statusCode}");
    print("response: ${response.body}");
    if (response.statusCode == 200) {
      li1 = BoxSaveResponseList.fromJson(json.decode(response.body));
      if (li1.details[0].success == "X") {
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "logo.png",
                          height: MediaQuery.of(context).size.height / 8,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Indus Nova Packaging",
                        style: TextStyle(color: Colors.yellow, fontSize: 18),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        li1.details[0].message.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              child: Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.end,
                              ),
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
      } else {
        showDialog(
            context: context,
            child: AlertDialog(
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
  TextEditingController GatePassController = new TextEditingController();
  TextEditingController InvoiceNumberController = new TextEditingController();
  TextEditingController BinScanController = new TextEditingController();

  TextEditingController InvoiceNumber2Controller = new TextEditingController();
  TextEditingController PackingSlipController = new TextEditingController();
  TextEditingController PackingListController = new TextEditingController();
  TextEditingController MaterialIdentificationController = new TextEditingController();


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
      body: SafeArea(
        child: loading == false
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 50,
                    ),
                    Container(
                      color: Colors.white,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.blue,
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Gate pass vs Invoice number",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onDoubleTap: control1?scanBarcodeNormal:null,
                                child: new TextField(
                                  controller: GatePassController,
                                  enabled: control1,
                                  decoration: InputDecoration(
                                    labelText: 'Gate Pass',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, bottom: 16.0),
                              child: GestureDetector(
                                onDoubleTap: scanBarcodeNormal1,
                                child: new TextField(
                                  enabled: control1,
                                  onSubmitted: (value) {
                                    if (InvoiceNumberController.text ==
                                        GatePassController.text) {
                                      setState(() {
                                        control1 = false;
                                      });
                                    } else {
    setState(() {
      InvoiceNumberController.text = "";
      GatePassController.text = "";
    });
                                      showDialog<void>(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  Colors.white.withOpacity(0),
                                              title: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50),
                                                          topLeft:
                                                              Radius.circular(
                                                                  50),
                                                          topRight:
                                                              Radius.circular(
                                                                  50)),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets
                                                              .all(16.0),
                                                      child: Image.asset(
                                                        "logo.png",
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            8,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Indus Nova Packaging",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.yellow,
                                                          fontSize: 18),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      "Gate and Invoice Mismatch",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextButton(
                                                            child: Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              textAlign:
                                                                  TextAlign
                                                                      .end,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
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
                                  },
                                  controller: InvoiceNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Invoice Number Bar code',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Container(
                      color: Colors.white,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.blue,
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Invoice vs Packing Slip",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onDoubleTap: control2?scanBarcodeNormal2:null,
                                child: new TextField(
                                  enabled: control2,
                                  controller: InvoiceNumber2Controller,
                                  decoration: InputDecoration(
                                    labelText: 'Invoice Number',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, bottom: 16.0),
                              child: GestureDetector(
                                onDoubleTap: scanBarcodeNormal3,
                                child: new TextField(
                                  enabled: control2,
                                  onSubmitted: (value) {
                                    if(InvoiceNumber2Controller.text==PackingSlipController.text)
                                      {
                                        setState(() {
                                          control2=false;

                                        });
                                      }
                                    else {
                                      InvoiceNumber2Controller.text="";
                                      PackingSlipController.text="";
                                      showDialog<void>(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                              Colors.white.withOpacity(0),
                                              title: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(
                                                          50),
                                                      bottomRight:
                                                      Radius.circular(
                                                          50),
                                                      topLeft:
                                                      Radius.circular(
                                                          50),
                                                      topRight:
                                                      Radius.circular(
                                                          50)),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(16.0),
                                                      child: Image.asset(
                                                        "logo.png",
                                                        height: MediaQuery
                                                            .of(
                                                            context)
                                                            .size
                                                            .height /
                                                            8,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Indus Nova Packaging",
                                                      style: TextStyle(
                                                          color:
                                                          Colors.yellow,
                                                          fontSize: 18),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      "Invoice vs packing Slip Mismatch",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                          child: TextButton(
                                                            child: Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();
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
                                  },
                                  controller: PackingSlipController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Packing Slip Number',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Container(
                      color: Colors.white,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.blue,
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Packing list vs Packing Identification Slip",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onDoubleTap: control3?scanBarcodeNormal4:null,
                                child: new TextField(
                                  enabled: control3,

                                  controller: PackingListController,
                                  decoration: InputDecoration(
                                    labelText: 'Packing List',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, bottom: 16.0),
                              child: GestureDetector(
                                onDoubleTap: control3?scanBarcodeNormal5:null,
                                child: new TextField(
                                  enabled: control3,
                                  onSubmitted: (value) {
                                    if(MaterialIdentificationController.text==PackingListController.text)
                                    {
                                      setState(() {
                                        control3=false;

                                      });
                                    }
                                    else{
                                      MaterialIdentificationController.text="";
                                      PackingListController.text="";
                                    showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor:
                                            Colors.white.withOpacity(0),
                                            title: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(
                                                        50),
                                                    bottomRight:
                                                    Radius.circular(
                                                        50),
                                                    topLeft:
                                                    Radius.circular(
                                                        50),
                                                    topRight:
                                                    Radius.circular(
                                                        50)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(16.0),
                                                    child: Image.asset(
                                                      "logo.png",
                                                      height: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .height /
                                                          8,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Indus Nova Packaging",
                                                    style: TextStyle(
                                                        color:
                                                        Colors.yellow,
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Text(
                                                    "Packing list vs Packing Identification Slip Mismatch",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(8.0),
                                                        child: TextButton(
                                                          child: Text(
                                                            'OK',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                            textAlign:
                                                            TextAlign
                                                                .end,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                context)
                                                                .pop();
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
                                        });}
                                  },
                                  controller: MaterialIdentificationController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Material Identification Slip',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
      appBar: AppBar(
        title: Text("Dispatch Scanning"),
      ),
    );
  }


}
