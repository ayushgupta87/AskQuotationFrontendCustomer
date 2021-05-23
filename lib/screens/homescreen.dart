import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/models/network_data.dart';
import 'package:ask_quotation_customer/models/user_validate.dart';
import 'package:ask_quotation_customer/reuseable/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _saving = true;


  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  List<Categories> categoriesList = [];
  List<HomePageBannerImage> homePageImageList = [];

  var itemCount = '0';

  getWishListCount() async {
    var countOfBag;
    var getWishlistLength = await http.get(getWishlistLength, headers: {HttpHeaders.authorizationHeader: 'Bearer $access_token'});
    if (getWishlistLength.statusCode == 200){
      countOfBag = await jsonDecode(getWishlistLength.body)['wishlistCount'];
    } else {
      countOfBag = '0';
    }
    setState((){
      itemCount = countOfBag;
    });
  }

  Future<List<Categories>> getCategories() async {
    String access_token = await validateUser();
    if (access_token != null){
      var getCategories = await http.get(getAllCategories, headers: {HttpHeaders.authorizationHeader: 'Bearer $access_token'});

      var data = await jsonDecode(getCategories.body)['categories'];
      if (data == null){
        return null;
      }

      if (getCategories.statusCode == 200){
        for (var item in data){
          Categories categories = Categories(item['categoryName'], item['categoryImage']);
          categoriesList.add(categories);
        }
        return categoriesList;
      }

    }
  }

  Future<List<HomePageBannerImage>> getHomePageImage() async {
    String access_token = await validateUser();
    if (access_token != null){
      var homePageImage = await http.get(homePageBannerImage, headers: {HttpHeaders.authorizationHeader: 'Bearer $access_token'});

      var data = await jsonDecode(homePageImage.body)['homePageImages'];
      if (data == null) {
        return null;
      }

      if (homePageImage.statusCode == 200){
        for (var item in data){
          HomePageBannerImage homePageBannerImage = HomePageBannerImage(item['image']);
          homePageImageList.add(homePageBannerImage);
        }
        return homePageImageList;
      }

    }
  }

  @override
  void initState() {
    super.initState();
    getCategories().whenComplete(() {
      getHomePageImage().whenComplete((){
        setState(() {
          _saving=false;
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _saving,
      child: WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          if (isDrawerOpen == true) {
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
                xOffset = MediaQuery.of(context).size.width * 0.55;
                yOffset = 150;
                scaleFactor = 0.6;
                isDrawerOpen = true;
              });
            } else if (details.delta.dx < -sensitivity) {
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
                                          MediaQuery.of(context).size.width *
                                              0.55;
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
                                '$itemCount',
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
                    itemCount: homePageImageList.length,
                    itemBuilder: (context, i) {
                      Uint8List _bannerImage = base64.decode(homePageImageList[i].image);
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
                                    image:
                                    homePageImageList[i].image == 'None' ? AssetImage('images/banner-sample.jpg') : MemoryImage(_bannerImage))),
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
                          itemCount: categoriesList.length,
                          itemBuilder: (context, i) {
                            Uint8List _categoryImage = base64.decode(categoriesList[i].categoryImage);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.3  ,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: categoriesList[i].categoryImage == 'None' ? AssetImage(companyPngImage) : MemoryImage(_categoryImage),
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
                                                  .withOpacity(0.2)),
                                          child: Text(''),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          categoriesList[i].categoryName,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                .size
                                                .width *
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
                  child: kCategoryCardView(context, 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories{
  final String categoryName;
  final String categoryImage;

  Categories(this.categoryName, this.categoryImage);
}

class HomePageBannerImage{
  final String image;

  HomePageBannerImage(this.image);
}