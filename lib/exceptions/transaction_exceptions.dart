import 'package:dart_assincronismo/models/account.dart';

class SendNotExistsException implements Exception {
  final String message;

  SendNotExistsException({this.message = "Remetente não existe."});
}

class ReceiverNotExistsException implements Exception {
  final String message;

  ReceiverNotExistsException({this.message = "Destinatário não existe."});
}

class InsufficientFundsException implements Exception {
  String message; //Mensagem amigável
  Account cause; //Objeto causador da exceção
  double amount; //Informações específicas
  double taxes; //Informações específicas

  InsufficientFundsException({
    this.message = "Fundos insuficientes para transação.",
    required this.cause,
    required this.amount,
    required this.taxes,
  });
}
