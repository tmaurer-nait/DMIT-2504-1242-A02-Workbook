import 'dart:convert';
import 'package:http/http.dart' as http;

const DOG_ENDPOINT = 'https://dog.ceo/api/breeds/image/random';

Future<dynamic> getDog() async {
  var uri =
      Uri.parse(DOG_ENDPOINT); // Create URI object from the endpoint string
  var response = await http.get(uri); // make the http request
  return jsonDecode(response.body);
}
