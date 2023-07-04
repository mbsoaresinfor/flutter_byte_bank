class Transferencia {
  final double _valor;
  final double _numeroConta;

  Transferencia(this._valor, this._numeroConta);

  get valor => _valor;

  get numeroConta => _numeroConta;

  @override
  String toString() {
    return 'Transferencia{_valor: $_valor, _numeroConta: $_numeroConta}';
  }
}