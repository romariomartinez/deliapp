import 'package:flutter/foundation.dart';

import '../../data/models/bandeja.dart';

class AppProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String searchQuery = '';
//lista de bandejas
  List<Bandeja> bandejas = [
    Bandeja(
      titulo: 'Bandeja Mixta #1',
      titulo2: 'BANDEJA MIXTA #1',
      foto: 'images/Bandeja.png',
      favorite: false,
      descripcion: '(20 deditos, 12 bolitas, 9 \n empanadas)(crudas)',
      detalle:
          'Presentamos nuestra bandeja mixta lista para llevar a casa y disfrutar de\nuna experiencia culinaria desde la comodidad de tu hogar. La bandeja contiene\nuna variedad de delicias crudas que podrás freír según tus preferencias.\nIncluye:\n\n* 20 deditos crudos\n* 12 bolitas de carne crudas\n* 9 empanadas crudas\nCon nuestra bandeja mixta cruda, te brindamos la libertad de cocinar tus\nalimentos a tu gusto y en el momento que desees. Además, podrás disfrutar de la\nfrescura y calidad de nuestros ingredientes. Sorprende a tu familia y amigos\ncon una comida casera que deleitará sus paladares.Llévate a casa nuestra\nbandeja mixta cruda y conviértete en el chef de tu propio hogar',
      precio: 20000,
      car: false,
    ),
    Bandeja(
      titulo: 'Bandeja Mixta #2',
      titulo2: 'BANDEJA MIXTA #2',
      foto: 'images/Bandeja.png',
      favorite: false,
      descripcion: '(20 deditos, 12 bolitas, 9 \n empanadas)(fritos)',
      detalle:
          'Presentamos nuestra bandeja mixta lista para llevar a casa y disfrutar de una\nexperiencia culinaria desde la comodidad de tu hogar. La bandeja contiene una\nvariedad de delicias fritas y listas para degustar.\nIncluye:\n\n* 20 deditos fritos y crujientes\n* 12 bolitas de carne fritas y jugosas\n* 9 empanadas doradas y sabrosas\nLlévate a casa nuestra bandeja mixta y disfruta de una comida deliciosa sin\nesfuerzo. Los deditos, bolitas de carne y empanadas están preparados de antemano\ny han sido fritos a la perfección para garantizar una textura crujiente y un\nsabor excepcional.',
      precio: 30000,
      car: false,
    ),
    Bandeja(
      titulo: 'Bandeja Mixta #3',
      titulo2: 'BANDEJA MIXTA #3',
      foto: 'images/Bandeja.png',
      favorite: false,
      descripcion: '(15 deditos, 10 bolitas, 7 \n empanadas)(crudas)',
      detalle:
          'Presentamos nuestra bandeja mixta lista para llevar a casa y disfrutar de\nuna experiencia culinaria desde la comodidad de tu hogar. La bandeja contiene\nuna variedad de delicias crudas que podrás freír según tus preferencias.\nIncluye:\n\n* 15 deditos crudos\n* 10 bolitas de carne crudas\n* 7 empanadas crudas\nCon nuestra bandeja mixta cruda, te brindamos la libertad de cocinar tus\nalimentos a tu gusto y en el momento que desees. Además, podrás disfrutar de la\nfrescura y calidad de nuestros ingredientes. Sorprende a tu familia y amigos\ncon una comida casera que deleitará sus paladares.Llévate a casa nuestra\nbandeja mixta cruda y conviértete en el chef de tu propio hogar',
      precio: 15000,
      car: false,
    ),
    Bandeja(
      titulo: 'Bandeja Mixta #4',
      titulo2: 'BANDEJA MIXTA #4',
      foto: 'images/Bandeja.png',
      favorite: false,
      descripcion: '(15 deditos, 10 bolitas, 7 \n empanadas)(fritos)',
      detalle:
          'Presentamos nuestra bandeja mixta lista para llevar a casa y disfrutar de una\nexperiencia culinaria desde la comodidad de tu hogar. La bandeja contiene una\nvariedad de delicias fritas y listas para degustar.\nIncluye:\n\n* 15 deditos fritos y crujientes\n* 10 bolitas de carne fritas y jugosas\n* 7 empanadas doradas y sabrosas\nLlévate a casa nuestra bandeja mixta y disfruta de una comida deliciosa sin\nesfuerzo. Los deditos, bolitas de carne y empanadas están preparados de antemano\ny han sido fritos a la perfección para garantizar una textura crujiente y un\nsabor excepcional.',
      precio: 24000,
      car: false,
    ),
    Bandeja(
      titulo: 'Bandeja Mixta #5',
      titulo2: 'BANDEJA MIXTA #5',
      foto: 'images/Bandeja.png',
      favorite: false,
      descripcion: '(10 deditos, 12 bolitas, 9 \n empanadas)(fritos)',
      detalle:
          'Presentamos nuestra bandeja mixta lista para llevar a casa y disfrutar de una\nexperiencia culinaria desde la comodidad de tu hogar. La bandeja contiene una\nvariedad de delicias fritas y listas para degustar.\nIncluye:\n\n* 10 deditos fritos y crujientes\n* 12 bolitas de carne fritas y jugosas\n* 9 empanadas doradas y sabrosas\nLlévate a casa nuestra bandeja mixta y disfruta de una comida deliciosa sin\nesfuerzo. Los deditos, bolitas de carne y empanadas están preparados de antemano\ny han sido fritos a la perfección para garantizar una textura crujiente y un\nsabor excepcional.',
      precio: 17000,
      car: false,
    ),
  ];

  // int _count = 0;

  // int get count => _count;

  void editFavorite({int index = 1}) {
    Bandeja itemToEdit = bandejas[index];
    itemToEdit.favorite = !itemToEdit.favorite;
    bandejas[index] = itemToEdit;
    // _count++;

    listFavorites();
    notifyListeners();
  }
  //creame una lista con los favoritos de la lista bandejas

  int favorite = 0;
  int get countFavorite => favorite;

  List favoritos = [];
  List get listaFavoritos => favoritos;

  void listFavorites() {
    List<Bandeja> favorites =
        bandejas.where((element) => element.favorite == true).toList();
    favorite = favorites.length;
    favoritos = favorites;
    notifyListeners();
  }

///////////////////////
  void editCar({int index = 1}) {
    Bandeja itemToEdit = bandejas[index];
    itemToEdit.car = !itemToEdit.car;
    bandejas[index] = itemToEdit;
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
    List<Bandeja> cars =
        bandejas.where((element) => element.car == true).toList();
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
    for (int i = 0; i < bandejas.length; i++) {
      if (bandejas[i].car) {
        precioTotal += bandejas[i].precio * numOfItems[i];
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

  void eliminarProductoCarrito(int index) {}
}
