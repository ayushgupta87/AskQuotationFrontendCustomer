import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:ask_quotation_customer/company_data/container_data.dart';
import 'package:flutter/material.dart';

Widget KbuildTextBox(TextEditingController inputController, String labelText,
    Icon icon, int lines, TextInputType textInputType, bool isHidden) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
    child: TextField(
      maxLines: lines,
      controller: inputController,
      keyboardType: textInputType,
      obscureText: isHidden,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        icon: icon,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    ),
  );
}


Widget kbuildSignupLogin(BuildContext context, String title, function) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.6,
    height: MediaQuery.of(context).size.height * 0.06,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black
      ),
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
      ),
    ),
  );
}


class kshowDialogue {
  String titleis;
  String contentIs;
  kshowDialogue(this.titleis, this.contentIs);

  showAlertDialoge(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text('Ok'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(titleis),
      content: SingleChildScrollView(child: Text(contentIs)),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

Widget kCardViewShort(BuildContext context, int itemCount){
  return ListView.builder(
    itemCount: itemCount,
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
              ],
            ),
          ),
        ),
      );
    },
  );
}


Widget kCategoryCardView(BuildContext context, int itemCount){
  return ListView.builder(
    itemCount: itemCount,
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
  );
}

Widget kHomePageTopCategories(BuildContext context, int itemCount, List categoryListItems){
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: itemCount,
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
                    'categoryListIs[i].categoryName',
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
  );
}