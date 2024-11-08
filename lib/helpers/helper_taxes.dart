import 'package:dart_assincronismo/models/account.dart';

double calculateTaxesByAccount({
  required Account sender,
  required double amount,
}) {
  if (amount < 5000) return 0;

  if (sender.accountType == null) return 0;

  switch (sender.accountType!.toUpperCase()) {
    case "AMBROSIA":
      return amount * 0.005;
    case "CANJUCA":
      return amount * 0.0033;
    case "PUDIM":
      return amount * 0.0025;
    default: //É BRIGADEIRO
      return amount * 0.0001;
  }
}
