import 'package:flutter/material.dart';
import 'package:my_gallery_task/presentation/utils/app_assets.dart';
import 'package:my_gallery_task/presentation/utils/app_color.dart';
import 'package:my_gallery_task/presentation/utils/app_theme.dart';
import 'package:my_gallery_task/presentation/widgets/card_item.dart';

class MyGalleryScreen extends StatefulWidget {
  static const String routeName = "MyGalleryScreen";

  const MyGalleryScreen({Key? key});

  @override
  State<MyGalleryScreen> createState() => _MyGalleryScreenState();
}

class _MyGalleryScreenState extends State<MyGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Material(
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
                "Welcome \n Mina",
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
                            Text("Log out"),
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
                              Text("Upload"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * .75,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // number of items in each row
                        mainAxisSpacing: 12.0, // spacing between rows
                        crossAxisSpacing: 12.0, // spacing between columns
                      ),
                      padding: const EdgeInsets.all(8.0),
                      // padding around the grid
                      itemCount: 22,
                      // total number of items
                      itemBuilder: (context, index) {
                        return CardItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                Container(
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
                      Text("Gallery"),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Container(
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
                      Text("Camera"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
