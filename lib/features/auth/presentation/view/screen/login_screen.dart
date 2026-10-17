import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/widgets/custom_material_button.dart';
import 'package:shopping_app/core/widgets/custom_text_form_feild_widget.dart';
import 'package:shopping_app/features/auth/presentation/view/widget/auth_navigator_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            CoustomTextFormFeild(
              controller: email,
              label: "Email",
              hint: "Enter Your Email",
            ),
            CoustomTextFormFeild(
              controller: password,
              label: "Password",
              hint: "Enter Your Password",
            ),
            CustomMaterialButton(
              onPressed: () {},
              text: "login",
              color: AppColors.primaryOrange,
            ),
          ],
        ),
      ),
      floatingActionButton: AuthNavigatorWidget(
        text: "Don't have an account?",
        actionText: "Sign Up",
        onTap: () {},
      ),
    );
  }
}
