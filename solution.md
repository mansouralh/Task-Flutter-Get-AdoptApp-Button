1. Install `dio` into your project:

```shell
flutter pub add dio
```

2. Create a folder named `services`, inside it create a file called `pets.dart`.
3. Import `dio` package in `pets.dart`.

```dart
import "package:dio/dio.dart";
```

4. Create a new `PetsServices` class and initialize a new dio instance.

```dart
class PetsServices {
  final Dio _dio = Dio();
}
```

5. Define your `_baseUrl`.

```dart
class PetsServices {
  final Dio _dio = Dio();

  final _baseUrl = 'https://coded-pets-api-crud.herokuapp.com';
}
```

6. Create your first request that return a future list of pets and name it `getPets`.

```dart
  Future<List<Pet>> getPets() async {}
```

- Our endpoint is:

```
Get, https://coded-pets-api-crud.herokuapp.com/pets
```

7. Store the response of the request in a `Response` object.

```dart
  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    Response response = await _dio.get(_baseUrl + '/pets');
  }
```

8. Map your response to `Pet` objects using the `Pet.fromJson` constructor.

```dart
  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
      Response response = await _dio.get(_baseUrl + '/pets');
      pets = (response.data as List).map((pet) => Pet.fromJson(pet)).toList();
  }
```

9. Return your new `List` of `Pet`s.

```dart
  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
      Response response = await _dio.get(_baseUrl + '/pets');
      pets = (response.data as List).map((pet) => Pet.fromJson(pet)).toList();
    return pets;
  }
```

10. Don't forget to wrap your request in a `try-catch` block.

```dart
  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    try {
      Response response = await _dio.get(_baseUrl + '/pets');
      pets = (response.data as List).map((pet) => Pet.fromJson(pet)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return pets;
  }
```

11. In your `PetsProvider`, create a new function that returns a future void.

```dart
  Future<void> getPets() async {}
```

12. Import `services/pets.dart` file, and call `PetsServices().getPets()` function, don't forget to `await`.

```dart
  Future<void> getPets() async {
    await PetsServices().getPets();
  }
```

13. Lastly assign the result of `PetsServices().getPets()` to the `pets` variable in the provider.

```dart
  Future<void> getPets() async {
    pets = await PetsServices().getPets();
        notifyListeners();
  }
```

14. Create a button in your `home_page.dart` and call the provider method `getPets`. Don't forget to set `listen` to `false`.

```dart
ElevatedButton(
              onPressed: () {
                Provider.of<PetsProvider>(context, listen: false).getPets();
              },
              child: const Text("GET"),
            ),
```
