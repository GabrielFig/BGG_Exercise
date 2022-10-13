import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

abstract class repositorioJuegoJugado {
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegoJugado(
      NickFormado nick);
}

class RepositorioJuegoJugadoPruebas extends repositorioJuegoJugado {
  @override
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegoJugado(
      NickFormado nick) {
    // TODO: implement obtenerJuegoJugado
    throw UnimplementedError();
  }
}

Either<Problema, Set<JuegoJugado>> obtenerJuegosJugadosXML(
    XmlDocument documento) {
  const campoNOmbre = 'item name';
  const campoJuego = 'objectid';
  final juego = obtenerJueg
}
