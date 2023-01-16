import 'package:advanced_flutter_projexct/presentation/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets.dart';
import '../../../common/dimensions.dart';
import '../../../extensions/context_extension.dart';
import '../../../extensions/text_style_extension.dart';
import '../../../theme/light_theme_colors.dart';
import '../../widgets/text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  child: Image.asset(Assets.pre_login2),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingRegular1),
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
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: paddingSmall1),
                      CustomTextField(
                        hintText: 'Enter your password',
                        suffixIcon: buildPasswordSuffix(),
                        controller: TextEditingController(),
                        obscureText: true,
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
              ],
            ),
            buildSignInButton(),
          ],
        ),
      ),
    );
  }

  InkWell buildPasswordSuffix() {
    return InkWell(
      onTap: () {},
      child: SvgPicture.asset(
        Assets.eye,
        height: dp24,
        color: grey3,
      ),
    );
  }

  Positioned buildSignInButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(bodyLarge),
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
                    onPressed: () {},
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
      ),
    );
  }

  void navigateToSignUp() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }
}
