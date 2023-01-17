// ignore_for_file: depend_on_referenced_packages

import 'package:advanced_flutter_projexct/presentation/pages/sign_up/sign_up_page.dart';
import 'package:advanced_flutter_projexct/utils/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets.dart';
import '../../../common/dimensions.dart';
import '../../../extensions/context_extension.dart';
import '../../../extensions/text_style_extension.dart';
import '../../../theme/light_theme_colors.dart';
import '../../bloc/bloc/login/sign_in_bloc.dart';
import '../../widgets/text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = TextEditingController();
  late final SignInBloc bloc;
  final dialogManager = DialogManager();

  @override
  void initState() {
    bloc = BlocProvider.of<SignInBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == SignInStatus.userInputError) {
          dialogManager.showSnackBar(
            context,
            state.errorMsg,
            type: SnackbarType.error,
          );
        } else if (state.status == SignInStatus.done) {
          dialogManager.showSnackBar(
            context,
            state.msg,
            type: SnackbarType.success,
          );
        }
      },
      child: Scaffold(
        backgroundColor: background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  child: Image.asset(Assets.pre_login2),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingMedium1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Sign In',
                        textAlign: TextAlign.left,
                        style: context.textTheme.headline4!.bold
                            .copyWith(fontSize: sp22, color: black),
                      ),
                      SizedBox(height: paddingRegular1),
                      CustomTextField(
                        hintText: 'Enter your email',
                        controller: bloc.usernameController,
                      ),
                      SizedBox(height: paddingSmall1),
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (previous, current) =>
                            previous.showPassword != current.showPassword,
                        builder: (context, state) {
                          return CustomTextField(
                            hintText: 'Enter your password',
                            suffixIcon: buildPasswordSuffix(),
                            controller: bloc.passwordController,
                            obscureText: state.showPassword,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password',
                              style: context.textTheme.bodyMedium!.semiBold
                                  .copyWith(
                                color: primary,
                                fontSize: sp16,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                buildSignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildPasswordSuffix() {
    return InkWell(
      onTap: () => bloc.add(ShowPassword()),
      child: SvgPicture.asset(
        bloc.state.showPassword ? Assets.eye : Assets.eye_closed,
        height: dp24,
        color: grey3,
      ),
    );
  }

  Padding buildSignInButton() {
    return Padding(
      padding: EdgeInsets.all(paddingMedium1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingLarge1,
                      vertical: paddingRegular1,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => bloc.add(OnSignInEvent()),
                  child: Text(
                    'Sign Up',
                    style: context.textTheme.bodyMedium!.bold.copyWith(
                      color: white,
                      fontSize: sp16,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account?',
                style: context.textTheme.bodyMedium!.regular.copyWith(
                  color: black,
                  fontSize: sp16,
                ),
              ),
              TextButton(
                onPressed: navigateToSignUp,
                child: Text(
                  'Sign Up',
                  style: context.textTheme.bodyMedium!.semiBold.copyWith(
                    color: primary,
                    fontSize: sp16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void navigateToSignUp() {
    Navigator.pop(context);
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const SignUpPage(),
        transitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }
}
