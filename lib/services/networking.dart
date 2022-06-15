import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  static const baseURL = "https://hoodwink.medkomtek.net";
  static const registerPath = "/api/register";
  static const loginPath = "/api/auth/login";
  static const addProductPath = "/api/item/add";
  static const updateProductPath = "/api/item/update";
  static const deleteProductPath = "/api/item/delete";
  static const getListProductPath = "/api/items";
  static const searchProductPath = "/api/item/search";

  Future registerAccount(String email, String password) async {
    var fullURL = baseURL + registerPath;

    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'email': email, 'password': password};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    // http.Response response = await http.get(Uri.parse(fullURL));
    http.Response response = await http.post(
      Uri.parse(fullURL),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future login(String email, String password) async {
    var fullURL = baseURL + loginPath;

    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'email': email, 'password': password};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      Uri.parse(fullURL),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getData() async {
    var fullURL = baseURL + getListProductPath;
    http.Response response = await http.get(Uri.parse(fullURL));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getListProduct() async {
    var fullURL = baseURL + getListProductPath;
    http.Response response = await http.get(Uri.parse(fullURL));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

