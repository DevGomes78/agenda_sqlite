import 'dart:convert';

import 'package:agenda_sqlite/components/button_widget.dart';
import 'package:agenda_sqlite/components/container_widget.dart';
import 'package:agenda_sqlite/components/text_form_field.dart';
import 'package:agenda_sqlite/components/text_widget.dart';
import 'package:agenda_sqlite/constants/preferences.dart';
import 'package:agenda_sqlite/constants/service_constants.dart';
import 'package:agenda_sqlite/models/login_models.dart';
import 'package:agenda_sqlite/utils/service_validate.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  TextEditingController nomeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _mountAreaNome(),
                    const SizedBox(height: 10),
                    _mountAreaEmail(),
                    const SizedBox(height: 10),
                    _MountAreaPassword(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Textwidget(
                  cadastro: ServiceConstants.MountAreaRegisterLogin,
                  login: ServiceConstants.MountAreaLoginName,
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    LoginModel login = LoginModel(
                      nome: nomeController.text,
                      password: senhaController.text,
                      mail: emailController.text,
                    );
                    _saveUser(login);
                  }
                  nomeController.clear();
                  emailController.clear();
                  senhaController.clear();
                },
                child: ButtonWidget(
                  text: ServiceConstants.MountAreaRegister,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _MountAreaPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        ServiceConstants.MountAreaLogin,
        ServiceConstants.MountAreaDigiteLogin,
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
        validator: Validate().validateSenha,
      ),
    );
  }

  _mountAreaEmail() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        ServiceConstants.MountAreaEmail,
        ServiceConstants.MountAreaDigiteEmail,
        const Icon(
          Icons.email,
          color: Colors.blue,
        ),
        controller: emailController,
        obscureText: false,
        validator: Validate().validateEmail,
      ),
    );
  }

  _mountAreaNome() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        ServiceConstants.MountAreaName,
        ServiceConstants.MountAreaRegisterName,
        const Icon(
          Icons.person_add,
          color: Colors.blue,
        ),
        controller: nomeController,
        obscureText: false,
        validator: Validate().validateNome,
      ),
    );
  }

  void _saveUser(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      preferencesKeys.activeUser,
      jsonEncode(loginModel.toJson()),
    );
  }
}
