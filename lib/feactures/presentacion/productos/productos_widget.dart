import 'package:appdeli/feactures/presentacion/productos/detalles_productos.dart';
import 'package:appdeli/ui/providers/app_providers.dart';
import 'package:appdeli/ui/providers/app_providers2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductosWidget extends StatefulWidget {
  const ProductosWidget({Key? key});

  @override
  State<ProductosWidget> createState() => _ProductosWidgetState();
}

class _ProductosWidgetState extends State<ProductosWidget> {
  late List<int> numOfItems;

  @override
  Widget build(BuildContext context) {
    final productos = context.watch<AppProvider2>().productos;
    AppProvider2 appProvider2 = Provider.of<AppProvider2>(context);
    AppProvider appProvider = Provider.of<AppProvider>(context);
    numOfItems = List<int>.filled(productos.length, 1);

    return SizedBox(
      width: 170,
      height: 225,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productos.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 200,
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
                    image: AssetImage('images/container.png'),
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalleProducto(
                                    key: Key('DetalleProducto_$index'),
                                    titulo: productos[index].titulo2,
                                    foto: productos[index].foto,
                                    detalle: productos[index].detalle,
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  appProvider2.productos[index].foto),
                            ),
                          ),
                          Text(
                            productos[index].titulo,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(productos[index].descripcion),
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
                          Text('\$${productos[index].precio.toString()}'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              appProvider2.editFavorite(index: index);
                            });
                          },
                          child: productos[index].favorite
                              ? const Icon(Icons.favorite_outlined)
                              : Icon(Icons.favorite_outline_sharp),
                        ),
                        SizedBox(height: 120),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              appProvider2.editCar(index: index);
                              if (productos[index].car) {
                                appProvider.listaCarritos.add(productos[index]);
                              } else {
                                appProvider.listaCarritos
                                    .remove(productos[index]);
                              }
                            });
                          },
                          child: productos[index].car
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
    );
  }
}

Widget iconStar() {
  return Icon(Icons.star, color: Colors.orange);
}
