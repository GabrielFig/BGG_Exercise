import 'package:boar_game/dominio/problema.dart';

class JuegoJugado {
  final String nombre;
  final String id;

  JuegoJugado._({
    required this.nombre,
    required this.id,
  });

  factory JuegoJugado.constructor(String nombrePropuesta, idPropuesta) {
    if (nombrePropuesta.trim().isEmpty) throw JuegoJugadoMalFormado();
    if (idPropuesta.trim().isEmpty) throw JuegoJugadoMalFormado();
    return JuegoJugado._(nombre: nombrePropuesta, id: idPropuesta);
  }

  @override
  bool operator ==(covariant JuegoJugado other) {
    if (identical(this, other)) return true;

    return other.nombre == nombre && other.id == id;
  }

  @override
  int get hashCode => nombre.hashCode ^ id.hashCode;
}
