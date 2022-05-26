import 'package:agenda_sqlite/helpers/contact_helper.dart';
import 'package:agenda_sqlite/models/contact_models.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
 Contact? contact;
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Agenda',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: FutureBuilder<List<Contact>>(
            future: ContactHelper().getAllContacts(),
            builder:
                (BuildContext context,
                AsyncSnapshot<List<Contact>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20,vertical: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white60,
                        ),
                        child: DropdownButton<Contact>(
                          isExpanded: true,
                          icon: const Icon(Icons.person),
                          items: snapshot.data!
                              .map((contact) => DropdownMenuItem<Contact>(
                                    child: Text(contact.name.toString()),
                                    value: contact,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                            value = value;
                              print(value);
                            });
                          },
                          hint: const Text('Selecione Contato'),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
