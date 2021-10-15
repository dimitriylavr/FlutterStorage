import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_form/const/color.dart';
import 'package:login_form/const/config.dart';
import 'package:login_form/models/goods.dart';
import 'package:login_form/models/order.dart';
import 'package:login_form/page/main_page.dart';

class GoodsPage extends StatefulWidget {
  final String id;
  final String userName;
  final String userPhone;

  const GoodsPage(this.id, this.userName, this.userPhone);

  static const routeName = "goodsPage";

  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  List<dynamic> orderList = [];
  List<dynamic> goodsList = [];

  Future<void> readJson() async {
    final response = await http.get(Uri.parse(
        baseUrl + 'api/order/get?token=' + token + '&orderid=' + widget.id));
    final data = await json.decode(response.body);

    setState(() {
      //orderList = data['records'].map((data) => Order.fromJson(data)).toList();
      goodsList =
          data['records']['goods'].map((data) => Goods.fromJson(data)).toList();
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
      body: Wrap(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                          onPressed: () => Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MainPage()),
                                  (Route<dynamic> route) => false)),
                      IconButton(
                          icon: Icon(Icons.search_sharp),
                          color: Colors.white,
                          onPressed: null),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.userName,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                widget.userPhone,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 22,
                                child: Text(
                                  "Заказ: ${widget.id}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(Icons.face),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Номенклатура",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        Container(
                          width: 159,
                          height: 0.5,
                          margin: EdgeInsets.only(top: 16),
                          color: mainColor,
                        )
                      ],
                    ),
                    Container(
                      height: 600,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 25, bottom: 50),
                          itemCount: goodsList.length,
                          itemBuilder: (context, index) {
                            return orderComponent(goods: goodsList[index]);
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  orderComponent({required Goods goods}) {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            'https://via.placeholder.com/150/92c952',
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${goods.name}',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2A2A2A),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                    '{goods.code}'
                ),
              ),
              Container(
                width: 130,
                height: 20,
                child: Text(
                  "Бренд",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 8,
                    color: Color(0XFFA29F9F),
                  ),
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              width: 88,
              height: 30,
              decoration: BoxDecoration(
                  color: Color(0XFF00D99E),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 15),
                      color: Color(0XFF00D99E).withOpacity(.6),
                      spreadRadius: -9,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Заказать",
                    style: TextStyle(
                        fontSize: 14, color: Colors.white, letterSpacing: 1),
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
