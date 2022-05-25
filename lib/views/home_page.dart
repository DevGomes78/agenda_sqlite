
import 'package:agenda_sqlite/components/container_widget.dart';
import 'package:agenda_sqlite/views/user_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ContainerWidget(text: 'Clinica'),
            Container(
              height: 450,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserList()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightGreen,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ]
                        ),
                        child: Column(
                          children: const [
                            SizedBox(height: 20),
                            Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.white60,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Contatos',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                            ),
                          ]
                      ),
                      child: Column(
                        children: const [
                          SizedBox(height: 20),
                          Icon(
                            Icons.article,
                            size: 80,
                            color: Colors.white60,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Agenda',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink.withOpacity(0.3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                            ),
                          ]
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.account_box_rounded,
                            size: 80,
                            color: Colors.white60,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Fornecedores',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                            ),
                          ]
                      ),
                      child: Column(
                        children: const [
                          SizedBox(height: 20),
                          Icon(
                            Icons.receipt_sharp,
                            size: 80,
                            color: Colors.white60,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Relatorios',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.water_damage_outlined, size: 30),
              title: Text("Minha conta")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article, size: 30),
              title: Text("Minha Agenda")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              title: Text("Meus Contatos")
          ),
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}