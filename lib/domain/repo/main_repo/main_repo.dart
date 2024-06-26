import 'dart:io';


abstract class MainRepo {
  Future<List<String>> fetchImages();

  Future<String> uploadImage(File image);
}
