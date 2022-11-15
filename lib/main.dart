import 'package:boar_game/caracteristicas/repositorio_verificacion.dart';
import 'package:boar_game/caracteristicas/verificacion/bloc.dart';
import 'package:boar_game/caracteristicas/vistas/vista-NombreNoConfirmado.dart';
import 'package:boar_game/caracteristicas/vistas/vista-cargando.dart';
import 'package:boar_game/caracteristicas/vistas/vista-solicitandoNombre.dart';
import 'package:boar_game/caracteristicas/vistas/vista_juegos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'caracteristicas/vistas/vista-NombreConfirmado.dart';
import 'caracteristicas/vistas/vista-solicitud-actualizacion.dart';

void main() {
  runApp(const MiAplicacionInyectada());
}

class MiAplicacionInyectada extends StatelessWidget {
  const MiAplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion(RepositorioReal());
        Future.delayed(Duration(seconds: 1), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplicacion',
        home: Scaffold(
          body: Builder(
            builder: ((context) {
              var estado = context.watch<BlocVerificacion>().state;
              if (estado is Creandose) {
                return const VistaCargando();
              }
              if (estado is SolicitandoNombre) {
                return const VistaSolicitandoNombre();
              }
              if (estado is MostrandoSolicitudActualizacion) {
                return const VistaMostrandoSolicitudActualizacion();
              }
              // if (estado is MostrandoNombreConfirmado) {
              //   return NombreConfirmado(estado.registroUsuario);
              // }
              // if (estado is MostrandoNombreNoConfirmado) {
              //   return NombreNoConfirmado(estado.nick);
              // }
              // if (estado is EsperandoConfirmacion) {
              //   return const VistaCargando();
              // }
              if (estado is MostrandoListaJuegos) {
                return VistaListaJuegos(
                    games: estado.listaJuegos,
                    player: estado.jugador,
                    data: estado.datos);
              }
              return const Text('Huye');
            }),
          ),
        ));
  }
}
