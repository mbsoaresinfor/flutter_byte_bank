import 'package:app2/models/transferencia.dart';
import 'package:app2/screens/transferencia/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _listaTransferencia = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferência'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          debugPrint("cliquei no botão FloatingActionButton");
          Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencias();
          }));
          future.then((value) {
            debugPrint('executando then');
            debugPrint('$value');
            if (value != null) {
              setState(() {
                widget._listaTransferencia.add(value);
              });
            }
          });
        },
      ),
      body: ListView.builder(
        itemCount: widget._listaTransferencia.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._listaTransferencia[indice];
          return ItemTransferencia(transferencia);
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
        trailing: Icon(Icons.monetization_on),
      ),
    );
  }
}
