import 'package:flutter/material.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/features/auth/presentation/view/screen/login_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screen/register_screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: .light,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
    );
  }
}
