import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/presentation/sign_in.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

import '../domain/sign_up_model.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SignUpModel(),child: const SubSignUp(),);
  }
}

class SubSignUp extends StatelessWidget {
  const SubSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 33.h,),
              Text('Create an account',style: FontStyle.titleSign,),
              SizedBox(height: 8.h,),
              Text('Complete the sign up process to get started',style: FontStyle.subTitleSign,),
              SizedBox(height: 33.h,),
              Text('Full name',style: FontStyle.subTitleSign,),
              SizedBox(height: 8.h,),
              NameField(),
              SizedBox(height: 24.h,),
              Text('Phone Number',style: FontStyle.subTitleSign,),
              SizedBox(height: 8.h,),
              NumberField(),
              SizedBox(height: 24.h,),
              Text('Email Address',style: FontStyle.subTitleSign,),
              SizedBox(height: 8.h,),
              EmailField(),
              SizedBox(height: 24.h,),
              Text('Password',style: FontStyle.subTitleSign,),
              SizedBox(height: 8.h,),
              PasswordField(),
              SizedBox(height: 24.h,),
              Text('Confirm Password',style: FontStyle.subTitleSign,),
              SizedBox(height: 8.h,),
              ConfirmField(),
              SizedBox(height: 37.h,),
              Terms(),
              SizedBox(height: 64.h,),
              RegisterButton(),
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
                    onTap:  () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignIn())),
                    child: Text(
                      'Sign in',
                      style: FontStyle.labelSignUpMain,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h,),
              Center(
                child: Text(
                  'or sign in using',
                  style: FontStyle.labelSignUp,
                ),
              ),
              SizedBox(height: 8.h,),
              Center(child: SvgPicture.asset('assets/image/google.svg')),
              SizedBox(height: 28.h,),
            ],
          ),
        ),
      ),
    ));
  }
}

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
    return SizedBox(
      width: 342.w,
      height: 44.h,
      child: TextField(
        onChanged: (value) {
          model.name = value;
          model.setName();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
          hintText: 'Ivanov Ivan',
          hintStyle: FontStyle.labelField,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray),
            borderRadius: BorderRadius.circular(4),
          ),

        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
    return
    SizedBox(
    width: 342.w,
    height: 46.h,
    child: ElevatedButton(
    style: ButtonStyle(
    backgroundColor:

     MaterialStatePropertyAll(model.isCheck && model.nameVal && model.confirmPasswordVal && model.emailVal && model.passwordVal && model.numberVal ? colors.main : colors.gray2),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4.69))),
    elevation: const MaterialStatePropertyAll(0)),
    onPressed: () => model.isCheck &&   model.nameVal && model.confirmPasswordVal && model.emailVal && model.passwordVal && model.numberVal ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn())) : null,
    child: Text('Sign Up', style: FontStyle.next)));
  }
}


class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 14.w,
            height: 14.h,
            child: Checkbox(value: model.isCheck, onChanged: (val) => model.setCheck(),activeColor: colors.main,checkColor: Colors.white,side: BorderSide(color: colors.main),),),
        SizedBox(width: 14.w,),
        SizedBox(
            width: 271.w,
            child: Text('By ticking this box, you agree to our Terms and conditions and private policy',textAlign: TextAlign.center,style: FontStyle.termsStyle,))
      ],
    );
  }
}



class NumberField extends StatelessWidget {
  const NumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
    return SizedBox(
      width: 342.w,
      height: 44.h,
      child: TextField(
        onChanged: (value) {
          model.number = value;
          model.setNumber();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
          hintText: '+7(999)999-99-99',
          hintStyle: FontStyle.labelField,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colors.gray),
            borderRadius: BorderRadius.circular(4),
          ),

        ),
      ),
    );
  }
}class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
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
            borderSide: BorderSide(color: colors.gray),
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
    final model = context.watch<SignUpModel>();
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
class ConfirmField extends StatelessWidget {
  const ConfirmField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
    return SizedBox(
      width: 342.w,
      height: 44.h,
      child: TextField(
        obscureText: model.confirmObscure,
        onChanged: (value) {
          model.confirmPassword = value;
          model.setConfirm();
        },
        decoration: InputDecoration(
          suffixIcon: model.confirmObscure ? GestureDetector(
              onTap: ()=> model.setConfirmObsc(),
              child: Padding(
                padding:  EdgeInsets.all(15.w),
                child: SvgPicture.asset('assets/image/eye-slash.svg'),
              )) : GestureDetector(
              onTap: ()=> model.setConfirmObsc(),
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

