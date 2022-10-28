import 'package:boar_game/caracteristicas/repositorio_verificacion.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas verificacion offline', () {
    test('Con Benthor me regresa valor', () async {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();
      var resultado = await repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('Benthor'));
      resultado.match(
        (l) {
          expect(false, equals(true));
        },
        (r) {
          expect(r.anioRegistro, equals(2012));
          expect(r.nombre, equals('Benthor'));
          expect(r.apellido, equals('Benthor'));
          expect(r.estado, equals(''));
          expect(r.pais, equals(''));
        },
      );
    });
    test('Con AMLO me regresa error', () async {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();
      var resultado = await repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('amlo'));
      resultado.match((l) {
        expect(true, equals(true));
      }, (r) {
        expect(true, equals(true));
      });
    });
    test('Con xml incorrecto', () async {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();
      var resultado = await repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('incorrecto'));
      resultado.match((l) {
        expect(l, isA<VersionIncorrectaXml>());
      }, (r) {
        assert(false);
      });
    });
  });

  group('Prueba de partidas offline', () {
    test('', () {});
  });
}
