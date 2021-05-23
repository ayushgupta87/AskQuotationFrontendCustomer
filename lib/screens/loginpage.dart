import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/models/network_data.dart';
import 'package:ask_quotation_customer/reuseable/reusable_widgets.dart';
import 'package:ask_quotation_customer/screens/Homescreen_dashboard_stack.dart';
import 'package:ask_quotation_customer/screens/homescreen.dart';
import 'package:ask_quotation_customer/screens/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          icon: Icon(Icons.connect_without_contact),
          onPressed: () {},
          label: Text('Contact us')),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              companyPngImage,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Hello !",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "There",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    ".",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: MediaQuery.of(context).size.height * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            KbuildTextBox(username, 'Enter username', Icon(Icons.person), 1,
                TextInputType.name, false),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            KbuildTextBox(password, 'Enter password', Icon(Icons.vpn_key), 1,
                TextInputType.visiblePassword, true),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: buttonClicked == false
                        ? () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgetUsername();
                            }));
                          }
                        : null,
                    child: Text(
                      'Forget Username ?',
                      style: TextStyle(color: Colors.blue[600]),
                    )),
                TextButton(
                    onPressed: buttonClicked == false
                        ? () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgetPassword();
                            }));
                          }
                        : null,
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(color: Colors.blue[600]),
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: buttonClicked == false
                    ? () async {
                        final SharedPreferences sharedPreference =
                            await SharedPreferences.getInstance();

                        if (username.text.trim() == '') {
                          kshowDialogue('Alert', 'Enter Username to continue')
                              .showAlertDialoge(context);
                        } else if (password.text.trim() == '') {
                          kshowDialogue('Alert', 'Enter Password to continue')
                              .showAlertDialoge(context);
                        } else {
                          setState(() {
                            buttonClicked = true;
                          });

                          try {
                            var sendLoginRequest =
                                await http.post(customerLogin, body: {
                              "AppLogin": "kaizenAppCustomerLoginRequest",
                              "customerUsername":
                                  username.text.trim().toLowerCase(),
                              "password": password.text.trim()
                            }).timeout(Duration(seconds: 10));

                            if (sendLoginRequest.statusCode != 200) {
                              var error =
                                  jsonDecode(sendLoginRequest.body)['message'];
                              kshowDialogue('Error', '$error')
                                  .showAlertDialoge(context);
                            }
                            if (sendLoginRequest.statusCode == 200) {
                              setState(() {
                                buttonClicked = false;
                              });
                              sharedPreference.setString(
                                  'customer_access_token',
                                  jsonDecode(
                                      sendLoginRequest.body)['access_token']);
                              sharedPreference.setString(
                                  'customer_refresh_token',
                                  jsonDecode(
                                      sendLoginRequest.body)['refresh_token']);

                              var getCurrentUser = await http
                                  .get(currentCustomerDetails, headers: {
                                HttpHeaders.authorizationHeader:
                                    'Bearer ${jsonDecode(sendLoginRequest.body)['access_token']}'
                              }).timeout(Duration(seconds: 10));

                              var customer_username =
                                  jsonDecode(getCurrentUser.body)['username'];
                              var customer_name =
                                  jsonDecode(getCurrentUser.body)['name'];
                              var customer_accountStatus = jsonDecode(
                                  getCurrentUser.body)['accountStatus'];

                              if (customer_accountStatus != '1') {
                                setState(() {
                                  buttonClicked = false;
                                });
                                Fluttertoast.showToast(
                                    msg:
                                        "Your account is disabled, contact administrator",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                setState(() {
                                  buttonClicked = false;
                                });
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomeScreenDashboard(customer_username, customer_name);
                                }), (route) => false);
                              }
                            } else {
                              setState(() {
                                buttonClicked = false;
                              });
                            }
                          } on TimeoutException catch (e) {
                            print('Socket Exception $e');
                            kshowDialogue('Error',
                                    'Connectivity Error, Request timeout')
                                .showAlertDialoge(context);
                            setState(() {
                              buttonClicked = false;
                            });
                          } on SocketException catch (e) {
                            print('Socket Exception $e');
                            Fluttertoast.showToast(
                                msg: "Connectivity Error",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 10,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              buttonClicked = false;
                            });
                          } on IOException catch (e) {
                            print('Socket Exception $e');
                            Fluttertoast.showToast(
                                msg: "Connectivity Error",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 10,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              buttonClicked = false;
                            });
                          } catch (e) {
                            print('Socket Exception $e');
                            Fluttertoast.showToast(
                                msg: "Something went wrong",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 10,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              buttonClicked = false;
                            });
                          }
                        }
                      }
                    : null,
                child: buttonClicked == false
                    ? Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      )
                    : CupertinoActivityIndicator(),
              ),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New to ${companyName} Parts? '),
                TextButton(
                  onPressed: buttonClicked == false
                      ? () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        }
                      : null,
                  child: Text(
                    'Register Now !',
                    style: TextStyle(color: Colors.blue[600]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetUsername extends StatefulWidget {
  @override
  _ForgetUsernameState createState() => _ForgetUsernameState();
}

class _ForgetUsernameState extends State<ForgetUsername> {
  TextEditingController sourcePassword = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Recover Username'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  '* Note: Enter your registered email id, we will send you username details in your email',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                KbuildTextBox(
                    emailAddress,
                    'Enter registered email address',
                    Icon(Icons.alternate_email),
                    1,
                    TextInputType.emailAddress,
                    false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                kbuildSignupLogin(context, 'Recover', () async {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController sourcePassword = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController username = TextEditingController();
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Recover Password'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  '* Note: Enter your registered email id and username, We will confirm and send you mail regarding your password',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                KbuildTextBox(username, 'Enter username', Icon(Icons.person), 1,
                    TextInputType.name, false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                KbuildTextBox(
                    emailAddress,
                    'Enter registered email address',
                    Icon(Icons.alternate_email),
                    1,
                    TextInputType.emailAddress,
                    false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                kbuildSignupLogin(context, 'Recover', () async {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
