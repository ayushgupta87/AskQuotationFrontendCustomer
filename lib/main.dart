import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/screens/Homescreen_dashboard_stack.dart';
import 'package:ask_quotation_customer/screens/dashboard.dart';
import 'package:ask_quotation_customer/screens/loginpage.dart';
import 'package:ask_quotation_customer/screens/single_product_page.dart';
import 'package:ask_quotation_customer/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleProductPage('12'),
      title: companyName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: Color(0xFFCADCED),
      ),
    );
  }
}
