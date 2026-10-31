import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/utils/app_dialog.dart';
import 'package:shopping_app/core/widgets/custom_material_button.dart';
import 'package:shopping_app/core/widgets/custom_text_form_feild_widget.dart';
import 'package:shopping_app/features/auth/presentation/view/widget/auth_navigator_widget.dart';
import 'package:shopping_app/features/auth/presentation/view_model/register/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;
  late LoginCubit _cubit;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    _cubit = LoginCubit();
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
      body: BlocListener<LoginCubit, LoginState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialog.showLoading(context);
          }
          Navigator.of(context, rootNavigator: true).pop();
          if (state is LoginError) {
            //AppDialog.showError(
            //context,
            //_cubit.messageError ?? "Error Ftom Cubit",
            //);
          }
          if (state is LoginScreen) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.appSection);
          }
        },
        child: SingleChildScrollView(
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
      ),
      floatingActionButton: AuthNavigatorWidget(
        text: "Don't have an account?",
        actionText: "Sign Up",
        onTap: () {},
      ),
    );
  }
}
