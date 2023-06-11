import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetalleProducto extends StatelessWidget {
  final String titulo;
  final String foto;
  final String detalle;

  const DetalleProducto({
    required Key key,
    required this.titulo,
    required this.foto,
    required this.detalle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .orange, // Hace transparente el fondo de la barra de navegación
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle
            .light, // Elimina la sombra de la barra de navegación
      ),
      body: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color:
            Colors.transparent, // Establece el color del Card como transparente
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/container.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage(foto),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(detalle),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          iconStar(),
                          iconStar(),
                          iconStar(),
                          iconStar(),
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iconStar() {
  return Icon(Icons.star, color: Colors.orange);
}
