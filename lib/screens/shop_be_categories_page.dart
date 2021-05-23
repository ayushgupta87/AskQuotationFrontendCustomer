import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:ask_quotation_customer/models/network_data.dart';
import 'package:ask_quotation_customer/models/user_validate.dart';
import 'package:ask_quotation_customer/reuseable/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

class ShopByCategory extends StatefulWidget {
  @override
  _ShopByCategoryState createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
  bool _saving = true;
  List<Categories> categoriesList = [];

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

  @override
  void initState() {
    super.initState();
    getCategories().whenComplete(() {
      setState(() {
        _saving=false;
      });
    });
  }


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
                itemCount: categoriesList.length,
                itemBuilder: (context, i) {
                  Uint8List _categoryImage = base64.decode(categoriesList[i].categoryImage);
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
                                    child: categoriesList[i].categoryImage == 'None' ? Image.asset(companyPngImage) : Image.memory(_categoryImage)),
                              ),
                            ),
                            Positioned.fill(
                              top: 30,
                              left: 40,
                              child: Container(
                                // decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(10)
                                // ),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      categoriesList[i].categoryName,
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


class Categories{
  final String categoryName;
  final String categoryImage;

  Categories(this.categoryName, this.categoryImage);
}