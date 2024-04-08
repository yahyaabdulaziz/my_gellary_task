import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery_task/domain/use_case/my_gallery_use_case.dart';
import 'package:my_gallery_task/domain/use_case/my_gallery_use_case_impl.dart';
import 'package:my_gallery_task/presentation/utils/base_image_state.dart';

@injectable
class MyGalleryViewModel extends Cubit<BaseImageState> {
  final MyGalleryUseCaseImpl myGalleryUseCase;

  MyGalleryViewModel(this.myGalleryUseCase) : super(BaseImageInitialState());

  Future<void> fetchImages() async {
    emit(BaseImageLoadingState());
    try {
      final images = await myGalleryUseCase.fetchImages();
      emit(BaseImageLoadedState<List<String>>(data: images));
    } catch (e) {
      emit(BaseImageErrorState(errorMessage: 'Failed to fetch images'));
    }
  }

  Future<void> uploadImage(File image) async {
    emit(BaseImageLoadingState());
    try {
      final imageUrl = await myGalleryUseCase.uploadImage(image);
      emit(BaseImageUploadedState(imageUrl: imageUrl));
    } catch (e) {
      emit(BaseImageErrorState(errorMessage: 'Failed to upload image'));
    }
  }


}
