import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/utils/app_dialog.dart';
import 'package:shopping_app/core/widgets/custom_material_button.dart';
import 'package:shopping_app/core/widgets/custom_text_form_feild_widget.dart';
import 'package:shopping_app/features/auth/data/models/register_request_model.dart';
import 'package:shopping_app/features/auth/data/repo/data_source/auth_data_source_imp.dart';
import 'package:shopping_app/features/auth/data/repo/repo/auth_repo_imp.dart';
import 'package:shopping_app/features/auth/presentation/view/widget/auth_navigator_widget.dart';
import 'package:shopping_app/features/auth/presentation/view_model/register/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confimPassword;
  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    userName = TextEditingController(text: "Felo");
    phone = TextEditingController(text: "0123456789");
    email = TextEditingController(text: "felo@gmail.com");
    password = TextEditingController(text: "Felo@123456");
    confimPassword = TextEditingController(text: "Felo@123456");
    cubit = RegisterCubit(AuthRepoImp(AuthDataSourceImp()));
  }

  @override
  void dispose() {
    userName.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    confimPassword.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: BlocListener<RegisterCubit, RegisterState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is RegisterLoading) {
            AppDialogs.showLoading(context);
          }
          if (state is RegisterSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AppRoutes.login);
          }
          if (state is RegisterError) {
            Navigator.of(context).pop();
            AppDialogs.showError(
              context,
              cubit.messageError ?? "Error From Cubit",
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              CoustomTextFormFeild(
                controller: userName,
                label: "User Name",
                hint: "Enter Your User Name",
              ),
              CoustomTextFormFeild(
                controller: phone,
                label: "Phone",
                hint: "Enter Your Phone",
              ),
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
              CoustomTextFormFeild(
                controller: confimPassword,
                label: "Confirm Password",
                hint: "Enter Your Confirm Password",
              ),
              CustomMaterialButton(
                onPressed: () async {
                  var request = RegisterRequestModel(
                    name: userName.text,
                    email: email.text,
                    phone: phone.text,
                    password: password.text,
                    confirmPassword: confimPassword.text,
                  );
                  await cubit.register(request);
                },
                text: "Sign Up",
                color: AppColors.primaryOrange,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AuthNavigatorWidget(
        text: "Already have an account?",
        actionText: "Login In",
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.login);
        },
      ),
    );
  }
}
