import 'package:boar_game/caracteristicas/dominio/juego_jugado.dart';
import 'package:boar_game/caracteristicas/dominio/problemas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mismo nombre diferente id son diferentes', () {
    JuegoJugado j1 = JuegoJugado.constructor('uno', '1');
    JuegoJugado j2 = JuegoJugado.constructor('uno', '2');
    expect(j1 == j2, equals(false));
  });

  test('mismo nombre misma id son iguales', () {
    JuegoJugado j1 = JuegoJugado.constructor('uno', '1');
    JuegoJugado j2 = JuegoJugado.constructor('uno', '1');
    expect(j1 == j2, equals(true));
  });

  test('no se permite nombre vacio', () {
    expect(() => JuegoJugado.constructor('j1', ''),
        throwsA(isA<JuegoJugadoMalFormado>()));
  });
}
