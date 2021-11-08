import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          centerTitle: true,
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<ListItem> items = List<ListItem>.generate(
      500,
      (i) => i % 6 == 0
          ? HeadingItem("Heading $i")
          : MessageItem("Sender $i", "Message body $i"));

  return ListView.builder(
      padding: EdgeInsets.all(5),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
            leading: Icon(Icons.add_a_photo_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          );
        }
        return SizedBox();
        /* return Card(
          child: ListTile(
            title: Text("${items[index]}"),
            leading: Icon(
              Icons.insert_chart,
              color: Colors.red,
            ),
            trailing: Icon(Icons.account_box),
          ),
        ); */
      });
}

abstract class ListItem {}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}
