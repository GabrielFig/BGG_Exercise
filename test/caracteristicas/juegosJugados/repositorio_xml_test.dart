import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/caracteristicas/repositorio_verificacion.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/registro_usuario.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Si le paso benthor me debe regresar un sólo xml', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resulatdo =
        await repositorio.obtenerXml(NickFormado.constructor("benthor"));
    resulatdo.match((l) {
      assert(false);
    }, (r) {
      expect(r.length, equals(1));
    });
  });
  test('Si le paso fokuleh me debe regresar cuatro xml', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resulatdo =
        await repositorio.obtenerXml(NickFormado.constructor("fokuleh"));
    resulatdo.match((l) {
      assert(false);
    }, (r) {
      expect(r.length, equals(4));
    });
  });
  test('Si le paso loquesea me debe regresar un problema', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resulatdo =
        await repositorio.obtenerXml(NickFormado.constructor("loqueseaja"));
    expect(resulatdo.isLeft(), true);
  });

  group('Repositorio Real', () {
    test('Si le paso benthor en real es funcional', () async {
      RepositorioXmlReal repositoriorReal = RepositorioXmlReal();
      final resulatdo =
          await repositoriorReal.obtenerXml(NickFormado.constructor('benthor'));
      expect(resulatdo.isRight(), true);
    });

    test('Si le paso fokuleh en real es funcional', () async {
      RepositorioXmlReal repositoriorReal = RepositorioXmlReal();
      final resulatdo =
          await repositoriorReal.obtenerXml(NickFormado.constructor('fokuleh'));
      expect(resulatdo.isRight(), true);
    });
  });
}
