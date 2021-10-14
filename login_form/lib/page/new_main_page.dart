import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_form/const/color.dart';
import 'package:login_form/const/config.dart';

//import 'package:login_form/models/job.dart';
import 'package:http/http.dart' as http;
import 'package:login_form/models/order.dart';
import 'package:login_form/page/main_page.dart';

class NewMainPage extends StatefulWidget {
  final String id;
  const NewMainPage(this.id);

  static const routeName = "newMainPage";

  @override
  _NewMainPageState createState() => _NewMainPageState();
}

class _NewMainPageState extends State<NewMainPage> {
  List<dynamic> orderList = [];
  List<dynamic> goodsList = [];

  Future<void> readJson() async {
    final response =
        await http.get(Uri.parse(baseUrl + 'api/order/get?token=' + token+'&orderid='+widget.id));
    final data = await json.decode(response.body);

    setState(() {
      orderList = data['records'].map((data) => Order.fromJson(data)).toList();
    });

  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        //backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        toolbarHeight: 60,
        leading: IconButton(
            padding: const EdgeInsets.all(15),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => MainPage()),
                (Route<dynamic> route) => false),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                )),
          )
        ],
        title: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 35),
            height: 40,
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: "Поиск заказа...",
                hintStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              return orderComponent(order: orderList[index]);
            }),
      ),
    );
  }

  orderComponent({required Order order}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            'https://www.behalacollege.in/International_conference/bkend/dist/img/test-img.png'),
                      )),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${order.id} - ${order.username}',
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(order.userphone,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey[500])),
                        ]),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    order.isMyFav = !order.isMyFav;
                  });
                },
                child: AnimatedContainer(
                    height: 35,
                    padding: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: order.isMyFav
                              ? Colors.red.shade100
                              : Colors.grey.shade300,
                        )),
                    child: Center(
                        child: order.isMyFav
                            ? Icon(
                                Icons.add,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ))),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      /*padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),*/
                      child: Text(
                        order.docnum,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    //SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffbf2038).withAlpha(20)),
                      child: Text(
                        order.comment,
                        style: TextStyle(
                          color: Color(0xffbf2038),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  order.status,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
