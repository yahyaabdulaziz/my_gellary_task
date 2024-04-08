abstract class BaseImageState {}

class BaseImageInitialState extends BaseImageState {}

class BaseImageLoadingState extends BaseImageState {}

class BaseImageLoadedState<T> extends BaseImageState {
  final T data;

  BaseImageLoadedState({required this.data});
}

class BaseImageUploadedState extends BaseImageState {
  final String imageUrl;

  BaseImageUploadedState({required this.imageUrl});
}

class BaseImageErrorState extends BaseImageState {
  final String errorMessage;

  BaseImageErrorState({required this.errorMessage});
}