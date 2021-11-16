import 'dart:convert';

import 'package:http/http.dart' as http;

class MonitorList {
  List<Monitor> monitor;
  MonitorList({required this.monitor});

  factory MonitorList.fromJson(Map<String, dynamic> json) {
    var monitorJson = json['data'] as List;

    List<Monitor> monitorList =
        monitorJson.map((i) => Monitor.fromJson(i)).toList();

    return MonitorList(monitor: monitorList);
  }
}

class Monitor {
  final String time;
  final String model;
  final String number;
  final String kontr;
  final String status;

  Monitor(
      {required this.time,
      required this.model,
      required this.number,
      required this.kontr,
      required this.status});

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
        time: json['time'] as String,
        model: json['model'] as String,
        number: json['number'] as String,
        kontr: json['kontr'] as String,
        status: json['status'] as String);
  }
}

Future<MonitorList> getMonitor() async {
  const url =
      'http://administrator:120330211203@10.25.1.219:2376/mjr/hs/api/v3/monitor';

  Map<String, String> requestHeader = {
    'Content-type': 'application/json',
    'Accept': 'application/json; charset=UTF-8'
  };

  final response = await http.get(Uri.parse(url), headers: requestHeader);

  if (response.statusCode == 200) {
    var result = MonitorList.fromJson(json.decode(response.body));
    return result;
  } else {
    throw Exception('Ошибка ${response.reasonPhrase}');
  }
}
