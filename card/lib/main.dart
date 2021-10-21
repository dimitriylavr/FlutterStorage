import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Карточка контакты',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomaPage(),
    );
  }
}

class HomaPage extends StatelessWidget {
  const HomaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff5affba),
            Color(0xff94f9ff),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 260,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue,
                  foregroundImage: NetworkImage(
                      'https://www.nj.com/resizer/zovGSasCaR41h_yUGYHXbVTQW2A=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg'),
                ),
                const SizedBox(
                  height: 12,
                ),
                const InfoRow(
                    icon: Icons.account_circle, text: 'Lucas Lorenco'),
                const SizedBox(
                  height: 4,
                ),
                InfoRow(
                    icon: Icons.email,
                    text: 'hello@letitcode.ru',
                    onTap: () {
                      _launchURL('mailto:hello@letitcode.ru');
                    }),
                const SizedBox(
                  height: 4,
                ),
                InfoRow(
                  icon: Icons.link,
                  text: 'https://letitcode.ru',
                  onTap: () {
                    _launchURL('https://letitcode.ru');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Не удалось загрузить $url';
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const InfoRow({Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(
            width: 6,
          ),
          Flexible(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                decoration: onTap != null
                    ? TextDecoration.underline
                    : TextDecoration.none),
          ))
        ],
      ),
    );
  }
}
