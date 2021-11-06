import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Погода",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black54,
            onPressed: () {
              print("Menu");
            },
          ),
          actions: [
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  print("Settings");
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: buildBody(),
      ),
    );
  }
}

Widget buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _weatherDescription(),
              Divider(),
              _temperatura(),
              Divider(),
              _temperatureForecast(),
              Divider(),
              _footerRatings(),
            ],
          ),
        ))
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        "https://www.allstick.ru/@s/image-cache/cfa/cfa172e610fa-u..product~12~12214~5b22d9406e2d5.fit.max.w.1000~xgxgxgx.jpg"),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    children: <Widget>[
      Text(
        "Понедельник - Сентябрь 21",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      ),
      Divider(
        height: 25,
        color: Colors.black87,
      ),
      Text(
        "Классический текст Lorem Ipsum, используемый с XVI века, приведён ниже. Также даны разделы 1.10.32 и 1.10.33 \"de Finibus Bonorum et Malorum\" Цицерона и их английский перевод, сделанный H. Rackham, 1914 год.",
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.black45, fontSize: 16),
      ),
    ],
  );
}

Row _temperatura() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
            size: 50,
          ),
        ],
      ),
      const SizedBox(
        width: 15,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "15 C",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          Row(
            children: const [
              Text("Moscow"),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
      spacing: 10,
      children: List.generate(8, (int index) {
        return Chip(
            backgroundColor: Colors.grey[100],
            padding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(color: Colors.black12),
            avatar: Icon(
              Icons.cloud,
              color: Colors.blue[200],
            ),
            label: Text(
              "${index + 20} C",
              style: TextStyle(fontSize: 16),
            ));
      }));
}

Row _footerRatings() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Погода.ру",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        width: 25,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        color: Colors.black,
      ),
      Icon(
        Icons.star,
        color: Colors.black,
      ),
    ],
  );
}
