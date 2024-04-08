import 'dart:io';

import 'package:injectable/injectable.dart';
abstract class MyGalleryUseCase {
  Future<List<String>> fetchImages();

  Future<String> uploadImage(File image);
}
