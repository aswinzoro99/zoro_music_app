import 'package:advanced_flutter_projexct/presentation/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../../../common/assets.dart';
import '../../../common/dimensions.dart';
import '../../../core/base_screen.dart';
import '../../../extensions/context_extension.dart';
import '../../../extensions/text_style_extension.dart';
import '../../../theme/light_theme.dart';
import '../../../theme/light_theme_colors.dart';
import '../../widgets/custom_curousel.dart';
import '../sign_in/sign_in_page.dart';

class PreLoginPage extends BaseScreen {
  const PreLoginPage({super.key});

  @override
  State<PreLoginPage> createState() => _PreLoginPageState();
}

class _PreLoginPageState extends BaseState<PreLoginPage> {
  var isLastPage = false;
  var currentIndex = 0;
  final _demo = [
    Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      child: Image.asset(Assets.pre_login),
    ),
    Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      child: Image.asset(Assets.pre_login2),
    ),
    Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      child: Image.asset(Assets.pre_login3),
    ),
  ];
  int pageIndex = 0;
  final controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                buildCourousalView(),
                SizedBox(height: dp60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingXL),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Find music & enjoy',
                        style: context.textTheme.headline4!.bold
                            .copyWith(fontSize: sp24, color: black),
                      ),
                      SizedBox(height: dp12),
                      Text(
                        'Search, get and save your favourite music on your playlist make',
                        style: context.textTheme.titleLarge!.regular
                            .copyWith(fontSize: sp16, color: grey2),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: buildSignInActions(context),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSignInActions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingLarge2),
      child: isLastPage
          ? Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: white,
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingLarge1,
                        vertical: paddingRegular1,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: dialogButtonBorderRadius),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                    ),
                    child: Text(
                      'Sign In',
                      style: context.textTheme.bodyMedium!.bold.copyWith(
                        color: black,
                        fontSize: sp16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: dp30),
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
                          borderRadius: dialogButtonBorderRadius),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    ),
                    child: Text(
                      'Sign Up',
                      style: context.textTheme.bodyMedium!.bold.copyWith(
                        color: white,
                        fontSize: sp16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
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
                          borderRadius: dialogButtonBorderRadius),
                    ),
                    onPressed: () => setState(() {
                      if (currentIndex != 2) {
                        currentIndex = currentIndex + 1;
                        controller.animateToPage(
                          currentIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      } else {
                        currentIndex = 0;
                      }
                    }),
                    child: Text(
                      'Next',
                      style: context.textTheme.bodyMedium!.bold.copyWith(
                        color: white,
                        fontSize: sp16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Column buildCourousalView() {
    return Column(
      children: [
        SizedBox(
          height: context.maxHeight * 0.50,
          width: double.infinity,
          child: PageView(
            controller: controller,
            children: _demo,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                pageIndex = currentIndex;
                if (index == 2) {
                  isLastPage = true;
                } else {
                  isLastPage = false;
                }
              });
            },
          ),
        ),
        CustomCurousalIndicator(
          width: dp8,
          height: dp8,
          count: _demo.length,
          index: pageIndex,
          cornerRadius: dp6,
          activeColor: primary,
          animationDuration: 100,
        ),
      ],
    );
  }
}
