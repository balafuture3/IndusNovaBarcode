import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:packingvsdispatch/CommonFunctions/CommonFunctions.dart';
import 'package:packingvsdispatch/Model/Get%20OBD.dart';
import 'package:packingvsdispatch/Model/GetBoxDetailsModel.dart';
import 'package:packingvsdispatch/Model/Page2BoxDetail.dart';
import 'package:packingvsdispatch/Screens/Dashboard.dart';
import 'package:packingvsdispatch/Screens/LoginPage.dart';
import 'package:packingvsdispatch/Model/PackageGetBOXDetailsResponse.dart';
import '../Model/BoxSaveResponse.dart';

class Picking extends StatefulWidget {
  @override
  PickingState createState() => PickingState();
}

class PickingState extends State<Picking> {
  List<String> barcodelist = [];
  List<String> locationlist = [];
  List<String> weightlist = [];
  Page2BoxDetailModelList li7;
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1")
        BarcodeController.text=barcodeScanRes;
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
  bool loading=false;

  PackageGetBOXList li;

  bool datatablevisibility=false;
  final TextEditingController _typeAheadController = TextEditingController();
  BoxSaveResponseList li1;
  List<String> stringlist =[" Select OBD Number "];
  String dropdownValue1 = " Select OBD Number ";
  static GetOBDList li3;

  GetCustomerDetailsList li4;

  Future<http.Response> apicall(call) async {
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
    url = "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/getAllBoxData?box=$call";

    print(url);
    // print(headers);
    var response = await http.get(url,);


    print(response.body);

    if (response.statusCode == 200)
    {
      datatablevisibility=true;
      li7 = Page2BoxDetailModelList.fromJson(json.decode(response.body));
      setState(() {
        loading = false;
      });
      print(li7.details[0].boxnumber);
      setState(() {
        locationlist.add(li7.details[0].bin);
        weightlist.add(li7.details[0].grossweight.toString());
      });


    }
    else
      {
      setState(() {
        loading = false;
      });
      print("Retry");
    }
    print("response: ${response.statusCode}");
    print("response: ${response.body}");
    return response;
  }
  Future<http.Response> listcall() async {
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
    url = "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/getCustomerOBD";

    print(url);
    // print(headers);
    var response = await http.get(url,);


    print(response.body);

    if (response.statusCode == 200)
    {
      datatablevisibility=true;
      // int timeInMillis = 1586348737122;
      // var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      // var formattedDate = DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(timeInMillis));
      // print("headers:  ${response.headers["x-csrf-token"]}");
      // print("headers:  ${response.headers["content-type"]}");
      // print("headers:  ${response.headers["sap-processing-info"]}");
      li3 = GetOBDList.fromJson(json.decode(response.body));
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
  Future<http.Response> dropdowncall(cuscode) async {
    setState(() {
      loading = true;
    });

    var url;

    url = "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/getOBDlist?customer=$cuscode";
    print(url);
    var response = await http.get(url,);


    print(response.body);

    if (response.statusCode == 200)
    {
      li4 = GetCustomerDetailsList.fromJson(json.decode(response.body));
      // datatablevisibility=true;

      setState(() {
        stringlist.clear();
        stringlist.add(" Select OBD Number ");
        for(int i=0;i<li4.details.length;i++)
          stringlist.add(li4.details[i].delivery);
      });


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
    // http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pick?user=ADMIN&0delivery=2007000036&0box=AG00011097&0bin=DUMMY&&0grossweight=10&1delivery=2007000038&1box=AG00011099&1bin=DUMMY1&1grossweight=10
   if(barcodelist.length==0)
   url =
        "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pick?delivery=${dropdownValue1}&box=${BarcodeController.text}&bin=${BinScanController.text}&user=${LoginScreenState.emailController.text}";
    // http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pack?box=AG00011097&bin=DUMMY&grossweight=10&user=ADMIN
   else
   {
     // http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pick?user=ADMIN&0delivery=2007000036&0box=AG00011097&0bin=DUMMY&&0grossweight=10&1delivery=2007000038&1box=AG00011099&1bin=DUMMY1&1grossweight=10
     url =
     "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/pick?user=${LoginScreenState.emailController.text}";
     String data="";
     for(int i=0;i<barcodelist.length;i++)
       data='$data&${i}box=${barcodelist[i]}&${i}delivery=${dropdownValue1}&${i}grossweight=${weightlist[i]}&${i}bin=${locationlist[i]}';
     url=url+data;
     print(url);
   }
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
        setState(() {
          _typeAheadController.text="";
          CustomerCodeController.text="";
          stringlist.clear();
         stringlist.add(" Select OBD Number ");
         dropdownValue1 = " Select OBD Number ";
         barcodelist.clear();
         locationlist.clear();
         weightlist.clear();
         BarcodeController.text="";
         MtrDesController.text="";
         MtrController.text="";
         ReqSegController.text="";


        });



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
                            padding: const EdgeInsets.all(8.0),
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
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Error!!!!",style: TextStyle(color: Colors.red),),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:24,right:24),
                      child: Text(li1.details[0].message),
                    ),
                  ],
                ),
              ),
              actions: [FlatButton(onPressed:(){ Navigator.pop(context);}, child: Text("OK"))],
            ));
      }
    }
    return response;


  }
  String _scanBarcode;
  TextEditingController BarcodeController = new TextEditingController();
  TextEditingController OutboundController = new TextEditingController();
  TextEditingController RackScanController = new TextEditingController();
  TextEditingController BinScanController = new TextEditingController();
  TextEditingController CustomerNameController = new TextEditingController();
  TextEditingController CustomerCodeController = new TextEditingController();
  TextEditingController ReqSegController = new TextEditingController();
  TextEditingController MtrDesController = new TextEditingController();
  TextEditingController MtrController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    listcall();
    super.initState();
  }
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
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0,top:16),
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    enabled: true,
                    controller: this._typeAheadController,
                    // onTap: ()
                    // {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               Category(userid:HomeState.userid,mapselection: true)));
                    // },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Customer Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return BackendService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      dropdownValue1 = " Select OBD Number ";
                    });

                    // postRequest(suggestion);
                    for (int i = 0;
                    i < li3.details.length;
                    i++) {
                      print(li3.details[i].customername);
                      if ("${li3.details[i].customername}-${li3.details[i].customer}" ==
                          suggestion)
                      {
                      CustomerCodeController.text=li3.details[i].customer;

                      dropdowncall(li3.details[i].customer);
                      OutboundController.text=li3.details[i].delivery;

                      }
                    }
                    this._typeAheadController.text = suggestion;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please select a city';
                    } else
                      return 'nothing';
                  },
                  // onSaved: (value) => this._selectedCity = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0,left: 16,right: 16),
                child: new TextField(
                  enabled: false,


                  controller: CustomerCodeController,
                  decoration: InputDecoration(
                    labelText: 'Customer Code',
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
              SizedBox(height: height/30,),
              Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    border: new Border.all(color: Colors.black38)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue1,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue1 = newValue;
                        for(int i=0;i<li4.details.length;i++)
                          if(li4.details[i].delivery==newValue)
                            {
                              MtrController.text=li4.details[i].material;
                              MtrDesController.text=li4.details[i].materialdescription;
                              ReqSegController.text=li4.details[i].requirementsegment;
                            }

                      });
                    },
                    items: stringlist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0,left: 16,right: 16),
                child: new TextField(

                  enabled: false,

                  controller: MtrController,
                  decoration: InputDecoration(
                    labelText: 'Material',
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
                padding: const EdgeInsets.only(top:16.0,left: 16,right: 16),
                child: new TextField(

                  enabled: false,

                  controller: MtrDesController,
                  decoration: InputDecoration(
                    labelText: 'Material Description',
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
                padding: const EdgeInsets.only(top:16.0,left: 16,right: 16),
                child: new TextField(

                  enabled: false,

                  controller: ReqSegController,
                  decoration: InputDecoration(
                    labelText: 'Requirement Segment',
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

              Container(
                width: width,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onDoubleTap:scanBarcodeNormal,
                        child: new TextField(
                          // onSubmitted: (value) {
                          //   apicall();
                          // },

                          controller: BarcodeController,
                          decoration: InputDecoration(
                            labelText: 'Box Number',
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
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              if(BarcodeController.text.length!=0) {
                                apicall(BarcodeController.text);
                                barcodelist.add(BarcodeController.text);
                                BarcodeController.text="";

                              }
                              else
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Please enter Box number"),
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

                            });
                          }),
                    )
                  ],
                ),
              ),
              if(barcodelist.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 16),
                  child: ExpansionTile(
                    title: Text("Box List"),
                    initiallyExpanded: true,
                    children: [
                      for (int i = 0; i < barcodelist.length; i++)
                        ListTile(
                          title: Text(barcodelist[i]),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              size: 25,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                locationlist.removeAt(i);
                                weightlist.removeAt(i);
                                barcodelist.removeAt(i);
                              });
                            },
                          ),
                        )
                    ],
                  ),
                ),

              if(locationlist.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 16),
                  child: ExpansionTile(
                    title: Text("Location List"),
                    initiallyExpanded: true,
                    children: [
                      for (int i = 0; i < locationlist.length; i++)
                        ListTile(
                          title: Text(locationlist[i]),
                          // trailing: IconButton(
                          //   icon: Icon(
                          //     Icons.remove_circle,
                          //     size: 25,
                          //     color: Colors.red,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       barcodelist.removeAt(i);
                          //     });
                          //   },
                          // ),
                        )
                    ],
                  ),
                ),

              if(weightlist.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 16),
                  child: ExpansionTile(
                    title: Text("Weight List"),
                    initiallyExpanded: true,
                    children: [
                      for (int i = 0; i < weightlist.length; i++)
                        ListTile(
                          title: Text(weightlist[i]),
                          // trailing: IconButton(
                          //   icon: Icon(
                          //     Icons.remove_circle,
                          //     size: 25,
                          //     color: Colors.red,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       barcodelist.removeAt(i);
                          //     });
                          //   },
                          // ),
                        )
                    ],
                  ),
                ),

              // Padding(
              //   padding: const EdgeInsets.only(left:16.0,right:16.0,bottom: 16.0),
              //   child: new TextField(
              //     controller: BinScanController,
              //     decoration: InputDecoration(
              //       labelText: 'Location',
              //       hintStyle: TextStyle(
              //         color: Colors.grey,
              //         fontSize: 16.0,
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left:16.0,right:16.0,bottom: 16.0),
              //   child: new TextField(
              //     enabled: false,
              //     controller: RackScanController,
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       labelText: 'Box Weight',
              //       hintStyle: TextStyle(
              //         color: Colors.grey,
              //         fontSize: 16.0,
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //     ),
              //   ),
              // ),

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
                          if (
                              dropdownValue1 != " Select OBD Number " )
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
                                    Text("Box Number"),
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

                            else if (dropdownValue1 == " Select OBD Number ")
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Please Select OBD Number "),
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
              SizedBox(height: height/30,),

            ],
          ),




        ):Center(child: CircularProgressIndicator()),
      ),
      appBar: AppBar(
        title:
            Text("Box Picking list"),

      ),
    );

  }
}
class BackendService {


  static Future<List> getSuggestions(String query) async {
    List<String> s = new List();
    if (PickingState.li3.details.length == 0) {
      // return ["No details"];
    } else {
      for(int i=0;i<PickingState.li3.details.length;i++)
        if(PickingState.li3.details[i].customername.toLowerCase().contains(query.toLowerCase())||PickingState.li3.details[i].customer.toLowerCase().contains(query.toLowerCase()))
        s.add("${PickingState.li3.details[i].customername}-${PickingState.li3.details[i].customer}");
        return s;
    }



  }
}
