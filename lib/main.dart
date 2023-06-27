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

class FormularioTransferencias extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
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

class ListaTransferencias extends StatefulWidget{
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
          future?.then((value)  {
            debugPrint('executando then');
            debugPrint('$value');
            widget._listaTransferencia.add(value);
          });
        },
      ),
      body: ListView.builder(
        itemCount: widget._listaTransferencia.length,
        itemBuilder: (context,indice){
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
        title: Text(_transferencia._valor.toString()),
        subtitle: Text(_transferencia._numeroConta.toString()),
        trailing: Icon(Icons.monetization_on),
      ),
    );
  }
}

class Transferencia {
  final double _valor;
  final double _numeroConta;

  Transferencia(this._valor, this._numeroConta);

  @override
  String toString() {
    return 'Transferencia{_valor: $_valor, _numeroConta: $_numeroConta}';
  }
}
