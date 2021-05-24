import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage({Key key}) : super(key: key);

  @override
  _SingleProductPageState createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
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
                  Icons.add_shopping_cart,
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
                      primary: Colors.green[900]
                    ),
                      onPressed: () {},
                      child: Text(
                        'Buy now',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06),
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
                      print('shopping bag clicked');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Product Heading Here !',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            Expanded(child: SingleChildScrollView(
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
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width :10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
