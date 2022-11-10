import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_imagenes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('url de imagen y nombre del creador LOCAL', () async {
    RepositorioImagenesPrueba repositorio = RepositorioImagenesPrueba();
    var res = await repositorio.obtenerImagen('70919');
    res.match((l) => null, (r) {
      expect(r[1], 'Antoine Bauza');
    });
  });
}
