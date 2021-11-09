import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _hidePass = true;
  bool _hideConPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register form",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Form(
          child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: "Ful name *",
              hintText: "Пиши уже что нибудь",
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.yellow, width: 2),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "Phone number *",
              hintText: "+7(ХХХ)ХХХ-ХХ-ХХ",
              helperText: "+7(ХХХ)ХХХ-ХХХХ",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.yellow, width: 2),
              ),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter a email adress",
                icon: Icon(Icons.email)),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Story",
                hintText: "Расскажи о себе",
                border: OutlineInputBorder()),
            maxLines: 3,
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            obscureText: _hidePass,
            decoration: InputDecoration(
                labelText: "Password *",
                hintText: "Enter the password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                ),
                icon: Icon(Icons.security)),
            maxLength: 8,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: _hideConPass,
            maxLength: 8,
            decoration: InputDecoration(
                labelText: "Confirm password *",
                hintText: "Confirm the password",
                suffixIcon: IconButton(
                  icon: Icon(
                      _hideConPass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hideConPass = !_hideConPass;
                    });
                  },
                ),
                icon: Icon(Icons.border_color)),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Отправить",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.red),
          )
        ],
      )),
    );
  }
}
