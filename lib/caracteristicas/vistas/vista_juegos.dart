import 'package:boar_game/dominio/juego_jugado.dart';
import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../verificacion/bloc.dart';

class VistaListaJuegos extends StatelessWidget {
  const VistaListaJuegos(
      {Key? key, required this.games, required this.player, required this.data})
      : super(key: key);
  final List<JuegoJugado> games;
  final NickFormado player;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    int contador = games.length;
    List<JuegoJugado> listaJuegos = games.toList();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contador,
              itemBuilder: (context, index) {
                var datosJuego = data.firstWhere((element) {
                  var id = element.split("#")[0];
                  return id == listaJuegos[index].id;
                });
                var idJuego = datosJuego.split("#")[0];
                var link = datosJuego.split("#")[1];
                var disenador = datosJuego.split("#")[2];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: link,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  subtitle: Text(idJuego),
                  title: Text(listaJuegos[index].nombre.toString()),
                  trailing: Text(disenador),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    var bloc = context.read<BlocVerificacion>();
                    bloc.add(NombreRecibido(player));
                  },
                  child: const Text("Regresar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
