import 'dart:convert';
import 'dart:io';

import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/models/network_data.dart';
import 'package:ask_quotation_customer/models/user_validate.dart';
import 'package:ask_quotation_customer/screens/items_in_bag.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SingleProductPage extends StatefulWidget {
  final String productIdDetails;
  SingleProductPage(this.productIdDetails);

  @override
  _SingleProductPageState createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {

  String productIdIs;
  String productName;
  String shortDesc;
  String category;
  String price;
  String productDetails;
  String image1;
  String image2;

  bool _saving=true;

  Future getProductDetails()async{
    String access_token = await validateUser();
    var getProductDetails = await http.get(getSingleProductDetails(widget.productIdDetails),
    headers: {HttpHeaders.authorizationHeader: 'Bearer $access_token'});
    if (getProductDetails.statusCode == 200){
      productIdIs = jsonDecode(getProductDetails.body)['product']['productId'];
      productName = jsonDecode(getProductDetails.body)['product']['productName'];
      shortDesc = jsonDecode(getProductDetails.body)['product']['shortDescription'];
      category = jsonDecode(getProductDetails.body)['product']['category'];
      price = jsonDecode(getProductDetails.body)['product']['price'];
      productDetails = jsonDecode(getProductDetails.body)['product']['productDetails'];
      image1 = jsonDecode(getProductDetails.body)['product']['image1'];
      image2 = jsonDecode(getProductDetails.body)['product']['image2'];
    }
    if (getProductDetails.statusCode != 200){
      var content = jsonDecode(getProductDetails.body)['message'];
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: content.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    getProductDetails().whenComplete((){
      setState(() {
        _saving=false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Expanded(
                  child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
                child: OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    )),
              )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Expanded(
                  flex: 3,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[900]),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Buy now',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '($price INR)',
                                style: TextStyle(
                                  color: Colors.grey[100],
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045),
                              ),
                            ],
                          )))),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          )),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.grey[500],
      //   icon: Icon(Icons.shopping_bag),
      //   label: Text('Add Bag'),
      //   onPressed: (){
      //     print('Add in bag');
      //   },
      // ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          int sensitivity = 20;
          if (details.delta.dx > sensitivity) {
            Navigator.pop(context);
          } else if (details.delta.dx < -sensitivity) {}
        },
        child: ModalProgressHUD(
          inAsyncCall: _saving,
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
                      child: Icon(Icons.shopping_bag),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return BagItems();
                        }));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$productName',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(companySquareImage)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(companySquareImage)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$companyShortName Product Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$shortDesc',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Category',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$category',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Product Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$productDetails',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Model',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'JCB 3DX, 4DX',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Specification',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
