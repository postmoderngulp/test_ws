import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/domain/onboard_model.dart';
import 'package:test_ws/presentation/sign_in.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardModel(context),
      child: const SubOnBoard(),
    );
  }
}

class SubOnBoard extends StatelessWidget {
  const SubOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OnBoardModel>();
    return SafeArea(
        child: Scaffold(
      body: model.item == null
          ? const Center(
              child: CircularProgressIndicator(
              color: colors.main,
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/image/${model.item!.path}.svg'),
                SizedBox(
                  height: 48.h,
                ),
                SizedBox(
                  width: 287.w,
                  child: Text(
                    model.item!.title,
                    style: FontStyle.titleMain,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width:271.w,
                  child: Text(
                    model.item!.subTitle,
                    style: FontStyle.labelMain,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 87.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: model.item != null && model.item!.path == 'third_board'
                      ? const SignUpButton()
                      : const Row(
                          children: [Skip(), Spacer(), Next()],
                        ),
                ),
              ],
            ),
    ));
  }
}

class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OnBoardModel>();
    return SizedBox(
        width: 100.w,
        height: 50.h,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.69))),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: colors.main)),
                elevation: const MaterialStatePropertyAll(0)),
            onPressed: () => model.skip(context),
            child: Text(
              'Skip',
              style: FontStyle.skip,
            )));
  }
}

class Next extends StatelessWidget {
  const Next({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OnBoardModel>();
    return SizedBox(
        width: 100.w,
        height: 50.h,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(colors.main),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.69))),
                elevation: const MaterialStatePropertyAll(0)),
            onPressed: () => model.next(context),
            child: Text('Next', style: FontStyle.next)));
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OnBoardModel>();
    return Column(
      children: [
        SizedBox(
            width: 342.w,
            height: 46.h,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(colors.main),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.69))),
                    elevation: const MaterialStatePropertyAll(0)),
                onPressed: () => model.signUp(context),
                child: Text('Sign Up', style: FontStyle.next))),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: FontStyle.labelSignUp,
            ),
            SizedBox(
              width: 1.w,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignIn()), (route) => false),
              child: Text(
                'Sign in',
                style: FontStyle.labelSignUpMain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
