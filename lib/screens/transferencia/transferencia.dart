
import 'package:app2/components/editor.dart';
import 'package:app2/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FormularioTransferencias extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  FormularioTransferenciasState();
  }
}

class FormularioTransferenciasState extends State<FormularioTransferencias> {
  final TextEditingController _controllerCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Criando Transferência'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador: _controllerCampoNumeroConta,
                  rotulo: "Número da conta",
                  dica: "0000"),
              Editor(
                  controlador: _controllerCampoValor,
                  rotulo: "Valor",
                  dica: "0.00",
                  icondata: Icons.monetization_on),
              TextButton(onPressed: () => _criaTransferencia(context), child: Text('Confirmar')),
            ],
          ),
        )
    );
  }

  void _criaTransferencia(BuildContext context) {
    debugPrint("cliquei no botão");
    double? numeroConta = double.tryParse(_controllerCampoNumeroConta.text);
    double? valor = double.tryParse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint("$transferencia");
      Navigator.pop(context,transferencia);
    }
  }
}