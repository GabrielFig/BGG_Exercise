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
    final takenoko = JuegoJugado.constructor(
        nombrePropuesta: 'Takenoko', idPropuesta: '70919');
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
    final monopoly = JuegoJugado.constructor(
        idPropuesta: '67182', nombrePropuesta: 'Monopoly');
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
      final fantasyRealms = JuegoJugado.constructor(
          idPropuesta: '223040', nombrePropuesta: 'Fantasy Realms');
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
      final monopoly = JuegoJugado.constructor(
          idPropuesta: '67182', nombrePropuesta: 'Monopoly');
      resultado.match((l) {
        expect(true, equals(true));
        assert(false);
      }, (r) {
        expect(!r.contains(monopoly), equals(true));
      });
    });
  });

  group('repo real con fokuleh', () {
    RepositorioXmlReal repositorioXmlReal = RepositorioXmlReal();
    RepositorioJuegosJugadosReal repositorio =
        RepositorioJuegosJugadosReal(repositorioXmlReal);
    test('fokuleh tiene una cantidad de juegos', () async {
      final response = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      response.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, equals(150));
      });
    });

    test('fokuleh a jugado "Fantasy Realms"', () async {
      final juego = JuegoJugado.constructor(
          idPropuesta: "223040", nombrePropuesta: "Fantasy Realms");

      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      respuesta.match((l) {
        assert(false);
      }, (r) {
        expect(r.contains(juego), true);
      });
    });

    test('fokuleh no a jugado "gta 5"', () async {
      final juego = JuegoJugado.constructor(
          idPropuesta: "999999", nombrePropuesta: "GTA 5");

      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
      respuesta.match((l) {
        assert(false);
      }, (r) {
        expect(r.contains(juego), false);
      });
    });
  });

  group('repo real con benthor', () {
    RepositorioXmlReal repositorioXmlReal = RepositorioXmlReal();
    RepositorioJuegosJugadosReal repositorio =
        RepositorioJuegosJugadosReal(repositorioXmlReal);
    test('benthor tiene una cantidad de juegos', () async {
      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('benthor'));
      respuesta.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, equals(429));
      });
    });

    test('benthor a jugado "Takenoko"', () async {
      final juego = JuegoJugado.constructor(
          idPropuesta: "70919", nombrePropuesta: "Takenoko");

      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('benthor'));
      respuesta.match((l) {
        assert(false);
      }, (r) {
        expect(r.contains(juego), true);
      });
    });

    test('benthor a jugado "Splendor"', () async {
      final juego = JuegoJugado.constructor(
          idPropuesta: "148228", nombrePropuesta: "Splendor");

      final respuesta = await repositorio
          .obtenerJuegosJugados(NickFormado.constructor('benthor'));
      respuesta.match((l) {
        assert(false);
      }, (r) {
        expect(r.contains(juego), true);
      });
    });
  });
}
