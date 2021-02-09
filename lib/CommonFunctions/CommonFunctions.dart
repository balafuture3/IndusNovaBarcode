import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:packingvsdispatch/Screens/LoginPage.dart';
class CommonFunctions extends StatefulWidget {
  @override
  CommonFunctionsState createState() => CommonFunctionsState();
}

class CommonFunctionsState extends State<CommonFunctions> {
  static http.Response response;


 static Future<Response> loginapicall(user,pass) async {

    // String username = 'mobileuser';
    // String password = 'sap@1234';
    // String basicAuth =
    //     'Basic ' + base64Encode(utf8.encode('$username:$password'));
    // print(basicAuth);
    //
    var url;
    // Map<String, String> headers = {
    //   "Accept": "application/json",
    //   'Authorization': basicAuth,
    //   "x-csrf-token": "fetch",
    //   "Connection": "keep-alive",
    // };
    url = "http://27.100.26.22:44303/sap/bc/mobileapps/wmpickpack/getUser?user=$user&password=$pass";

    // print(url);
    // print(headers);
     response = await http.get(url);
    print(response.body);
    // if (response.statusCode  == 200) {
    //   LoginScreenState.csrftoken = CommonFunctionsState.response.headers["x-csrf-token"];
    //   LoginScreenState.cookie = CommonFunctionsState.response.headers["set-cookie"].split(';')[1].replaceAll("path=/,", "");
    //   print("cookie:${LoginScreenState.cookie}");
    //       // .cookie.split(';')[0]}");
    // }
    return response;

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
