import 'dart:io';

import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';
import '../../dominio/variable_dominio.dart';
import 'package:flutter/cupertino.dart';

abstract class RepositorioJuegosJugados {
  final RepositorioXml repositorioXML;
  RepositorioJuegosJugados(this.repositorioXML);
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(
      NickFormado nick);
}

class RepositorioJuegosJugadosReal extends RepositorioJuegosJugados {
  RepositorioJuegosJugadosReal(RepositorioXml repositorio) : super(repositorio);

  @override
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(
      NickFormado nick) async {
    Either<Problema, List<String>> resultadoXml =
        await repositorioXML.obtenerXml(nick);

    return resultadoXml.match((l) {
      return left(l);
    }, (r) {
      return _obtenerJuegosJugadosDesdeXml(r);
    });
  }
}

//pruebas
class RepositorioJuegosJugadosPruebas extends RepositorioJuegosJugados {
  RepositorioJuegosJugadosPruebas(repositorioXml) : super(repositorioXml);
  @override
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(
      NickFormado nick) async {
    final Either<Problema, List<String>> resultadoXml =
        await repositorioXML.obtenerXml(nick);
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
        return JuegoJugado.constructor(
            idPropuesta: id, nombrePropuesta: nombre);
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

  List<String> _obtenerXmlJugadasDelDisco({required String nombre}) {
    List<String> jugadasPorPaginas = [];
    if (nombre == "benthor") {
      jugadasPorPaginas.add(
          File('.test/caracteristicas/juegosJugados/benthor.xml')
              .readAsStringSync());
    }
    if (nombre == "fokuleh") {
      jugadasPorPaginas.add(
          File('.test/caracteristicas/juegosJugados/fokuleh1.xml')
              .readAsStringSync());
      jugadasPorPaginas.add(
          File('.test/caracteristicas/juegosJugados/fokuleh2.xml')
              .readAsStringSync());
      jugadasPorPaginas.add(
          File('.test/caracteristicas/juegosJugados/fokuleh3.xml')
              .readAsStringSync());
    }
    return jugadasPorPaginas;
  }

  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugadosPorUsuario(
      NickFormado nick) async {
    List<String> losXml = _obtenerXmlJugadasDelDisco(nombre: nick.valor);
    final resulatdo = _obtenerJuegosJugadosDesdeXml(losXml);
    return resulatdo;
  }
}

Either<Problema, Set<JuegoJugado>> _obtenerJuegosJugadosDesdeXml(
    List<String> elXml) {
  final resultado = elXml.map((e) => _obtenerUnSoloSet(e));
  if (resultado.any((element) => element is Problema)) {
    return Left(VersionIncorrectaXml());
  }
  final soloSets = resultado.map((e) => e.getOrElse((l) => {}));

  final conjunto = soloSets.fold<Set<JuegoJugado>>(
      {},
      (Set<JuegoJugado> previo, Set<JuegoJugado> actual) =>
          previo..addAll(actual));
  return Right(conjunto);
}

Either<Problema, Set<JuegoJugado>> _obtenerUnSoloSet(String elXml) {
  try {
    String xmlitemIndex = "item";
    String itemNameAttribute = "name";
    String itemIDAttribute = "objectid";

    XmlDocument documento = XmlDocument.parse(elXml);
    final losPlay = documento.findAllElements(xmlitemIndex);
    final conjuntoIterable = losPlay.map((e) {
      String nombre = e.getAttribute(itemNameAttribute)!;
      String id = e.getAttribute(itemIDAttribute)!;
      return JuegoJugado.constructor(idPropuesta: id, nombrePropuesta: nombre);
    });
    return Right(conjuntoIterable.toSet());
  } catch (e) {
    return Left(VersionIncorrectaXml());
  }
}
