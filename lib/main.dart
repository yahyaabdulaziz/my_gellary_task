import 'package:flutter/material.dart';
import 'package:my_gallery_task/domain/di/di.dart';
import 'package:my_gallery_task/presentation/screens/login_screen/login_screen.dart';
import 'package:my_gallery_task/presentation/screens/my_gallery_screen/my_gallery_screen.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        MyGalleryScreen.routeName: (_) => const MyGalleryScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
