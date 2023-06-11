import 'dart:io';
import 'package:appdeli/feactures/domain/controller/controllerPerfilFirebase.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  ControlUserPerfil controlup = Get.find();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlCiudad = TextEditingController();
  TextEditingController controlDireccion = TextEditingController();
  TextEditingController controlCelular = TextEditingController();
  TextEditingController controlObser = TextEditingController();

  ImagePicker picker = ImagePicker();
  var _image;

  _galeria() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
      //_image = File(image!.path);
    });
  }

  _camara() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
      // _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("Editar Perfil"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    _opcioncamara(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: _image != null
                          ? Image.file(
                              _image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            )
                          : Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Establecer bordes circulares
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controlApellido,
                decoration: InputDecoration(
                  labelText: "Apellido",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controlCiudad,
                decoration: InputDecoration(
                  labelText: "Ciudad",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controlDireccion,
                decoration: InputDecoration(
                  labelText: "Direccion",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controlCelular,
                decoration: InputDecoration(
                  labelText: "Celular",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controlObser,
                decoration: InputDecoration(
                  labelText: "Observacion",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors
                      .orange.shade500), // Cambiar el color de fondo del botón
                ),
                child: const Text(
                  "Editar Perfil",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  var catalogo = <String, dynamic>{
                    'nombre': controlNombre.text,
                    'apellido': controlApellido.text,
                    'ciudad': controlCiudad.text,
                    'direccion': controlDireccion.text,
                    'celular': controlCelular.text,
                    'foto': ''
                  };

                  controlup.crearcatalogo(catalogo, _image);
                  //Peticiones.crearcatalogo(catalogo, _image);

                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

//Seleccionar la camara o la galeria

  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Imagen de Galeria'),
                      onTap: () {
                        _galeria();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Capturar Imagen'),
                    onTap: () {
                      _camara();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
