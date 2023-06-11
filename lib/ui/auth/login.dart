import 'package:appdeli/feactures/domain/controller/controllerUserFirebase.dart';
import 'package:appdeli/ui/auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

class _LoginState extends State<Login> {
  void vaildation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Si");
    } else {
      print("No");
    }
  }

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String emailValue = '';
  String passwordValue = '';

  @override
  Widget build(BuildContext context) {
    ControlUserAuth controlua = Get.find();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login.png'), fit: BoxFit.cover),
      ),
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 80),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      /// poner al otro proyecto
                      if (value == "") {
                        return "Correo Electronico Incompleto";
                      } else if (!regExp.hasMatch(value!)) {
                        return "Correo Electronico Invalido";
                      }
                      return "";
                    },
                    controller: user,
                    onChanged: (value) {
                      setState(() {
                        emailValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.2),
                      filled: true,
                      errorStyle: const TextStyle(color: Colors.black),

                      /// poner al otro proyecto
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: OutlineInputBorder(
                        /// poner al otro proyecto
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      /// poner al otro proyecto
                      if (value == "") {
                        return "Contraseña Incompleta";
                      } else if (value!.length < 8) {
                        return "Contraseña Demasiado Corta";
                      }
                      return "";
                    },
                    controller: pass,
                    onChanged: (value) {
                      setState(() {
                        passwordValue = value;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.2),
                      filled: true,
                      hintText: 'Password',
                      errorStyle: const TextStyle(color: Colors.black),

                      /// poner al otro proyecto
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: OutlineInputBorder(
                        /// poner al otro proyecto
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          vaildation();

                          /// poner al otro proyecto
                          controlua
                              .ingresarUser(user.text, pass.text)
                              .then((value) {
                            if (controlua.userValido == null) {
                              Get.snackbar("Usuarios", controlua.mensajesUser,
                                  duration: const Duration(seconds: 4),
                                  backgroundColor: Colors.orange.shade500);
                            } else {
                              Get.snackbar("Usuarios", controlua.mensajesUser,
                                  duration: const Duration(seconds: 4),
                                  backgroundColor: Colors.orange.shade500);
                              Get.toNamed("/TabsPages");
                            }
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 240,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade500,
                            ),
                            child: const Text(
                              'Iniciar Seccion',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed("/register");
                      },
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ForgoPassword();
                        }));
                      },
                      child: const Text(
                        'Recordar Contraseña',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
