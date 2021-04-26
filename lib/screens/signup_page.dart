import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/reuseable/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _saving = false;

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              companyPngImage,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Create",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Account",
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '* After creating account, verify your email address and contact us to activate your account',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            KbuildTextBox(name, '* Enter your name', Icon(Icons.person), 1,
                TextInputType.name, false),
            KbuildTextBox(username, '* Enter username', Icon(Icons.perm_identity_sharp), 1,
                TextInputType.name, false),
            KbuildTextBox(emailAddress, '* Enter your email address',
                Icon(Icons.alternate_email), 1, TextInputType.emailAddress, false),
            KbuildTextBox(contactNumber, 'Enter your contact number',
                Icon(Icons.phone), 1, TextInputType.number, false),
            KbuildTextBox(city, 'Enter your city', Icon(Icons.location_city), 1,
                TextInputType.name, false),
            KbuildTextBox(state, 'Enter your state', Icon(Icons.location_city), 1,
                TextInputType.name, false),
            KbuildTextBox(country, 'Enter your country', Icon(Icons.location_on), 1,
                TextInputType.name, false),
            KbuildTextBox(password, '* Password', Icon(Icons.vpn_key), 1,
                TextInputType.visiblePassword, true),
            KbuildTextBox(confirmPassword, '* Confirm Password',
                Icon(Icons.vpn_key_outlined), 1, TextInputType.visiblePassword, true),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
                child: kbuildSignupLogin(context, 'Sign Up', () async {})),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ]),
        ),
      ),
    );
  }
}
