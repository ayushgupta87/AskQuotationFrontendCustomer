import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/models/user_validate.dart';
import 'package:ask_quotation_customer/reuseable/network_data.dart';
import 'package:ask_quotation_customer/screens/Homescreen_dashboard_stack.dart';
import 'package:ask_quotation_customer/screens/homescreen.dart';
import 'package:ask_quotation_customer/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String accessToken;
  String customerUsername;
  String customerName;

  Future getToken() async {
    String access_token_is = await validateUser();
    var customerDetails = await http.get(currentCustomerDetails,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $access_token_is'});
    if (jsonDecode(customerDetails.body)['role'] != null){
      if (jsonDecode(customerDetails.body)['role'] != 'Customer') {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
              Fluttertoast.showToast(
                  msg: "Login Required",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0);
              return LoginPage();
            }), (route) => false);
      }
    }
    final getCustomerUsername = jsonDecode(customerDetails.body)['username'];
    final getCustomerName = jsonDecode(customerDetails.body)['name'];

    setState(() {
      accessToken = access_token_is;
      customerUsername = getCustomerUsername;
      customerName = getCustomerName;
    });
  }


  @override
  void initState() {
    super.initState();

    try {
      getToken().whenComplete(() {
        if (customerUsername != null) {
          Timer(Duration(seconds: 5), () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return HomeScreenDashboard(customerUsername, customerName);
                }), (route) => false);
            Fluttertoast.showToast(
                msg: "Welcome back, $customerName",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.black87,
                textColor: Colors.white,
                fontSize: 16.0);
          });
        } else {
          Timer(Duration(seconds: 5), () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), (route) => false);
            Fluttertoast.showToast(
                msg: "Login to continue",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
                fontSize: 16.0);
          });
        }
      });
  } on SocketException catch (e) {
        Timer(Duration(seconds: 5), () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false);
          Fluttertoast.showToast(
              msg: "Connectivity error",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      } on IOException catch (e) {
      Timer(Duration(seconds: 5), () {
        Fluttertoast.showToast(
            msg: "Connectivity error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), (route) => false);
      });
    } on TimeoutException catch (e) {
      Fluttertoast.showToast(
          msg: "Timeout error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), (route) => false);
    } catch (e) {
      Timer(Duration(seconds: 5), () {
        Fluttertoast.showToast(
            msg: "Connectivity error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), (route) => false);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27272E),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    companyName[0],
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    companyName.substring(1),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Advance',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.11),
                ),
                Text('Quotation',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.11)),
                Text('System',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.11)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  '// $companyTagline',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1,
                      letterSpacing: 4),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: SpinKitThreeBounce(
                      size: MediaQuery.of(context).size.width * 0.08,
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index.isEven ? Colors.white60 : Colors.green,
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
          Expanded(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    'images/Splashscreen.png',
                    height: 800,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

// SpinKitThreeBounce(
// size: 20,
// itemBuilder: (BuildContext context, int index) {
// return DecoratedBox(
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: index.isEven ? Colors.white60 : Colors.green,
// ),
// );
// }),
