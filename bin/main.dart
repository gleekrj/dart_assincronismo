import "package:dart_assincronismo/api_key.dart";
import "package:http/http.dart";
import "dart:convert";

void main() {
  //print("Olá, mundo!");
  //requestDataAsync();
  sendDataAsync({
    "id": "ID011_NEW",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000,
  });
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/gleekrj/447c6515fda3d4dcf79636d279460265/raw/2d110d7595d4bbb990ea871e90fdae02af98e69e/account.json";
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
      "https://gist.githubusercontent.com/gleekrj/447c6515fda3d4dcf79636d279460265/raw/2d110d7595d4bbb990ea871e90fdae02af98e69e/account.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url = "https://api.github.com/gists/447c6515fda3d4dcf79636d279460265";
  Response response = await post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "account.json",
      "public": true,
      "files": {
        "account.json": {
          "content": content,
        }
      }
    }),
  );
  print(response.statusCode);
}
