import 'package:appdeli/feactures/presentacion/tabs/home_tabs/home_tabs.dart';
import 'package:appdeli/ui/auth/editar_perfil.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  User? _user;

  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange.shade500,
                image: DecorationImage(
                    image: AssetImage('images/container2.png'),
                    fit: BoxFit.cover),
              ),
              accountName: Text(
                _user?.displayName ?? "",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              accountEmail: Text(
                _user?.email ?? "",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage("")),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabsPages()),
              );
            },
            child: Row(
              children: [
                Icon(CupertinoIcons.home, color: Colors.orange.shade500),
                SizedBox(width: 8),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.edit, color: Colors.orange.shade500),
              title: const Text(
                "Editar perfil",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Confirmar",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      "¿Desea cerrar sesión?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.orange.shade500),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Cierra el cuadro de diálogo
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Aceptar",
                          style: TextStyle(color: Colors.orange.shade500),
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Get.offAllNamed("/login");
                        },
                      ),
                    ],
                  );
                },
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.exit_to_app_rounded,
                  color: Colors.orange.shade500),
              title: const Text(
                "Cerrar Sesión",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
