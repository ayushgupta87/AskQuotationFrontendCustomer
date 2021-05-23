import 'package:ask_quotation_customer/company_data/company_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BagItems extends StatefulWidget {
  const BagItems({Key key}) : super(key: key);

  @override
  _BagItemsState createState() => _BagItemsState();
}

class _BagItemsState extends State<BagItems> {
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
              child: Center(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        color: Colors.white,
                        child: Card(
                          color: Colors.grey[100],
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset(companySquareImage),
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Test Name'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Notes',
                          color: Colors.grey[600],
                          icon: Icons.note_add_sharp,
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
