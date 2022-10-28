import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Benthor me debe regresar un solo xml', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resultado =
        await repositorio.obtenerXml(NickFormado.constructor('benthor'));
    resultado.match((l) {
      assert(false);
    }, (r) {
      expect(r.length, equals(1));
    });
  });
  test('Fokuleh me debe regresar 4 xml', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resultado =
        await repositorio.obtenerXml(NickFormado.constructor('fokuleh'));
    resultado.match((l) {
      assert(false);
    }, (r) {
      expect(r.length, equals(4));
    });
  });
  test('Si le paso algo me debe regresar un problema', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resultado =
        await repositorio.obtenerXml(NickFormado.constructor('uwuowo'));
    expect(resultado.isLeft(), true);
  });
}
