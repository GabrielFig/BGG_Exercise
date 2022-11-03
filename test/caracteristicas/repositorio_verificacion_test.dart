import 'package:boar_game/caracteristicas/repositorio_verificacion.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/registro_usuario.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas de verificacion offline', () {
    test('Con benthor me regresa valor', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();
      var resultado = repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('benthor'));
      resultado.match((l) => expect(false, equals(true)), (r) {
        expect(r.anioRegistro, equals(2012));
        expect(r.nombre, equals('Benthor'));
        expect(r.apellido, equals('Benthor'));
        expect(r.estado, equals(mensajeCampoVacio));
        expect(r.pais, equals(mensajeCampoVacio));
      });
    });
    test('con AMLO me regresa error', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();
      var resultado =
          repositorio.obtenerRegistroUsuario(NickFormado.constructor('amlo'));

      resultado.match((l) {
        expect(true, equals(true));
      }, (r) {
        expect(true, equals(false));
      });
    });
    test('Con incorrecto', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();
      var resultado =
          repositorio.obtenerRegistroUsuario(NickFormado.constructor('amlo'));

      resultado.match((l) {
        expect(l, isA<VersionIncorrectaXml>());
      }, (r) {
        assert(false);
      });
    });
  });
}
