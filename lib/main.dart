import 'package:app2/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankAPP());

class ByteBankAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencias(),
    );
  }
}








