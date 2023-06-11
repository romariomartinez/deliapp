import 'package:get/get.dart';

import '../../data/service/peticionesPerfilFirebase.dart';

class ControlUserPerfil extends GetxController {
  Future<void> crearcatalogo(Map<String, dynamic> catalogo, foto) async {
    await Peticiones.crearcatalogo(catalogo, foto);
  }
}
