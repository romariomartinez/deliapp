import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({Key? key}) : super(key: key);

  @override
  _ProfileTabsState createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          'Perfil De Usuario',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(''), // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Image.asset(
                        "images/container.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          "images/LOGO.png",
                          // Ruta del avatar
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                        width:
                            30), // Adjust the spacing between the icon and the text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Correo Electrónico",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            _user?.email ?? "",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Ubicación'),
                  subtitle: Text('Valledupar, Cesar'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.local_phone),
                  title: Text('Numero de telefono'),
                  subtitle: Text('3245703281'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.directions),
                  title: Text('Dirrecion'),
                  subtitle: Text('Cl 6c # 16-112'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
