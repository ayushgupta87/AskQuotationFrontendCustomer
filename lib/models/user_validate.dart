import 'dart:convert';
import 'dart:io';

import 'package:ask_quotation_customer/models/network_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future validateUser() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var obtainedAccessToken = sharedPreferences.getString('customer_access_token');
  var obtainedRefreshToken = sharedPreferences.getString('customer_refresh_token');

  try {
    var getUserInfo = await http.get(currentCustomerDetails, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $obtainedAccessToken'
    });

    if (getUserInfo.statusCode == 200) {
      if (jsonDecode(getUserInfo.body)['accountStatus'] != '1'){
        Fluttertoast.showToast(
            msg: "Your account deactivated, contact administrator",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return null;
      }

      print('Old access key used /${getUserInfo.statusCode}/ from validateUser');
      return obtainedAccessToken;
    }

    var contentBody = jsonDecode(getUserInfo.body)['msg'];

    if (contentBody == 'Token has expired') {
      var refreshToken = await http.post(customerRefreshToken, headers: {
        HttpHeaders.authorizationHeader: 'Bearer $obtainedRefreshToken'
      });

      if (refreshToken.statusCode == 200){
        var new_access_token = jsonDecode(refreshToken.body)['access_token'];
        print('New access token issued from validateUser, ${refreshToken.statusCode}');
        sharedPreferences.setString('customer_access_token', new_access_token);
        return new_access_token;
      } else {
        Fluttertoast.showToast(
            msg: "Login required",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return null;
      }
    }
  } on SocketException catch (e) {
    Fluttertoast.showToast(
        msg: "Connectivity Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return null;
  }
}