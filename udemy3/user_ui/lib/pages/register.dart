import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _hidePass = true;
  bool _hideConPass = true;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

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
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              TextFormField(
                validator: (val) =>
                    val!.isEmpty ? 'Поле обязательно для заполения' : null,
                controller: _nameController,
                decoration: const InputDecoration(
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
                validator: (val) =>
                    val!.isEmpty ? 'Поле обязательно для заполения' : null,
                controller: _phoneController,
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
                controller: _emailController,
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
                controller: _storyController,
                decoration: InputDecoration(
                    labelText: "Story",
                    hintText: "Расскажи о себе",
                    border: OutlineInputBorder()),
                maxLines: 3,
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _hidePass,
                validator: _validatorPassword,
                decoration: InputDecoration(
                    labelText: "Password *",
                    hintText: "Enter the password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                      icon: Icon(
                          _hidePass ? Icons.visibility : Icons.visibility_off),
                    ),
                    icon: Icon(Icons.security)),
                maxLength: 8,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _confirmPassController,
                obscureText: _hideConPass,
                maxLength: 8,
                validator: _validatorPassword,
                decoration: InputDecoration(
                    labelText: "Confirm password *",
                    hintText: "Confirm the password",
                    suffixIcon: IconButton(
                      icon: Icon(_hideConPass
                          ? Icons.visibility
                          : Icons.visibility_off),
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
                onPressed: () {
                  _submitForm();
                },
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Всё успешно");
      print("Имя: ${_nameController.text}");
      print("Телефон: ${_phoneController.text}");
      print("Почта: ${_emailController.text}");
      print("История: ${_storyController.text}");
    } else {
      print("Форма не заполнена");
    }
  }

  String? _validatorPassword(String? value) {
    if (_passwordController.text != _confirmPassController.text) {
      return 'пароли не совпадают!';
    } else {
      return null;
    }
  }
}
