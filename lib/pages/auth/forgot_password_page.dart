import 'package:edu_share/components/app_shadow.dart';
import 'package:edu_share/components/button/app_elevated_button.dart';
import 'package:edu_share/components/text_field/app_text_field.dart';
import 'package:edu_share/pages/auth/forgot_password_vm.dart';
import 'package:edu_share/resource/img/app_images.dart';
import 'package:edu_share/resource/themes/app_colors.dart';
import 'package:edu_share/resource/themes/app_style.dart';
import 'package:edu_share/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordPage extends StackedView<ForgotPasswordVM> {
  const ForgotPasswordPage({super.key});

  @override
  ForgotPasswordVM viewModelBuilder(BuildContext context) => ForgotPasswordVM();

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordVM viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: MediaQuery.of(context).padding.top + 50.0,
            child: Column(
              children: [
                SvgPicture.asset(AppImages.imageLogo),
                const SizedBox(height: 20.0),
                Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: AppStyles.STYLE_28_BOLD.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            top: size.height / 2.5,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ).copyWith(top: 50.0, bottom: 40.0),
              decoration: const BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: AppShadow.boxShadowLogin,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password',
                      style: AppStyles.STYLE_18.copyWith(
                        color: AppColor.textColor,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      controller: viewModel.emailController,
                      labelText: 'Email',
                      textInputAction: TextInputAction.next,
                      validator: Validator.required,
                    ),
                    const SizedBox(height: 20.0),
                    AppElevatedButton(
                      text: 'Send',
                      isDisable: viewModel.isLoading,
                      onPressed: () => viewModel.onSubmit(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
