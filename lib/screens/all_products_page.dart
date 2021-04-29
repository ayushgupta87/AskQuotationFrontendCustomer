// id, company username, image 1, image 2, product name, product description, brand, colour, item dimension l*b*w, product details,
// part number, company number, model, availability, category, min order qty, max order qty, UoM

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
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
                child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AspectRatio(
                    aspectRatio: 15 / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: customShadow,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 2,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Text(
                                    'Description',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey[100],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            top: 20,
                            left: 10,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                companySquareImage,
                                width: MediaQuery.of(context).size.width * 0.33,
                              ),
                            ),
                          ),

                          Positioned.fill(
                            top: MediaQuery.of(context).size.height * 0.05,
                            bottom: MediaQuery.of(context).size.height * 0.065,
                            left: MediaQuery.of(context).size.width * 0.4,
                            right: MediaQuery.of(context).size.width * 0.05,
                            child: Container(
                              // color: Colors.black,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Name:',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'ABC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Product No:',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'ABC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        '$companyShortName No:',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'ABC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Category:',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'ABC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Model:',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                      Expanded(
                                          child: Text(
                                        'ABC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Positioned.fill(
                            right: 10,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_bag,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  label: Text(
                                    '+ Bag',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                ),
                              ),
                            ),
                          ),

                          // Positioned.fill(
                          //   left: MediaQuery.of(context).size.width * 0.42,
                          //   top: MediaQuery.of(context).size.width * -0.22 +50,
                          //   child: Row(
                          //     children: [
                          //       Text('Brand:', style: TextStyle(color: Colors.grey[800]),),
                          //       SizedBox(
                          //         width: MediaQuery.of(context).size.width * 0.1,
                          //       ),
                          //       Text('XYZ', style: TextStyle(fontWeight: FontWeight.bold),),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
