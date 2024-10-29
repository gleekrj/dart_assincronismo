import "package:http/http.dart";
import "dart:convert";

void main() {
  //print("Olá, mundo!");
  //requestDataAsync();
  sendDataAsync({
    "id": "ID002_NEW",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000,
  });
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/gleekrj/447c6515fda3d4dcf79636d279460265/raw/1102898918abe6f5378fdeebe526a389d7b8dcdb/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then(
    (Response response) {
      print(response);
      print(response.body);
      List<dynamic> listAccounts = json.decode(response.body);
      Map<String, dynamic> mapCarla = listAccounts.firstWhere(
        (element) => element["name"] == "Carla",
      );
      print(mapCarla["balance"]);
    },
  );
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/gleekrj/447c6515fda3d4dcf79636d279460265/raw/1102898918abe6f5378fdeebe526a389d7b8dcdb/accounts.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url =
      "https://gist.githubusercontent.com/gleekrj/447c6515fda3d4dcf79636d279460265/raw/1102898918abe6f5378fdeebe526a389d7b8dcdb/accounts.json";
  Response response = await post(Uri.parse(url), body: content);
  print(response.statusCode);
}
