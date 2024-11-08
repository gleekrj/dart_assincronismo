import 'package:dart_assincronismo/exceptions/transaction_exceptions.dart';
import 'package:dart_assincronismo/screens/account_screen.dart';
import 'package:dart_assincronismo/services/transaction_service.dart';

void main() {
  TransactionService()
      .makeTransaction(
    idSender: "ID001",
    idReceiver: "ID003",
    amount: 5000,
  )
      .catchError(
    (e) {
      print(e.message);
      print(
          "${e.cause.name} possui saldo ${e.cause.balance} que é menor que ${e.amount + e.taxes}");
    },
    test: (error) => error is InsufficientFundsException,
  ).then((value) {});
}


// void main() async {
//   // AccountScreen accountScreen = AccountScreen();
//   // accountScreen.initializeStram();
//   // accountScreen.runChatBot();

//   try {
//     await TransactionService().makeTransaction(
//       idSender: "ID001",
//       idReceiver: "ID003",
//       amount: 5000,
//     );
//   } on InsufficientFundsException catch (e) {
//     print(e.message);
//     print(
//         "${e.cause.name} possui saldo ${e.cause.balance} que é menor que ${e.amount + e.taxes}");
//   }
// }
