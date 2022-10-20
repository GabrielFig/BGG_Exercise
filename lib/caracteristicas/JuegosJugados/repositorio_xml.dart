import 'dart:io';

import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

abstract class RepositorioXml {
  Future<Either<Problema, List<String>>> obtenerXml(NickFormado nickFormado);
}

class RepositorioXmlPruebas extends RepositorioXml {
  final tamanoPagina = 2;
  @override
  Future<Either<Problema, List<String>>> obtenerXml(
      NickFormado nickFormado) async {
        if (nickFormado.valor == 'benthor') {
          try {
            String xml = File('/test/caracteristicas/juegosJugados/benthor.xml')
              .readAsStringSync();
            int cuantasPaginas = _obtenerCuantasPaginasDesdeXml(xml);
            List<String> nombrePaginas = 
              _obtenerNombresPaginas(cuantasPaginas, nickFormado);
            return Right(
              nombrePaginas.map((e) => File(e).readAsString()).toList());
            
          } catch (e) {
              return left(VersionIncorrectaXml());
      } 
            
          }
    return Left(UsuarioNoRegistrado());
  }
  
  int _obtenerCuantasPaginasDesdeXml(String xml) {
    XmlDocument documento = XmlDocument.parse(xml);
    String cadenaNumero = documento.getElement('plays')!.getAttribute('total')!;
    int numero  = int.parse(cadenaNumero);
    return (numero/tamanoPagina).ceil();
  }

  List<String> _obtenerNombresPaginas(int cuantasPaginas, NickFormado nickFormado) {
    const base = '/test/caracteristicas/juegosJugados/$(nickFormado.valor)1.xml';
    List<String> lista = [];
    for (var i = 0; i < cuantasPaginas; i++) {
      lista.add('$base'+'$i'+'xml');
    }
    return lista;
  }
}