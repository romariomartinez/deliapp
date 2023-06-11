import 'package:appdeli/feactures/presentacion/productos/bandejas_mixtas_widget.dart';
import 'package:appdeli/feactures/presentacion/productos/productos_widget.dart';
import 'package:appdeli/feactures/presentacion/tabs/favourite_tabs/favourite_tabs.dart';
import 'package:appdeli/feactures/presentacion/widget/AppWidget.dart';

import 'package:appdeli/feactures/presentacion/widget/drawerwidget.dart';

import 'package:appdeli/ui/providers/app_providers.dart';
import 'package:appdeli/ui/providers/app_providers2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_tabs/car_tabs.dart';

class HomeTabs extends StatefulWidget {
  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose(); // Libera el controlador al finalizar
    super.dispose();
  }

  final List<String> imageList = [
    "images/1.png",
    "images/2.png",
    "images/3.png",
    "images/4.png",
    "images/3.png",
  ];

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: ListView(
        children: [
          AppWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [],
          ),

          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 18 / 9,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
            ),
            items: imageList.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // CategoriaWidgetTabs(),
          const Padding(
              padding: EdgeInsets.only(top: 9, left: 30),
              child: Text(
                "BANDEJAS",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          ProductosWidget(),
          const Padding(
              padding: EdgeInsets.only(top: 9, left: 30),
              child: Text(
                "BANDEJAS MIXTAS",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          BandejasMixtaWidget(),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}

class TabsPages extends StatefulWidget {
  TabsPages({Key? key}) : super(key: key);

  @override
  State<TabsPages> createState() => _TabsPagesState();
}

class _TabsPagesState extends State<TabsPages> {
  List<Widget> _widgetOptions = [
    HomeTabs(),
    FavouriteTabs(),
    Cartabs(),
  ];

  int _selectedItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    AppProvider2 provider2 = Provider.of<AppProvider2>(context);
    int sumContador = provider.countFavorite + provider2.countFavorite;
    int sumContador2 = provider.countCar + provider2.countCar;
    return BottomNavigationBar(
      iconSize: 30.0,
      selectedItemColor: Colors.orange.shade500,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _cambiarWidget,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: "Favoritos",
          tooltip: sumContador.toString(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.cart),
          label: "My car",
          tooltip: sumContador2.toString(),
        ),
      ],
    );
  }
}
