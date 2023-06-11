import 'package:flutter/foundation.dart';

import '../../data/models/producto.dart';

class AppProvider2 with ChangeNotifier, DiagnosticableTreeMixin {
  String searchQuery = '';

//lista de productos
  List<Producto> productos = [
    Producto(
      titulo: 'Deditos\nde Queso',
      titulo2: 'DEDITOS DE QUESO',
      foto: 'images/deditoqueso.png',
      favorite: false,
      descripcion: '(Deditos x 20 und \n 9cm (fritos)',
      detalle:
          'Gracias a su tamaño y portabilidad, pueden disfrutar de estos deliciosos\nbocadillos mientras pasean o como una opción rápida para llevar. Su combinación\nde queso derretido, masa crujiente y sabor inigualable los convierte en un bocado\nirresistible para los amantes del queso.',
      precio: 24000,
      car: false,
    ),
    Producto(
      titulo: 'Deditos\nde Queso',
      titulo2: 'DEDITOS DE QUESO',
      foto: 'images/deditoscrudos.png',
      favorite: false,
      descripcion: '(Deditos x 20 und \n 9cm (crudos)',
      detalle:
          'Estos deditos de queso crudas son ideales para freír en casa y disfrutar de unos\nbocados deliciosos y caseros. Son perfectos, ya que ofrecen una opción sabrosa y\npráctica para aquellos que desean deleitarse con un bocado crujiente y lleno de\nqueso fundido.',
      precio: 20000,
      car: false,
    ),
    Producto(
      titulo: 'Bolitas\nde carne',
      titulo2: 'BOLITAS DE CARNE',
      foto: 'images/bolita.png',
      favorite: false,
      descripcion: '(Bolitas x 20 und \n (fritos)',
      detalle:
          'Las bolitas de carne son una deliciosa opción de comida Estas bolitas y deditos\nconsisten en una mezcla de carne sazonada con especias, condimentos en\ningredientes adicionales como cebolla, ajo,pimientos u otras hierbas aromáticas\npara realzar aún más el sabor de la carne que le dan un sabor único y sabroso.',
      precio: 15000,
      car: false,
    ),
    Producto(
      titulo: 'Empanadas\nde carne',
      titulo2: 'EMPANADAS DE CARNE',
      foto: 'images/empanadasfritas.png',
      favorite: false,
      descripcion: '(Empanada x 20 und \n 8cm (fritos)',
      detalle:
          'las empanadas de pollo de 8 cm son una opción deliciosa y práctica. Con su masa\ncrujiente y relleno jugoso de pollo sazonado, son una opción irresistible para\naquellos que buscan una experiencia gastronómica rápida y sabrosa.',
      precio: 26000,
      car: false,
    ),
    Producto(
      titulo: 'Empanadas\nde carne',
      titulo2: 'EMPANADAS DE CARNE',
      foto: 'images/crudas.png',
      favorite: false,
      descripcion: 'Empanada x 20 und\n8cm (crudos)',
      detalle:
          'Las empanadas de carne crudas de 9 cm son una opción conveniente y deliciosa para\naquellos que desean disfrutar de unas empanadas caseras recién preparadas en la\ncomodidad de su hogar. Estas empanadas están listas para freír y ofrecen la\nposibilidad de disfrutar de un bocado sabroso y crujiente en cualquier momento.',
      precio: 22000,
      car: false,
    ),
    Producto(
      titulo: 'Empanadas\nde pollo',
      titulo2: 'EMPANADAS DE POLLO',
      foto: 'images/empanadasfritas.png',
      favorite: false,
      descripcion: 'Empanada x 20 und\n8cm (fritos)',
      detalle:
          'las empanadas de pollo de 8 cm son una opción deliciosa y práctica. Con su masa\ncrujiente y relleno jugoso de pollo desmenuzado y sazonado con especias, son una\nopción irresistible para aquellos que buscan una experiencia gastronómica rápida y\nsabrosa.',
      precio: 26000,
      car: false,
    ),
    Producto(
      titulo: 'Empanadas\nde pollo',
      titulo2: 'EMPANADAS DE POLLO',
      foto: 'images/crudas.png',
      favorite: false,
      descripcion: '(Empanada x 20 und\n8cm(crudos)',
      detalle:
          'Las empanadas de pollo crudas de 8 cm son una opción conveniente y deliciosa para\naquellos que desean disfrutar de unas empanadas caseras recién preparadas en la\ncomodidad de su hogar. Estas empanadas están listas para freír y ofrecen la\nposibilidad de disfrutar de un bocado sabroso y crujiente en cualquier momento.',
      precio: 22000,
      car: false,
    ),
  ];

  // int _count = 0;

  // int get count => _count;

  void editFavorite({int index = 1}) {
    Producto itemToEdit = productos[index];
    itemToEdit.favorite = !itemToEdit.favorite;
    productos[index] = itemToEdit;
    // _count++;

    listFavorites();
    notifyListeners();
  }
  //creame una lista con los favoritos de la lista productos

  int favorite = 0;
  int get countFavorite => favorite;

  List favoritos = [];
  List get listaFavoritos => favoritos;

  void listFavorites() {
    List<Producto> favorites =
        productos.where((element) => element.favorite == true).toList();
    favorite = favorites.length;
    favoritos = favorites;
    notifyListeners();
  }

///////////////////////
  void editCar({int index = 1}) {
    Producto itemToEdit = productos[index];
    itemToEdit.car = !itemToEdit.car;
    productos[index] = itemToEdit;
    // _count++;

    listCars();
    notifyListeners();
  }
  //creame una lista con los carritos de la lista bandejas

  int car = 0;
  int get countCar => car;

  List carritos = [];
  List get listaCarritos => carritos;

  void listCars() {
    List<Producto> cars =
        productos.where((element) => element.car == true).toList();
    car = cars.length;
    carritos = cars;
    notifyListeners();
  }

  //

  List<int> numOfItems = List<int>.filled(
      5, 1); // Inicializa la lista con valores iniciales de 1 para cada bandeja

  // ... métodos y propiedades existentes ...

  // Agregar el siguiente método para obtener el número de items para una bandeja específica
  int getNumOfItems(int index) {
    return numOfItems[index];
  }

  // Agregar el siguiente método para incrementar el número de items para una bandeja específica
  void incrementNumOfItems(int index) {
    numOfItems[index]++;
    notifyListeners();
  }

  // Agregar el siguiente método para decrementar el número de items para una bandeja específica
  void decrementNumOfItems(int index) {
    if (numOfItems[index] > 1) {
      numOfItems[index]--;
      notifyListeners();
    }
  }

  double precioTotal = 0.0;
  double get total => precioTotal;

  void calcularPrecioTotal() {
    precioTotal = 0.0;
    for (int i = 0; i < productos.length; i++) {
      if (productos[i].car) {
        precioTotal += productos[i].precio * numOfItems[i];
      }
    }
    notifyListeners();
  }

  double totalGral = 0.0;
  double subtotal = 0.0;

  void calcularPrecioTotalGral() {
    subtotal = 0.0;
    for (int i = 0; i < carritos.length; i++) {
      subtotal += carritos[i].precio * numOfItems[i];
    }
    totalGral = subtotal;
    notifyListeners();
  }

  double calcularPrecioTotalGral2() {
    double subtotal = 0.0;
    for (int i = 0; i < carritos.length; i++) {
      subtotal += carritos[i].precio * numOfItems[i];
    }
    return subtotal;
  }

  void calcularDescuento(double porcentajeDescuento) {
    if (porcentajeDescuento >= 0 && porcentajeDescuento <= 100) {
      double descuento = (porcentajeDescuento / 100) * subtotal;
      totalGral = subtotal - descuento;
      notifyListeners();
    }
  }
}
