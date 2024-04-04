import 'package:flutter/material.dart';
import 'package:my_gallery_task/presentation/screens/my_gallery_screen/my_gallery_screen.dart';
import 'package:my_gallery_task/presentation/utils/app_assets.dart';
import 'package:my_gallery_task/presentation/utils/app_color.dart';
import 'package:my_gallery_task/presentation/utils/app_theme.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            Image.asset(AppAssets.imLoginBack),
            Positioned(
              right: width * .10,
              left: width * .10,
              top: height * .20,
              bottom: height * .22,
              child: SizedBox(
                height: height * .50,
                child: Column(
                  children: [
                    const Text("My", style: AppTheme.titleLoginScreen),
                    const Text("Gallery", style: AppTheme.titleLoginScreen),
                    SizedBox(
                      height: height * .02,
                    ),
                    Container(
                      padding: EdgeInsets.all(width * .02),
                      width: width * .80,
                      height: height * .35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColor.rectLoginBack),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                hintText: "User Name"),
                            maxLines: 1,
                          ),
                          const SizedBox(height: 8),
                          TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                hintText: "Password",
                              ),
                              maxLines: 1),
                          const SizedBox(height: 18),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, MyGalleryScreen.routeName);
                              },
                              child: const Text('Login',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
