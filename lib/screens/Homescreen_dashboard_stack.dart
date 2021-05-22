import 'package:ask_quotation_customer/screens/dashboard.dart';
import 'package:ask_quotation_customer/screens/homescreen.dart';
import 'package:flutter/material.dart';

class HomeScreenDashboard extends StatefulWidget {
  final String username;
  final String name;
  HomeScreenDashboard(this.username, this.name);
  @override
  _HomeScreenDashboardState createState() => _HomeScreenDashboardState();
}

class _HomeScreenDashboardState extends State<HomeScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DashBoard('Hello, ${widget.name}\nUsername - ${widget.username}'),
          HomeScreen()
        ],
      ),
    );
  }
}