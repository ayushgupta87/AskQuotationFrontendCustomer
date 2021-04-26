import 'package:ask_quotation_customer/screens/dashboard.dart';
import 'package:ask_quotation_customer/screens/homescreen.dart';
import 'package:flutter/material.dart';

class HomescreenDashboard extends StatefulWidget {
  @override
  _HomescreenDashboardState createState() => _HomescreenDashboardState();
}

class _HomescreenDashboardState extends State<HomescreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DashBoard('Ayush'),
          HomeScreen()
        ],
      ),
    );
  }
}