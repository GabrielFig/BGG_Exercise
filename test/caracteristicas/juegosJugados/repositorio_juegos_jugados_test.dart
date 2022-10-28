import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_juegojugado.dart';
import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('benthor esta bien formado', () async {
    RepositorioXmlPruebas repositorioXmlPruebas = RepositorioXmlPruebas();
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas(repositorioXmlPruebas);
    final resultado = await repositorio
        .obtenerJuegosJugados(NickFormado.constructor('benthor'));
    expect(resultado.isRight(), true);
  });
  test('benthor jugo 2 veces', () async {
    RepositorioXmlPruebas repositorioXmlPruebas = RepositorioXmlPruebas();
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas(repositorioXmlPruebas);
    final resultado = await repositorio
        .obtenerJuegosJugados(NickFormado.constructor('benthor'));
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) {
      expect(r.length, equals(2));
    });
  });
  test('takenoko esta entre los juegos jugados', () async {
    RepositorioXmlPruebas repositorioXmlPruebas = RepositorioXmlPruebas();
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas(repositorioXmlPruebas);
    final resultado = await repositorio
        .obtenerJuegosJugados(NickFormado.constructor('benthor'));
    final takenoko = JuegoJugado.constructor('Takenoko', '70919');
    resultado.match((l) {
      expect(true, equals(true));
    }, (r) {
      expect(r.contains(takenoko), equals(true));
    });
  });
  test('Monopoly No esta entre los juegos jugados', () async {
    RepositorioXmlPruebas repositorioXmlPruebas = RepositorioXmlPruebas();
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas(repositorioXmlPruebas);
    final resultado = await repositorio
        .obtenerJuegosJugados(NickFormado.constructor('benthor'));
    final monopoly = JuegoJugado.constructor('Monopoly', '67182');
    resultado.match((l) {
      //expect(true, equals(true));
      assert(false);
    }, (r) {
      expect(!r.contains(monopoly), equals(true));
    });
  });

  group('Pruebas para fokuleh', () {
    RepositorioXmlPruebas repositorioXmlPruebas = RepositorioXmlPruebas();
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas(repositorioXmlPruebas);
    test('fokuleh esta bien formado', () async {
      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      expect(respuesta.isRight(), true);
    });
    test('fokuleh jugó 6 veces', () async {
      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      respuesta.match((l) {
        expect(true, equals(false));
      }, (r) {
        expect(r.length, equals(6));
      });
    });
    test('fokuleh ha jugado a Fantasy Realms', () async {
      final fantasyRealms = JuegoJugado.constructor('Fantasy Realms', '223040');
      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      respuesta.match((l) {
        expect(true, equals(false));
      }, (r) {
        expect(r.contains(fantasyRealms), true);
      });
    });
    test('fokuleh no ha jugado Monopoly', () async {
      final resultado = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      final monopoly = JuegoJugado.constructor('Monopoly', '67182');
      resultado.match((l) {
        //expect(true, equals(true));
        assert(false);
      }, (r) {
        expect(!r.contains(monopoly), equals(true));
      });
    });
  });
}
