import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_juegojugado.dart';
import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('benthor juega 5 jeugos diferentes', () async {
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas();
    final resultado = await repositorio
        .obtenerJugadasRegistradas(NickFormado.constructor('benthor'));
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) {
      expect(resultado.length(), equals(5));
    });
  });

  test('takenoko juega 5 jeugos diferentes', () async {
    RepositorioJuegosJugadosPruebas repositorio =
        RepositorioJuegosJugadosPruebas();
    final resultado = await repositorio
        .obtenerJugadasRegistradas(NickFormado.constructor('benthor'));
    final takenoko = JuegoJugado.constructor('takenoko', '70919');
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) {
      expect(r.contains(takenoko), equals(true));
    });
  });

  test('fokuleh debe tener 4 paginas', () async {
    RepositorioJuegosJugados repositorio = RepositorioJuegosJugadosPruebas();
    final resultado = await RepositorioJuegosJugadosPruebas();
  });
}
