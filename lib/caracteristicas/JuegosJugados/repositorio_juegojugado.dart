import 'dart:io';

import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';
import '../../dominio/variable_dominio.dart';

abstract class RepositorioJuegosJugados {
  final RepositorioXml repositorioXml;
  RepositorioJuegosJugados(this.repositorioXml);
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(
      NickFormado nick);
}

class RepositorioJuegosJugadosPruebas extends RepositorioJuegosJugados {
  RepositorioJuegosJugadosPruebas(repositorioXml) : super(repositorioXml);
  @override
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(
      NickFormado nick) async {
    final Either<Problema, List<String>> resultadoXml =
        await repositorioXml.obtenerXml(nick);
    return resultadoXml.match((l) {
      return Left(l);
    }, (r) {
      final resultado = _obtenerJuegosJugadosDesdeXml(r);
      return resultado;
    });
  }

  Either<Problema, Set<JuegoJugado>> _obtenerUnSoloSet(String elXml) {
    try {
      XmlDocument documento = XmlDocument.parse(elXml);
      final losPlay = documento.findAllElements('item');
      final conjuntoIterable = losPlay.map((e) {
        String nombre = e.getAttribute('name')!;
        String id = e.getAttribute('objectid')!;
        return JuegoJugado.constructor(nombre, id);
      });
      final conjunto = Set<JuegoJugado>.from(conjuntoIterable);
      return Right(conjunto);
    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }

  Either<Problema, Set<JuegoJugado>> _obtenerJuegosJugadosDesdeXml(
      List<String> losXml) {
    final resultado = losXml.map((e) => _obtenerUnSoloSet(e));
    if (resultado.any((element) => element is Problema)) {
      return Left(VersionIncorrectaXml());
    }
    final soloSets = resultado.map((e) => e.getOrElse((l) => {}));
    final conjunto =
        soloSets.fold<Set<JuegoJugado>>({}, (p, a) => p..addAll(a.toList()));
    return Right(conjunto);
  }
}
