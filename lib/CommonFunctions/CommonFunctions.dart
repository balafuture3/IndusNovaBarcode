import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:packingvsdispatch/LoginPage.dart';
class CommonFunctions extends StatefulWidget {
  @override
  CommonFunctionsState createState() => CommonFunctionsState();
}

class CommonFunctionsState extends State<CommonFunctions> {
  static http.Response response;


 static Future<Response> loginapicall(user,pass) async {

    String username = 'mobileuser';
    String password = 'sap@1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    var url;
    Map<String, String> headers = {
      "Accept": "application/json",
      'Authorization': basicAuth,
      "x-csrf-token": "fetch",
    };
    url = "http://27.100.26.22:44303/sap/opu/odata/sap/ZWMPICKPACK_SRV/ZC_WMUser?\$filter=(UserName eq '$user' and Password eq '$pass')";

    // print(url);
    // print(headers);
     response = await http.get(url,
      headers:headers,);
    print(response.body);
    if (response.statusCode  == 200) {
      LoginScreenState.csrftoken = CommonFunctionsState.response.headers["x-csrf-token"];
      LoginScreenState.cookie = CommonFunctionsState.response.headers["Cookie"];
      print(LoginScreenState.cookie);
    }
    return response;

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
