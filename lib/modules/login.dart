import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/core/custom_validator.dart';
import 'package:qoute_app/core/extensions/widget_extension.dart';
import 'package:qoute_app/core/routes/app_router.dart';
import 'package:qoute_app/core/routes/route_generator.dart';
import 'package:qoute_app/widgets/common_widgets/annotated_scaffolder.dart';
import 'package:qoute_app/widgets/common_widgets/custom_field.dart';
import 'package:qoute_app/widgets/common_widgets/primary_button.dart';
import 'package:qoute_app/widgets/common_widgets/text_widgets.dart';

class Login extends StatelessWidget {
  //
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedScaffold(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          top: true,
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  SpanText(
                    title: 'Login to Your\n',
                    subtitle: 'Account',
                  ),
                  SizedBox(height: 70.h),
                  CustomTextField(
                    hintText: 'formatable2018@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: CustomValidator.emailValidator,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    hintText: '* * * * * * * * *',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: CustomValidator.passwordValidator,
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // login
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // go to forgot password
                        RouteGenerator.pushNamed(AppRouter.recover);
                      },
                      child: Text("Forgot password?"),
                    ),
                  ),
                  SizedBox(height: 240.h),
                  Center(
                    child: SmallSpanText(
                      title: 'Don\'t have an Account? ',
                      subtitle: 'Sign Up',
                      onPressed: () {
                        // go to register
                        RouteGenerator.pushNamed(AppRouter.register);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
