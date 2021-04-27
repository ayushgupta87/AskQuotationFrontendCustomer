import 'package:ask_quotation_customer/screens/about_us.dart';
import 'package:ask_quotation_customer/screens/contact_us.dart';
import 'package:ask_quotation_customer/screens/homescreen.dart';
import 'package:ask_quotation_customer/screens/shop_be_categories_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatelessWidget {
  String user;
  DashBoard(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff27272E),
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(user[0]),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.045,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (element['title'] == 'Shop by categories') {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ShopByCategory();
                                }));
                              }
                              if (element['title'] == 'About us') {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AboutUsPage();
                                }));
                              }
                              if (element['title'] == 'Contact us') {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ContactUs();
                                }));
                              }
                            },
                            child: Text(
                              element['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.045,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Account',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.productHunt, 'title': 'All Products'},
  {'icon': Icons.category, 'title': 'Shop by categories'},
  {'icon': FontAwesomeIcons.industry, 'title': 'About us'},
  {'icon': Icons.shopping_bag, 'title': 'Your Bag'},
  {'icon': Icons.wb_iridescent, 'title': 'Your Quotations'},
  {'icon': FontAwesomeIcons.phone, 'title': 'Contact us'},
  {'icon': FontAwesomeIcons.edit, 'title': 'Review us'},
];
