import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
    onWillPop: (){
        if (isDrawerOpen == true){
          setState(() {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            });
          });
        }
      },
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {

            setState(() {
              xOffset =
                  MediaQuery.of(context).size.width * 0.55;
              yOffset = 150;
              scaleFactor = 0.6;
              isDrawerOpen = true;
            });

          } else if(details.delta.dx < -sensitivity){

            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            });
          }
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isDrawerOpen ? 10 : 0.0),
          ),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: Column(children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                })
                            : IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  setState(() {
                                    xOffset =
                                        MediaQuery.of(context).size.width * 0.55;
                                    yOffset = 150;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                }),
                        Column(
                          children: [
                            Image.asset(
                              companyPngImage,
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.shopping_bag),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '4',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              boxShadow: customShadow,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/banner-sample.jpg'))),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              'Top Categories',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(companyPngImage),
                                  ),
                                  boxShadow: customShadow,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFCADCED)
                                                .withOpacity(0.45)),
                                        child: Text(''),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Category',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.035,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular Products',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10.0, right: 10, left: 10),
                      child: AspectRatio(
                        aspectRatio: 15 / 5,
                        child: Container(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  top: 10,
                                  left: 220,
                                  bottom: -10,
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
                                left: 160,
                                top: -60,
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.circular(10)
                                  // ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Item Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                MediaQuery.of(context).size.width *
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
