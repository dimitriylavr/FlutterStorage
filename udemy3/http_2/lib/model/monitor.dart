import 'dart:convert';

import 'package:http/http.dart' as http;

class MonitorList {
  List<Monitor> monitor;
  MonitorList({required this.monitor});

  factory MonitorList.fromJson(Map<String, dynamic> json) {
    var monitorJson = json['data'] as List;

    List<Monitor> monitorList =
        monitorJson.map((i) => Monitor.fromJson(i)).toList();

    return MonitorList(
      monitor: monitorList,
    );
  }
}

class Monitor {
  final String time;
  final String master;
  final String model;
  final String number;
  final String customer;
  final String status;

  Monitor(
      {required this.time,
      required this.master,
      required this.model,
      required this.number,
      required this.customer,
      required this.status});

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      time: json['time'] as String,
      master: json['master'] as String,
      model: json['model'] as String,
      number: json['number'] as String,
      customer: json['customer'] as String,
      status: json['status'] as String,
    );
  }
}

Future<MonitorList> getMonitorList() async {
  const url =
      'http://administrator:120330211203@10.25.1.219:2376/mjr/hs/api/v3/monitor';

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json; charset=UTF-8'
  };

  final response = await http.get(Uri.parse(url), headers: requestHeaders);

  if (response.statusCode == 200) {
    var results = MonitorList.fromJson(json.decode(response.body));
    print(results);
    return results;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
