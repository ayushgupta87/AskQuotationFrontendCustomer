import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
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
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, right: 10, left: 10),
                      child: AspectRatio(
                        aspectRatio: 15 / 5,
                        child: Container(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  top: 10,
                                  left: 225,
                                  bottom: -50,
                                  child: Container(
                                    child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.4),
                                            BlendMode.dstIn),
                                        child: Image.asset(companyPngImage)),
                                    decoration: BoxDecoration(
                                        boxShadow: customShadow,
                                        color: Colors.white38,
                                        shape: BoxShape.circle),
                                  )),
                              Positioned.fill(
                                right: MediaQuery.of(context).size.width * 0.6,
                                child: Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(companyPngImage)),
                                ),
                              ),
                              Positioned.fill(
                                top: 30,
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.circular(10)
                                  // ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Item Name',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            boxShadow: customShadow,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
