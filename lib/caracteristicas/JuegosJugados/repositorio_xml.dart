import 'dart:io';

import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

abstract class RepositorioXml {
  Future<Either<Problema, List<String>>> obtenerXml(NickFormado nick);
}

class RepositorioXmlPruebas extends RepositorioXml {
  final tamanoPagina = 2;
  @override
  Future<Either<Problema, List<String>>> obtenerXml(NickFormado nick) async {
    if (!['benthor', 'fokuleh'].contains(nick.valor)) {
      return Left(UsuarioNoRegistrado());
    }
    try {
      String elXml = File(
              './test/caracteristicas/juegosJugados/${nick.valor.toLowerCase()}1.xml')
          .readAsStringSync();
      int cuantasPaginas = _obtenerCuantasPaginasDesdeXml(elXml);
      List<String> nombresPaginas =
          _obtenerNombresPaginas(cuantasPaginas, nick);
      return Right(
          nombresPaginas.map((e) => File(e).readAsStringSync()).toList());
    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }

  int _obtenerCuantasPaginasDesdeXml(String elXml) {
    XmlDocument documento = XmlDocument.parse(elXml);
    int totalJugadas =
        int.parse(documento.getElement("plays")!.getAttribute("total")!);
    int paginas = (totalJugadas / tamanoPagina).ceil();
    return paginas;
  }

  List<String> _obtenerNombresPaginas(int cuantasPaginas, NickFormado nick) {
    var base = './test/caracteristicas/juegosJugados/${nick.valor}';
    List<String> lista = [];
    for (var i = 1; i <= cuantasPaginas; i++) {
      lista.add('$base$i.xml');
    }
    return lista;
  }
}
