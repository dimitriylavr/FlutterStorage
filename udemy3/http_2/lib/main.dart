import 'package:flutter/material.dart';
import 'package:http_2/model/monitor.dart';
import 'package:http_2/webz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      title: "Работа с JSON",
      home: HomePageState(),
    );
  }
}

class HomePageState extends StatefulWidget {
  HomePageState({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageState> {
  late Future<MonitorList> monitorList;

  @override
  void initState() {
    super.initState();
    monitorList = getMonitorList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Монитор выдачи",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<MonitorList>(
        future: monitorList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.monitor.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text("${snapshot.data?.monitor[index].time}"),
                      title: Text("${snapshot.data?.monitor[index].model}"),
                      subtitle: Text("${snapshot.data?.monitor[index].number}"),
                      trailing: Text("${snapshot.data?.monitor[index].master}"),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("Error 2");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
