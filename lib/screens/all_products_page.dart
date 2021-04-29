// id, company username, image 1, image 2, product name, product description, brand, colour, item dimension l*b*w, product details,
// part number, company number, model, availability, category, min order qty, max order qty, UoM

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/reuseable/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          int sensitivity = 20;
          if (details.delta.dx > sensitivity) {
            Navigator.pop(context);
          } else if (details.delta.dx < -sensitivity) {}
        },
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.12,
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
                  Image.asset(companyPngImage,
                      width: MediaQuery.of(context).size.width * 0.3),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      print('search clicked');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: kCardViewShort(context, 100),
            ),
          ],
        ),
      ),
    );
  }
}
