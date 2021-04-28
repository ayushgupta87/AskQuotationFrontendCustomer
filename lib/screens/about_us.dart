import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                Image.asset(companyPngImage, width: MediaQuery.of(context).size.width * 0.3),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.09,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    companyPngImage,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(aboutCompany,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
