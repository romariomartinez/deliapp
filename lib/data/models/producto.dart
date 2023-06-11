class Producto{
  final String titulo;
  final String titulo2;
  final String foto;
  late bool favorite;
  final String descripcion;
  final String detalle;
  final int precio;
  late bool car;

  Producto({
    required this.titulo,
    required this.titulo2,
    required this.foto,
    required this.favorite,
    required this.descripcion,
    required this.detalle,
    required this.precio,
    required this.car,
  });
}