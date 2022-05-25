import 'dart:async';
import 'dart:io';
import 'package:agenda_sqlite/components/text_form_field.dart';
import 'package:agenda_sqlite/models/contact_models.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Contact? _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact!.name!;
      _emailController.text = _editedContact!.email!;
      _phoneController.text = _editedContact!.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: Text(_editedContact!.name ?? "Novo Contato"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),),
              gradient: LinearGradient(
                  colors: [(Colors.grey), (Colors.pink)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 150),
              _editNome(),
              const SizedBox(height: 10),
              _editiEmail(),
              const SizedBox(height: 10),
              _editTelefone(),
              const SizedBox(height: 30),
              btnSave(),
            ],
          ),
        ),
      ),
    );
  }

  btnSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (_editedContact!.name != null && _editedContact!.name!.isNotEmpty) {
            Navigator.pop(context, _editedContact);
          } else {
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
                colors: [(Colors.grey), (Colors.pink)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: const Text(
            'Salvar',
            style: TextStyle(
              color: Colors.white,fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  _editTelefone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          "Telefone",
          'Digite o Telefone',
          const Icon(Icons.phone, color: Colors.blue),
          controller: _phoneController,
          onChanged: (text) {
            _userEdited = true;
            _editedContact!.phone = text;
          },
        ),
      ),
    );
  }

  _editiEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          "Email",
          'Digite o Email',
          const Icon(Icons.email, color: Colors.blue),
          controller: _emailController,
          onChanged: (text) {
            _userEdited = true;
            _editedContact!.email = text;
          },
        ),
      ),
    );
  }

  _editNome() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          "Nome",
          'Digite o Nome',
          const Icon(Icons.people, color: Colors.blue),
          controller: _nameController,
          onChanged: (text) {
            _userEdited = true;
            setState(() {
              _editedContact!.name = text;
            });
          },
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: [
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}