import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_gallery_task/domain/repo/main_repo/main_repo.dart';
import 'package:my_gallery_task/domain/use_case/my_gallery_use_case.dart';
@injectable
class MyGalleryUseCaseImpl implements MainRepo {
  final MainRepo myGalleryRepository;

  MyGalleryUseCaseImpl(this.myGalleryRepository);

  @override
  Future<List<String>> fetchImages() async {
    return myGalleryRepository.fetchImages();
  }

  @override
  Future<String> uploadImage(File image) async {
    return myGalleryRepository.uploadImage(image);
  }
}