import 'package:appdeli/data/models/bandeja.dart';
import 'package:appdeli/data/models/producto.dart';
import 'package:appdeli/ui/providers/app_providers2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/providers/app_providers.dart';

class FavouriteTabs extends StatefulWidget {
  const FavouriteTabs({super.key});

  @override
  State<FavouriteTabs> createState() => _FavouriteTabsState();
}

class _FavouriteTabsState extends State<FavouriteTabs> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final bandejas = context.watch<AppProvider>().bandejas;
    AppProvider2 appProvider2 = Provider.of<AppProvider2>(context);
    final productos = context.watch<AppProvider2>().productos;

    List<dynamic> favoritos = [];
    favoritos.addAll(appProvider.listaFavoritos);
    favoritos.addAll(appProvider2.listaFavoritos);

    void removeFromFavorites(int index) {
      setState(() {
        appProvider.editFavorite(index: index);
        appProvider2.editFavorite(index: index);
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        favoritos.length != 0
            ? const Text(
                'Lista de Favoritos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            : const SizedBox(),
        Expanded(
          child: Center(
            child: favoritos.length == 0
                ? const Text('No hay favoritos')
                : SizedBox(
                    width: 400,
                    height: 1100,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: favoritos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                                  CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(
                                      favoritos[index].foto,
                                    ),
                                    //AssetImage(bandejas[index].foto),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(favoritos[index].titulo,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                        favoritos[index].descripcion,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          //icono de estrella
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
                                      Text(
                                          '\$${favoritos[index].precio.toString()}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 120,
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
          ),
        ),
      ],
    );
  }
}

Widget iconStar() {
  return Icon(Icons.star, color: Colors.orange);
}
