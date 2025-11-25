class CalculateParityUseCase {
  String? call({
    required String bin,
    required String type,
  }) {
    final texto = bin.trim();
    final tipo = type.trim().toLowerCase();

    // Validação do tipo
    if (tipo != 'par' && tipo != 'impar') {
      return null;
    }

    // Contar uns
    final qtdUns = texto.split('').where((c) => c == '1').length;

    bool unsSaoPares = qtdUns % 2 == 0;
    bool querPar = tipo == 'par';

    // Regra de paridade
    if (unsSaoPares == querPar) {
      return '${texto}0';
    } else {
      return '${texto}1';
    }
  }
}
