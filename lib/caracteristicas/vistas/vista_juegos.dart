import 'package:boar_game/dominio/variable_dominio.dart';
import 'package:flutter/material.dart';

class VistaListaJuegos extends StatelessWidget {
  const VistaListaJuegos({Key? key, required this.games, required this.player})
      : super(key: key);
  final List<String> games;
  final NickFormado player;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: player.valor,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Usuario : ${player.valor}')),
            body: ListView(children: games.map(_buildItem).toList())));
  }
}

Widget _buildItem(String textTitle) {
  return ListTile(
    title: Text(textTitle),
    leading: const Icon(Icons.add_circle_rounded),
    onTap: () {},
  );
}
