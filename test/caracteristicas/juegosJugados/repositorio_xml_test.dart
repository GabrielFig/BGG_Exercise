import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('si le paso benthor me debe regresar un solo xml', () async {
    RepositorioXml repositorio = RepositorioXmlPruebas();
    final resultado =
        await repositorio.obtenerXml(NickFormado.constructor('benthor'));
    resultado.match((l) {
      assert(false);
    }, (r) => expect(r.length, equals(1)));
  });

  test('si le paso fokuleh me debe regresar 4', () async {
    RepositorioXml repositorio = RepositorioXmlPruebas();
    final resultado =
        await repositorio.obtenerXml(NickFormado.constructor('fokuleh'));
    resultado.match((l) {
      assert(false);
    }, (r) => expect(r.length, equals(4)));
  });
}
