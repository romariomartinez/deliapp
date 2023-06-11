import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../ui/providers/app_providers.dart';
import '../../../../ui/providers/app_providers2.dart';

class Cartabs extends StatefulWidget {
  const Cartabs({Key? key}) : super(key: key);

  @override
  State<Cartabs> createState() => _CartabsState();
}

class _CartabsState extends State<Cartabs> {
  late List<int> numOfItems;

  @override
  void initState() {
    super.initState();
    numOfItems = [];
  }

  final String phoneNumber = '3245703281'; // Replace with your WhatsApp number

  int domicilio = 4000; // Ejemplo de valor de domicilio

  void sendWhatsAppMessage() async {
    String message = '¡Hola! Estoy interesado en los siguientes productos:\n\n';

    double total = 0.0;

    // Agrega los nombres de las bandejas, precios y totales de los productos al mensaje

    String url =
        'https://api.whatsApp.com/send?phone=$phoneNumber?text=${Uri.encodeComponent(message)}';
    await launch(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir WhatsApp';
    }
  }

  Widget buildOutlineButton({
    required IconData icon,
    required VoidCallback press,
    required int index,
  }) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return OutlinedButton(
      onPressed: press,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    AppProvider2 appProvider2 = Provider.of<AppProvider2>(context);

    List<dynamic> carritoGral = [];
    carritoGral.addAll(appProvider.listaCarritos);
    carritoGral.addAll(appProvider2.listaCarritos);

    numOfItems = List<int>.filled(carritoGral.length, 1);
    final bandejas = context.watch<AppProvider>().bandejas;

    List<double> calculo = [];
    calculo.add(appProvider.calcularPrecioTotalGral2());
    calculo.add(appProvider2.calcularPrecioTotalGral2());

    double total =
        calculo.fold(0.0, (previousValue, element) => previousValue + element);

    appProvider.calcularPrecioTotalGral();
    int domicilio = 4000;

    double totalgeneral = total + domicilio;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed("/TabsPages");
            }, // Volver a la pantalla anterior
          ),
          title: Text(
            'Listar Carrito',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true, // Centrar el título
          backgroundColor:
              Colors.orange.shade500, // Cambiar el color de fondo de la barra
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            carritoGral.length != 0
                ? const Text(
                    'Carritos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : const SizedBox(),
            Expanded(
              child: Center(
                child: carritoGral.length == 0
                    ? Image.asset(
                        "images/carrito1.png",
                        height: 220,
                        width: 220,
                      )
                    : SizedBox(
                        child: ListView.builder(
                          itemCount: carritoGral.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                setState(() {
                                  carritoGral.removeAt(index);
                                });
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                child: Card(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: Image.network(
                                          carritoGral[index].foto,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              carritoGral[index].titulo,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              carritoGral[index].descripcion,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$${carritoGral[index].precio.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    buildOutlineButton(
                                                      icon: Icons.remove,
                                                      press: () {
                                                        setState(() {
                                                          if (numOfItems[
                                                                  index] >
                                                              1) {
                                                            numOfItems[index]--;
                                                            carritoGral[index]
                                                                    .cantidadBandejas =
                                                                numOfItems[
                                                                    index];
                                                            calculo;
                                                          }
                                                        });
                                                      },
                                                      index: index,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 2),
                                                      child: Text(
                                                        numOfItems[index]
                                                            .toString()
                                                            .padLeft(2, "0"),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                      ),
                                                    ),
                                                    buildOutlineButton(
                                                      icon: Icons.add,
                                                      press: () {
                                                        setState(() {
                                                          if (numOfItems[
                                                                  index] <
                                                              99) {
                                                            numOfItems[index]++;
                                                            carritoGral[index]
                                                                    .cantidadBandejas =
                                                                numOfItems[
                                                                    index];
                                                            calculo;
                                                          }
                                                        });
                                                      },
                                                      index: index,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Subtotal:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Domicilio:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '\$${total}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${domicilio.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${totalgeneral}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: appProvider.listaCarritos.isEmpty
                  ? null
                  : () {
                      sendWhatsAppMessage();
                    },
              icon: Icon(FontAwesomeIcons.whatsapp),
              label: Text('Pedir por WhatsApp'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green,
                ),
              ),
            ),
          ],
        ));
  }
}
