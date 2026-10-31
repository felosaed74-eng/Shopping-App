import 'package:flutter/material.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/features/app_section/screens/app_section.dart';
import 'package:shopping_app/features/auth/presentation/view/screen/login_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screen/register_screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

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
        AppRoutes.appSection: (context) => AppSection(),
      },
    );
  }
}
