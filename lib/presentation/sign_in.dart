
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/domain/forgot_model.dart';
import 'package:test_ws/presentation/forgot.dart';
import 'package:test_ws/presentation/sign_up.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

import '../domain/sign_in_model.dart';
import 'Home.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SignInModel(),child: const SubSignIn(),);
  }
}

class SubSignIn extends StatelessWidget {
  const SubSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 110.h,),
            Text('Welcome Back',style: FontStyle.titleSign,),
            SizedBox(height: 8.h,),
            Text('Email Address',style: FontStyle.subTitleSign,),
            SizedBox(height: 8.h,),
            EmailField(),
            SizedBox(height: 24.h,),
            Text('Password',style: FontStyle.subTitleSign,),
            SizedBox(height: 8.h,),
            PasswordField(),
            SizedBox(height: 17.h,),
            Remember(),
            SizedBox(height: 187.h,),
            LogInButton(),
            SizedBox(height: 20.h,),
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
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignUp()), (route) => false),
                  child: Text(
                    'Sign up',
                    style: FontStyle.labelSignUpMain,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h,),
            Center(
              child: Text(
                'or log in using',
                style: FontStyle.labelSignUp,
              ),
            ),
            SizedBox(height: 8.h,),
            Center(child: SvgPicture.asset('assets/image/google.svg')),
            SizedBox(height: 28.h,),
          ],
        ),
      ),
    ));
  }
}


class Remember extends StatelessWidget {
  const Remember({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignInModel>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 14.w,
          height: 14.h,
          child: Checkbox(value: model.isCheck, onChanged: (val) => model.setCheck(),activeColor: colors.main,checkColor: Colors.white,side: BorderSide(color: colors.main),),),
        SizedBox(width: 4.w,),
        Text(
          'Remember password',
          style: FontStyle.labelSignUp,
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Forgot())),
          child: Text(
            'Forgot Password?',
            style: FontStyle.labelSignUpMain,
          ),
        ),
      ],
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignInModel>();
    return
      SizedBox(
          width: 342.w,
          height: 46.h,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:

                  MaterialStatePropertyAll(model.emailVal && model.passwordVal ? colors.main : colors.gray2),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.69))),
                  elevation: const MaterialStatePropertyAll(0)),
              onPressed: () =>  model.emailVal && model.passwordVal  ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home())) : null,
              child: Text('Log In', style: FontStyle.next)));
  }
}



class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignInModel>();
    return SizedBox(
      width: 342.w,
      height: 44.h,
      child: TextField(
        onChanged: (value) {
          model.email = value;
          model.setEmail();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
          hintText: '***********@mail.com',
          hintStyle: FontStyle.labelField,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),

        ),
      ),
    );
  }
}


class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignInModel>();
    return SizedBox(
      width: 342.w,
      height: 44.h,
      child: TextField(
        obscureText: model.passwordObscure,
        onChanged: (value) {
          model.password = value;
          model.setPassword();
        },
        decoration: InputDecoration(

          suffixIcon: model.passwordObscure ? GestureDetector(
              onTap: ()=> model.setPasswordObsc(),
              child: Padding(
                padding:  EdgeInsets.all(15.w),
                child: SvgPicture.asset('assets/image/eye-slash.svg'),
              )) : GestureDetector(
              onTap: ()=> model.setPasswordObsc(),
              child: Padding(
                padding:  EdgeInsets.all(15.w),
                child: SvgPicture.asset('assets/image/eye.svg'),
              )),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
          hintText: '**********',
          hintStyle: FontStyle.labelField,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colors.gray),
            borderRadius: BorderRadius.circular(4),
          ),

        ),
      ),
    );
  }
}