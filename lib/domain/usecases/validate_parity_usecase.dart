class ValidateParityUseCase {
  int? call({
    required String bin,
    required String type,
  }) {
    final texto = bin.trim();

    if (texto.isEmpty) {
      return null; // inválido
    }

    final tipo = type.trim().toLowerCase();
    final qtdUns = texto.split('').where((c) => c == '1').length;

    final unsSaoPares = qtdUns % 2 == 0;
    final querPar = tipo == 'par';

    // Paridade correta
    if ((unsSaoPares && querPar) || (!unsSaoPares && !querPar)) {
      return 1;
    }

    // Paridade incorreta
    return 2;
  }
}
