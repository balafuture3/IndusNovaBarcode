import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:packingvsdispatch/CommonFunctions/CommonFunctions.dart';
import 'package:packingvsdispatch/Model/LoginResponse.dart';
import 'package:packingvsdispatch/Screens/Dashboard.dart';
import 'package:packingvsdispatch/Screens/BoxPickandPlace.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  LoginResponseList li;
static String csrftoken;

  static String cookie;








  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
  var loading=false;

  var _isHidden=true;

  String errortextemail;
  String errortextpass;

  bool validateE = false;

  bool validateP = false;
  static TextEditingController emailController = new TextEditingController();
  static TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        // padding: const EdgeInsets.all(8.0),

        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomRight:  Radius.circular(width/2)),
                  // border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid)
              ),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Container(
                        child: Image.asset('logo.png'),
                        width: 100,
                        height: 100,
                      ),
                       SizedBox(width: width/2,),
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
                    ],
                  ),


                  SizedBox(
                    height: height / 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Login "),
                        ),
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           ForgotPasswordPage()),
                          // );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*
            Text(
              "TANK CARE SOLUTIONS",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),*/
            // Container(
            //
            //   decoration: BoxDecoration(
            //     color: Colors.red.shade100,
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 16.0,bottom: 10),
            //             child: Text("Select Role",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [    Radio(
            //                 value: "Employee",
            //                 groupValue: character,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     character = value;
            //                     print(character);
            //                   });
            //                 }), Text('Employee',style: TextStyle(fontSize: 16,color: Colors.black),),],),
            //
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [    Radio(
            //                 value: "Vendor",
            //                 groupValue: character,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     character = value;
            //                     print(character);
            //                   });
            //                 }), Text('Vendor',style: TextStyle(fontSize: 16,color: Colors.black),),],)
            //
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: height / 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: buildTextField("Email or Mobile Number"),
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: TextField(
                obscureText: _isHidden,
                controller: passwordController,
                onTap: () {
                  setState(() {
                    errortextpass = null;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: _toggleVisibility,
                    icon: _isHidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  errorText: validateP ? errortextpass : null,
                  labelText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Forgot Password?"),
                        ),
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           ForgotPasswordPage()),
                          // );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 15,
            ),

            ButtonContainer(),
            // buildButtonContainer(),

            SizedBox(
              height: height /10,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.only(topLeft:  Radius.circular(width*0.9)),
            //      // border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid)
            //   ),
            //
            //   width: width,
            //   height: height / 7,
            //
            // ),
            //
            // Container(
            //   child: Center(
            //     child: GestureDetector(
            //       onTap: (){
            //         Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) =>RegisterPage()),
            //         );
            //       },
            //       child: Container(
            //         padding:const EdgeInsets.all(16.0),
            //         child: Text("Create an Account",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600),),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onTap: () {
        setState(() {
          errortextemail = null;
        });
      },
      decoration: InputDecoration(
        errorText: validateE ? errortextemail : null,
        prefixIcon: Icon(Icons.phonelink_sharp),
        labelText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: hintText == "Password"
            ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget ButtonContainer() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: 50,
        child: FlatButton(
          child: Text('Login'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          onPressed: () {
            setState(() {
              if (emailController.text.trim().isNotEmpty) {
                validateE = false;
              } else {
                validateE = true;
                errortextemail = "Email cannot be empty";
              }
              if (passwordController.text.isEmpty) {
                if (passwordController.text.isEmpty)
                  errortextpass = "Password cannot be empty";
                else
                  errortextpass = "Password should be minimum of 6 characters";
                validateP = true;
              } else
                validateP = false;

              if (validateE == false && validateP == false)
                check().then((value) async {
                  if (value) {
                    setState(() {
                      loading = true;
                    });
                 CommonFunctionsState.response = await CommonFunctionsState.loginapicall(
                        emailController.text, passwordController.text);
                    if (CommonFunctionsState.response.statusCode  == 200)
                    {
                      csrftoken=CommonFunctionsState.response .headers["x-csrf-token"];
                      print("headers:  ${CommonFunctionsState.response .headers["x-csrf-token"]}");
                      print("headers:  ${CommonFunctionsState.response .headers["content-type"]}");
                      print("headers:  ${CommonFunctionsState.response .headers["sap-processing-info"]}");
                      li = LoginResponseList.fromJson(json.decode(CommonFunctionsState.response .body));
                      setState(() {
                        loading = false;
                      });
                      print(li.details[0].success);
                      if (li.details[0].success=="X")
                      {
                        // print(li.d.results[0].message);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Dashboard()),
                        );
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
                      li.details[0].message.toString(),
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

                      }); }else
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
                                        li.details[0].message.toString(),
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

                      // showDialog(
                      //     context: context,
                      //     builder:(_) =>AlertDialog(
                      //       title: Text(
                      //         li.alert,
                      //         style: TextStyle(color: Colors.red),
                      //
                      //       ),
                      //       content:Text(
                      //           li.alert,
                      //           style: TextStyle(color: Colors.red),)
                      //     ));

                    } else {
                      setState(() {
                        loading = false;
                      });
                      print("Retry");
                    }


                  }
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           Page1()),
                  // );
                  else
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("No Internet Connection"),
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
            });

            //  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute extends StatelessWidget());
          },
        ));
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

class String_values {
}




