// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_imagenes.dart';
import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_juegojugado.dart';
import 'package:boar_game/caracteristicas/JuegosJugados/repositorio_xml.dart';
import 'package:boar_game/caracteristicas/repositorio_verificacion.dart';
import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/registro_usuario.dart';
import 'package:boar_game/dominio/variable_dominio.dart';

class Estado {}

class Creandose extends Estado {}

class SolicitandoNombre extends Estado {}

class MostrarJuegos extends Evento {
  final NickFormado name;

  MostrarJuegos(this.name);
}

class EsperandoListaJuegos extends Estado {}

class EsperandoConfirmacion extends Estado {}

class MostrandoListaJuegos extends Estado {
  final List<String> listaJuegos;
  final NickFormado jugador;

  MostrandoListaJuegos(this.listaJuegos, this.jugador);
}

class MostrandoNombreConfirmado extends Estado {
  final RegistroUsuario registroUsuario;

  MostrandoNombreConfirmado(this.registroUsuario);
}

class MostrandoSolicitudActualizacion extends Estado {}

class MostrandoNombreNoConfirmado extends Estado {
  final NickFormado nick;

  MostrandoNombreNoConfirmado(this.nick);
}

class Evento {}

class Creado extends Evento {}

class NombreRecibido extends Evento {
  final NickFormado nick;
  NombreRecibido(this.nick);
}

class JuegoConfirmado extends Evento {
  final JuegoConfirmado nick;
  JuegoConfirmado(this.nick);
}

class BlocVerificacion extends Bloc<Evento, Estado> {
  final RepositorioVerificacion _repositorioVerificacion;
  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombre());
    });
    on<NombreRecibido>((event, emit) {
      RepositorioImagenesPrueba repositorioImagenes =
          RepositorioImagenesPrueba();
      String file = "";
      if (event.nick.valor == "benthor") {
        try {
          file = File('./lib/caracteristicas/JuegosJugados/all_benthor.txt')
              .readAsStringSync();
        } catch (e) {
          file = "1*prueba\n2*prueba2";
        }
      }
      if (event.nick == "fokuleh") {
        try {
          file = File('./lib/caracteristicas/JuegosJugados/all_fokuleh.txt')
              .readAsStringSync();
        } catch (e) {
          file = "1*nombre\n2*nombre2";
        }
      }

      List<String> listaJuegos = [];
      for (var juego in file.split('\n')) {
        if (juego != "") {
          String nombre = juego.split('*')[1];
          String id = juego.split('*')[0];

          final img = repositorioImagenes.obtenerImagen(id);

          listaJuegos.add('id: $id   nombre: $nombre  img_designer: $img');
        }
      }

      emit(MostrandoListaJuegos(listaJuegos, event.nick));
    });
  }
}
