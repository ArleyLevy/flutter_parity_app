import '../../domain/usecases/calculate_parity_usecase.dart';

class ParityController {
  final CalculateParityUseCase calculateParityUseCase;

  ParityController(this.calculateParityUseCase);

  String? calculate(String bin, String type) {
    return calculateParityUseCase(
      bin: bin,
      type: type,
    );
  }
}
