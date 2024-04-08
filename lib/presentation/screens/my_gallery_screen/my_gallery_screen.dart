import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_task/domain/di/di.dart';
import 'package:my_gallery_task/presentation/screens/my_gallery_screen/my_gallery_view_model.dart';
import 'package:my_gallery_task/presentation/utils/app_assets.dart';
import 'package:my_gallery_task/presentation/utils/app_color.dart';
import 'package:my_gallery_task/presentation/utils/app_theme.dart';
import 'package:my_gallery_task/presentation/utils/base_image_state.dart';

class MyGalleryScreen extends StatefulWidget {
  static const String routeName = "MyGalleryScreen";

  const MyGalleryScreen({super.key});

  @override
  State<MyGalleryScreen> createState() => _MyGalleryScreenState();
}

class _MyGalleryScreenState extends State<MyGalleryScreen> {
  MyGalleryViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider<MyGalleryViewModel>(
      create: (_) => viewModel,
      child: Material(
        type: MaterialType.transparency,
        child: Expanded(
          child: Stack(
            children: [
              Image.asset(AppAssets.imGalleryBack),
              Positioned(
                top: width * .08,
                right: width * .08,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.imPerson),
                ),
              ),
              Positioned(
                top: width * .06,
                left: width * .06,
                child: const Text(
                  "Welcome \n Yahya",
                  style: AppTheme.titleLoginScreen,
                ),
              ),
              Positioned(
                top: height * .20,
                left: width * .05,
                right: width * .05,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text("Log out", style: AppTheme.buttonsTexts),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCustomDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.white,
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("Upload", style: AppTheme.buttonsTexts),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    BlocConsumer<MyGalleryViewModel, BaseImageState>(
                      listener: (context, state) {
                        if (state is BaseImageErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                            ),
                          );
                        } else if (state is BaseImageUploadedState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Image uploaded successfully'),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is BaseImageLoadingState ||
                            state is BaseImageInitialState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state
                            is BaseImageLoadedState<List<String>>) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                state.data[index],
                                fit: BoxFit.fill,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('No images found'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.rectLoginBack.withOpacity(.4),
          child: Container(
            padding: const EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height * .30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    uploadFromGallery(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.width * .15,
                    width: MediaQuery.of(context).size.width * .50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.rectGalleryBack,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          color: Colors.purpleAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Gallery",
                          style: AppTheme.buttonsDialogTexts,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                InkWell(
                  onTap: () {
                    uploadFromCamera(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.width * .15,
                    width: MediaQuery.of(context).size.width * .50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.rectCamBack,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Camera", style: AppTheme.buttonsDialogTexts),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> uploadFromCamera(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final file = File(image.path);
      context.read<MyGalleryViewModel>().uploadImage(file);
    }
  }

  Future<void> uploadFromGallery(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      context.read<MyGalleryViewModel>().uploadImage(file);
    }
  }
}
