import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_juegojugado.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('benthor juega 5 jeugos diferentes', () async {
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas();
    final resultado = await repositorio
        .obtenerJugadasRegistradas(NickFormado.constructor('Benthor'));
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) {
      expect(resultado.length(), equals(5));
    });
  });
}
