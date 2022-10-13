import 'package:bloc/bloc.dart';
import 'package:boar_game/caracteristicas/repositorio_verificacion.dart';
import 'package:boar_game/dominio/problema.dart';
import 'package:boar_game/dominio/registro_usuario.dart';
import 'package:boar_game/dominio/variable_dominio.dart';

class Estado {}

class Creandose extends Estado {}

class SolicitandoNombre extends Estado {}

class EsperandoConfirmacion extends Estado {}

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
  final repositorioVerificacion _repositorioVerificacion;
  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombre());
    });
    on<NombreRecibido>((event, emit) async {
      emit(EsperandoConfirmacion());
      final resultado =
          await _repositorioVerificacion.obtenerRegistroUsuario(event.nick);
      resultado.match((l) {
        if (l is VersionIncorrectaXml) emit(MostrandoSolicitudActualizacion());
        if (l is UsuarioNoRegistrado)
          emit(MostrandoNombreNoConfirmado(event.nick));
      }, (r) {
        emit(MostrandoNombreConfirmado(r));
      });
    });
  }
}
