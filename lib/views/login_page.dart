import 'dart:convert';

import 'package:agenda_sqlite/components/button_widget.dart';
import 'package:agenda_sqlite/components/text_form_field.dart';
import 'package:agenda_sqlite/components/text_widget.dart';
import 'package:agenda_sqlite/constants/preferences.dart';
import 'package:agenda_sqlite/models/login_models.dart';
import 'package:agenda_sqlite/utils/service_validate.dart';
import 'package:agenda_sqlite/views/cadastro_login_page.dart';
import 'package:agenda_sqlite/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ContainerWidget(text: 'Login'),
              _CustonClipper(),
              const SizedBox(height: 100),
              _MounthAreaEmail(),
              const SizedBox(height: 10),
              _MounthAreaLogin(),
              _MounthAreaForgtPassword(context),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  _doLogin();
                },
                child: ButtonWidget(
                  text: 'Login',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cadastro()));
                },
                child: Textwidget(
                  cadastro: 'Nao tem Cadastro?  ',
                  login: 'Cadastrar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _CustonClipper() {
    return ClipPath(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
          ),
          gradient: LinearGradient(
              colors: [(Colors.grey), (Colors.pink)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        height: 180,
      ),
      // clipper: MycustonClipper(),
    );
  }

  _MounthAreaForgtPassword(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20),
      alignment: Alignment.centerRight,
      child: InkWell(
        child: const Text(
          'Esqueceu a Senha?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {},
      ),
    );
  }

  _MounthAreaLogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          'Senha',
          'digite a senha',
          const Icon(
            Icons.vpn_key,
            color: Colors.blue,
          ),
          sulfixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          controller: senhaController,
          obscureText: _obscureText,
        ),
      ),
    );
  }

  _MounthAreaEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          'Email',
          'digite email',
          const Icon(
            Icons.email,
            color: Colors.blue,
          ),
          controller: emailController,
          obscureText: false,
          validator: Validate().validateEmail,
        ),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = emailController.text;
    String passForm = senhaController.text;
    LoginModel savedUser = await _getSavedUser();
    if (mailForm == savedUser.mail && passForm == savedUser.password) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login ou senha Invalidos'),
        ),
      );
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(preferencesKeys.activeUser);
    Map<String, dynamic> mapUser = jsonDecode(jsonUser!);
    LoginModel loginModel = LoginModel.fromJson(mapUser);
    return loginModel;
  }
}
