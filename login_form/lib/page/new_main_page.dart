import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_form/const/config.dart';
import 'package:login_form/models/job.dart';
import 'package:http/http.dart' as http;

class NewMainPage extends StatefulWidget {
  static const routeName = "newMainPage";

  @override
  _NewMainPageState createState() => _NewMainPageState();
}

class _NewMainPageState extends State<NewMainPage> {
  List<dynamic> jobList = [];

  Future<void> readJson() async {
    final response = await http.get(Uri.parse(baseUrl));
    final data = await json.decode(response.body);

    // final String response = await rootBundle.loadString('assets/jobs.json');
    // final data = await json.decode(response);

    //print(data);
    setState(() {
      jobList = data['records']
          .map((data) => Job.fromJson(data)).toList();
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
            padding: EdgeInsets.only(left: 20),
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey.shade600,)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notifications_none, color: Colors.grey.shade400,)
            ),
          )
        ],
        title: Container(
          height: 45,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              ),
              hintText: "Search e.g Software Developer",
              hintStyle: TextStyle(fontSize: 14),

            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: jobList.length,
            itemBuilder: (context, index) {
              return jobComponent(job: jobList[index]);
            }),
      ),
    );
  }

  jobComponent({required Job job}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(job.company),
                          )
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(job.name, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                              SizedBox(height: 5,),
                              Text(job.phone, style: TextStyle(color: Colors.grey[500])),
                            ]
                        ),
                      )
                    ]
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    job.isMyFav = !job.isMyFav;
                  });
                },
                child: AnimatedContainer(
                    height: 35,
                    padding: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: job.isMyFav ? Colors.red.shade100 : Colors.grey.shade300,)
                    ),
                    child: Center(
                        child: job.isMyFav ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_outline, color: Colors.grey.shade600,)
                    )
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200
                      ),
                      child: Text(job.company, style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffbf2038).withAlpha(20)
                      ),
                      child: Text(job.email, style: TextStyle(color: Color(0xffbf2038)),),
                    )
                  ],
                ),
                Text(job.name, style: TextStyle(color: Colors.grey.shade800, fontSize: 12),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
