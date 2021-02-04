

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:packingvsdispatch/CommonFunctions/CommonFunctions.dart';
import 'package:packingvsdispatch/LoginPage.dart';
import 'package:packingvsdispatch/Model/PackageGetBOXDetailsResponse.dart';
class Page1 extends StatefulWidget {
  @override
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  bool loading=false;

  PackageGetBOXDetails li;

  bool datatablevisibility=false;

  Future<http.Response> apicall() async {
    setState(() {
      loading = true;
    });
    String username = 'mobileuser';
    String password = 'sap@1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
print(LoginScreenState.csrftoken);
    var url;

    Map<String, String> headers = {
      "Accept": "application/json",
      'Authorization': basicAuth,
      // "x-csrf-token": LoginScreenState.csrftoken.toString(),
      // "Content-Type": "application/json",
    };
    url = "http://27.100.26.22:44303//sap/opu/odata/sap/ZWMPICKPACK_SRV/ZC_PACKRTD?\$filter=(BoxNumber eq '${BarcodeController.text}')";

    print(url);
    print(headers);
    var response = await http.get(url,
      headers:headers,);


    print(response.body);

    if (response.statusCode == 200)
    {
      datatablevisibility=true;
      // int timeInMillis = 1586348737122;
      // var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      // var formattedDate = DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(timeInMillis));
      print("headers:  ${response.headers["x-csrf-token"]}");
      print("headers:  ${response.headers["content-type"]}");
      print("headers:  ${response.headers["sap-processing-info"]}");
      li = PackageGetBOXDetails.fromJson(json.decode(response.body));
      setState(() {
        loading = false;
      });
      print(li.d.results[0].boxNumber);


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
    CommonFunctionsState.loginapicall("ADMIN","Admin").then((value) async {
      String username = 'mobileuser';
      String password = 'sap@1234';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      print(basicAuth);
      print(LoginScreenState.csrftoken);
      var url;

      Map data = {
        "BoxNumber": "AG00011097",
        "Bin": "DUMMY",
        "GrossWeight": "20"
      };
      var body = json.encode(data);
      Map<String, String> headers = {
        "Accept": "application/json",
        'Authorization': basicAuth,
        "x-csrf-token": LoginScreenState.csrftoken,

        "Content-Type": "application/json",
      };
      url =
      "http://27.100.26.22:44303/sap/opu/odata/sap/ZWMPICKPACK_SRV/ZC_PackUpdate";

      print(url);
      print(headers);
      var response = await http.post(url,
          headers: headers, body: body);


      print(response.body);

      setState(() {
        loading = false;
      });
      print("Retry");

      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      return response;
    });
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
                      controller: RackScanController,
                      decoration: InputDecoration(
                        labelText: 'Scan Rack',
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
                  Visibility(
                    visible: datatablevisibility,
                    child:  li!=null?ExpansionTile(
                      initiallyExpanded: true,
                      title: Text("Package Details"),
                      children: [SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              headingRowColor:
                              MaterialStateColor.resolveWith((states) => Colors.blue),

                              columns: [
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text(
                                            "QP Number",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Posting Date",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Pack No",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Doc Date",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Box Number",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Plant",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Material",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Material Description",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Old Material",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Stock Seg",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Yield",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Conf.Unit",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                                DataColumn(
                                  label: Center(
                                      child: Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Quan",
                                              softWrap: true,
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.center),
                                        ],
                                      )),
                                  numeric: false,

                                  // onSort: (columnIndex, ascending) {
                                  //   onSortColum(columnIndex, ascending);
                                  //   setState(() {
                                  //     sort = !sort;
                                  //   });
                                  // }
                                ),
                              ],
                              rows:li.d.results
                                  .map(
                                    (list) => DataRow(cells: [
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.qPNumber.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  DateFormat.yMd().add_jm().format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.postingDate.replaceAll("/Date(", "").replaceAll(")/", ""))))
                                                  ,
                                                  textAlign: TextAlign.center)
                                            ]),
                                      ))),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.packNo.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(DateFormat.yMd().add_jm().format(DateTime.fromMillisecondsSinceEpoch(int.parse(list.documentDate.replaceAll("/Date(", "").replaceAll(")/", ""))))
                                                      ,textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.boxNumber.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.plant.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                list.material.toString(),
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                      ))),
                                  DataCell(Center(
                                      child: Center(
                                        child: Wrap(
                                            direction: Axis.vertical, //default
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  list.materialName.toString() ,
                                                  textAlign: TextAlign.center)
                                            ]),
                                      ))),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.oldMaterial.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.stockSegment.toString(),textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.yield.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.confUnit.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Center(
                                            child: Wrap(
                                                direction: Axis.vertical, //default
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text(list.qCPending.toString(),
                                                      textAlign: TextAlign.center)
                                                ]))),
                                  ),
                                ]),
                              )
                                  .toList()))],
                    
                    ):Text("No Results"),
                      ),
                  SizedBox(height: height/30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            onPressed: () {},
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
        title: Row(
          children: [
            Container(
              child: Image.asset('logo.png'),
              width: 50,
              height: 50,
            ),
            Text("Indus Nova Packaging"),
          ],
        ),
    ),
    );

  }
}
