import 'package:appdeli/feactures/presentacion/productos/detalles_productos.dart';
import 'package:appdeli/ui/providers/app_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/bandeja.dart';

class BandejasMixtaWidget extends StatefulWidget {
  const BandejasMixtaWidget({super.key});

  @override
  _BandejasMixtaWidgetState createState() => _BandejasMixtaWidgetState();
}

class _BandejasMixtaWidgetState extends State<BandejasMixtaWidget> {
  @override
  Widget build(BuildContext context) {
    final bandejas = context.watch<AppProvider>().bandejas;
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    List<Bandeja> bandejass = List<Bandeja>.from(appProvider.bandejas);

    if (appProvider.searchQuery.isNotEmpty) {
      bandejass = bandejas
          .where((bandeja) => bandeja.titulo
              .toLowerCase()
              .contains(appProvider.searchQuery.toLowerCase()))
          .toList();
    }

    return SizedBox(
      width: 400,
      height: 1100,
      child: SingleChildScrollView(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: bandejass.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('images/container2.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalleProducto(
                                key: Key('DetalleProducto_$index'),
                                titulo: bandejas[index].titulo2,
                                foto: bandejas[index].foto,
                                detalle: bandejas[index].detalle,
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(appProvider
                              .bandejas[index]
                              .foto), //AssetImage(bandejas[index].foto),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bandejas[index].titulo,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bandejas[index].descripcion,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              iconStar(),
                              iconStar(),
                              iconStar(),
                              iconStar(),
                              const Icon(
                                Icons.star,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Text('\$${bandejas[index].precio.toString()}'),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                appProvider.editFavorite(index: index);
                              });
                            },
                            child: bandejas[index].favorite == true
                                ? const Icon(Icons.favorite_outlined)
                                : Icon(Icons.favorite_outline_sharp),
                          ),
                          SizedBox(
                            height: 120,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                appProvider.editCar(index: index);
                              });
                            },
                            child: bandejas[index].car == true
                                ? const Icon(CupertinoIcons.cart_fill)
                                : Icon(CupertinoIcons.cart),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget iconStar() {
  return Icon(Icons.star, color: Colors.orange);
}
