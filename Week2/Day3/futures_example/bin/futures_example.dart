import 'package:futures_example/dog_api.dart' as dog_api;
import 'package:futures_example/dog.dart';

void main(List<String> arguments) async {
  var dogJson = await dog_api.getDog();

  var randomDog = Dog.fromJson(dogJson);

  print(randomDog);
}
