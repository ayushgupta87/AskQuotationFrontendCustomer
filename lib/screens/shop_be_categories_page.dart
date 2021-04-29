import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/reuseable/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopByCategory extends StatefulWidget {
  @override
  _ShopByCategoryState createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
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
                    Image.asset(
                      companyPngImage,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
              Expanded(
                child: kCategoryCardView(context, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
