import 'dart:io';

import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';
import '../../dominio/variable_dominio.dart';

abstract class RepositorioJuegosJugados {
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJugadasRegistradas(
      NickFormado nick);
}

class RepositorioJuegosJugadosPruebas extends RepositorioJuegosJugados {
  @override
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJugadasRegistradas(
      NickFormado nick) async {
    String elXml = _obtenerXmlJugadasDelDisco(nombre: nick.valor);
    final resultado = _obtenerJuegosJugadosDesdeXML(elXml);
    return resultado;
  }
}

String _obtenerXmlJugadasDelDisco({required String nombre}) {
  return File('/test/caracteristicas/juegosJugados/benthor.xml')
      .readAsStringSync();
}

Either<Problema, Set<JuegoJugado>> _obtenerJuegosJugadosDesdeXML(String elXml) {
  try {
    XmlDocument documento = XmlDocument.parse(elXml);
    final losPlay = documento.findAllElements('item');
    final connjuntoIterable = losPlay.map((e) {
      String nombre = e.getAttribute('name')!;
      String id = e.getAttribute('objectid')!;
      return JuegoJugado.constructor(nombre, id);
    });
    final conjunto = Set<JuegoJugado>.from(connjuntoIterable);
    return Right(conjunto);
  } catch (e) {
    return Left(VersionIncorrectaXml());
  }
}
