import '../../domain/usecases/validate_parity_usecase.dart';

class ReceiverController {
  final ValidateParityUseCase validateParityUseCase;

  ReceiverController(this.validateParityUseCase);

  int? validate(String bin, String type) {
    return validateParityUseCase(bin: bin, type: type);
  }
}
