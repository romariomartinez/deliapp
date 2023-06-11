import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feactures/domain/controller/controllerUserFirebase.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

/// poner al otro proyecto
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

/// poner al otro proyecto

class _RegisterState extends State<Register> {
  void vaildation() {
    /// poner al otro proyecto
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Si");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    //ControlUser controlu = Get.find();
    //ControlUserFirebase controlfb = Get.find();
    ControlUserAuth controlua = Get.find();
    TextEditingController nombre = TextEditingController();
    TextEditingController user = TextEditingController();
    TextEditingController passw = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/registre.png'), fit: BoxFit.cover),
      ),
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.27),
                child: Column(children: [
                  const SizedBox(
                    height: 120,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Complete Usuario";
                      } else if (value.isEmpty) {
                        return "Usuario Demasiado Corto";
                      }
                      return null;
                    },
                    controller: nombre,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Colors.orange), // Cambia el color a rojo
                      ),
                      hintText: 'Nombre',
                      hintStyle: const TextStyle(color: Colors.white),
                      errorStyle: const TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      // Guardar en la base de datos
                      // Ejemplo: db.guardarNombre(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        /// poner al otro proyecto
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Colors.white), // Cambia el color a rojo
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.white),
                      errorStyle: const TextStyle(color: Colors.black),

                      /// poner al otro proyecto
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
                    controller: passw,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        /// poner al otro proyecto
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Colors.white), // Cambia el color a rojo
                      ),
                      hintText: 'Contraseña',
                      hintStyle: const TextStyle(color: Colors.white),
                      errorStyle: const TextStyle(color: Colors.black),

                      /// poner al otro proyecto
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      vaildation();

                      /// poner al otro proyecto
                      controlua.crearUser(user.text, passw.text).then((value) {
                        if (controlua.userValido == null) {
                          Get.snackbar("Usuarios", controlua.mensajesUser,
                              duration: const Duration(seconds: 4),
                              backgroundColor: Colors.amber);
                        } else {
                          Get.snackbar("Usuarios", controlua.mensajesUser,
                              duration: const Duration(seconds: 4),
                              backgroundColor: Colors.amber);
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(250, 50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Registrarse',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      "Ya Tienes Cuenta ?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: const Text(
                        'Iniciar Sección',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
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
