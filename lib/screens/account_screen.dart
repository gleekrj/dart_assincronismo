import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_service.dart';
import 'dart:io';

class AccountScreen {
  AccountService _accountService = AccountService();

  void initializeStram() {
    _accountService.streamInfos.listen(
      (event) {
        print(event);
      },
    );
  }

  void runChatBot() async {
    print("Bom dia, eu sou o Lewis, assistente do Banco d'Ouro!");
    print("Quem bom te ter aqui com a gente.\n");

    bool isRunning = true;
    while (isRunning) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - 👀 Ver todas suas contas.");
      print("2 - ➕ Adicionar nova conta.");
      print("3 - Sair\n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              await _addExempleAccount();
              break;
            }
          case "3":
            {
              isRunning = false;
              print("Te vejo na próxima. 👋");
              break;
            }
          default:
            {
              print("Não entendi. Tente novamente.");
            }
        }
      }
    }
  }

  _getAllAccounts() async {
    List<Account> listAccounts = await _accountService.getAll();
    print(listAccounts);
  }

  _addExempleAccount() async {
    Account example = Account(
      id: "ID555",
      name: "Haley",
      lastName: "Chirívia",
      balance: 8001,
    );

    await _accountService.addAccount(example);
  }
}
