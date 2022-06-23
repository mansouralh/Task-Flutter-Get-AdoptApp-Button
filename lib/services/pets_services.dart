import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:dio/dio.dart';

class PetServices {
  final dioClient = Dio();

  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    // try {
    Response getResponse =
        await dioClient.get("https://coded-pets-api-crud.herokuapp.com/pets");
    // pets = getResponse.data.map((pet) => Pet.fromJson(pet)).toList();

    pets = (getResponse.data as List)
        .map((everyjasonofpet) => Pet.fromJson(everyjasonofpet))
        .toList();
    // } on DioError catch (error) {
    //   print(error);
    // }
    return pets;
// void getBooksFromService(){
// PetServices().getPets();
// }
  }
}
