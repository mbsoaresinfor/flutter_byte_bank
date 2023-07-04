import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icondata;

  Editor({this.controlador, this.rotulo, this.dica, this.icondata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          hintText: dica,
          labelText: rotulo,
          icon: icondata != null ? Icon(icondata) : null,
        ),
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
