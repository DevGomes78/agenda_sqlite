
import 'package:agenda_sqlite/views/schedule_page.dart';
import 'package:agenda_sqlite/views/user_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Clinica Estetica ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              height: 550,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UserList()));
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(

                          child: Column(
                            children: const [
                              SizedBox(height: 20),
                              Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.orange,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Contatos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AgendaPage(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          child: Column(
                            children: const [
                              SizedBox(height: 20),
                              Icon(
                                Icons.article,
                                size: 80,
                                color: Colors.red,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Agenda',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: const [
                            SizedBox(height: 20),
                            Icon(
                              Icons.account_box_rounded,
                              size: 80,
                              color: Colors.teal,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Fornecedores',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: const [
                            SizedBox(height: 20),
                            Icon(
                              Icons.receipt_sharp,
                              size: 80,
                              color: Colors.blue,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Relatorios',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}