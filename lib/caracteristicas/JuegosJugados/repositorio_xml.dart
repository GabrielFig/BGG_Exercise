import 'dart:io';

import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

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

class RepositorioXmlReal extends RepositorioXml {
  final tamanoPaginaReal = 100;

  int _obtenerCuantasPaginasDesdeXmlReal(String elXml) {
    final documento = XmlDocument.parse(elXml);
    int totalJugadas =
        int.parse(documento.getElement("plays")!.getAttribute("total")!);
    int paginas = (totalJugadas / tamanoPaginaReal).ceil();

    return paginas;
  }

  List<String> _obtenerNombresPaginasReal(
      int cuantasPaginas, NickFormado nick) {
    var base =
        'https://boardgamegeek.com//xmlapi2/plays?username=${nick.valor}';
    List<String> lista = [];
    for (var i = 1; i <= cuantasPaginas; i++) {
      lista.add('$base&page=$i');
    }
    return lista;
  }

  Future<Either<Problema, String>> _obtenerXmlOnline(String nick) async {
    Uri direccion =
        Uri.https('www.boardgamegeek.com', 'xmlapi2/plays', {'username': nick});
    final respuesta = await http.get(direccion);
    if (respuesta.statusCode != 200) {
      return Left(ServidorNoAlcanzado());
    }

    return Right(respuesta.body);
  }

  @override
  Future<Either<Problema, List<String>>> obtenerXml(NickFormado nick) async {
    try {
      final resultado = await _obtenerXmlOnline(nick.valor);
      final elXml = resultado;
      int cuantasPaginas = _obtenerCuantasPaginasDesdeXmlReal(elXml.toString());
      List<String> nombrePaginas =
          _obtenerNombresPaginasReal(cuantasPaginas, nick);
      List<String> resultadoFinal = [];

      for (var pagina in nombrePaginas) {
        final resultadoAPI = await http.get(Uri.parse(pagina));
        resultadoFinal.add(resultadoAPI.body);
      }

      return Right(resultadoFinal);
    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }
}
