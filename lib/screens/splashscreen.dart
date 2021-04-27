import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
