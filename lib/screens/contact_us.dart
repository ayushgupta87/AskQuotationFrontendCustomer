import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  void _launchCaller(int number) async {
    var url = "tel:+${number.toString()}";
    await launch(url);
  }

  void _launchEmail(String emailId) async {
    var urlEmail = "mailto:$emailId?subject=Sent from $companyName Application";
    await launch(urlEmail);
  }

  void _launchUrl(String Url) async {
    launch(Url);
  }

  void MaplaunchURL() async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$homeLat,$homeLng";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      Fluttertoast.showToast(
          msg: 'Error Opening maps',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.09,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Let\'s get in touch.',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              '$companyCountry (Head Office)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Divider(
                              height: 10,
                              color: Colors.grey,
                            ),
                            Text(
                              companyName.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              companyAddress,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.06,
                            ),
                            FlatButton(
                              child: Text(
                                'Find Us on Maps',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                MaplaunchURL();
                              },
                              color: Colors.black,
                            ),
                            FlatButton(
                              child: Text(
                                'Register yourself on our official website',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                _launchUrl(companyURL);
                              },
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Weather you have a question about our products, trials, pricing, need solution for problem, or anything else, our team is ready to answer all your questions.',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(FontAwesomeIcons.whatsapp),
                              onTap: () {
                                print('whatsapp open');
                                _launchUrl("https://wa.me/$contactNumber");
                              },
                            ),
                            GestureDetector(
                              child: Icon(FontAwesomeIcons.facebook),
                              onTap: () {
                                print('fb open');
                                _launchUrl(facebookURL);
                              },
                            ),
                            GestureDetector(
                              child: Icon(FontAwesomeIcons.instagram),
                              onTap: () {
                                print('insta open');
                                _launchUrl(instaURL);
                              },
                            ),
                            GestureDetector(
                              child: Icon(FontAwesomeIcons.mailBulk),
                              onTap: () {
                                print('email open');
                                _launchEmail(emailAddress);
                              },
                            ),
                            GestureDetector(
                              child: Icon(FontAwesomeIcons.phone),
                              onTap: () {
                                print('phone open');
                                _launchCaller(contactNumber);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(' '),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
