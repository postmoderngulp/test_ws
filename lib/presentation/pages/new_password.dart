import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/new_password_model.dart';
import '../style/colors.dart';
import '../style/font.dart';
import 'sign_in.dart';

class NewPasswordWidget extends StatelessWidget {
  const NewPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => NewPasswordModel(),child: const SubNewPassword(),);
  }
}

class SubNewPassword extends StatelessWidget {
  const SubNewPassword({super.key});

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
            Text('New Password',style: FontStyle.titleSign,),
            SizedBox(height: 8.h,),
            Text('Enter new password',style: FontStyle.subTitleSign,),
            SizedBox(height: 55.h,),
            Text('Password',style: FontStyle.subTitleSign,),
            SizedBox(height: 8.h,),
            PasswordField(),
            SizedBox(height: 24.h,),
            Text('Confirm password',style: FontStyle.subTitleSign,),
            SizedBox(height: 8.h,),
            ConfirmField(),
            SizedBox(height: 71.h,),
            LogIn(),
          ],
        ),
      ),
    ));
  }
}


class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewPasswordModel>();
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
            borderSide: BorderSide(color: colors.gray2),
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
    final model = context.watch<NewPasswordModel>();
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

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewPasswordModel>();
    return
      Center(
        child: SizedBox(
            width: 342.w,
            height: 46.h,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(model.passwordVal  && model.confirmPasswordVal   ? colors.main : colors.gray2),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.69))),
                    elevation: const MaterialStatePropertyAll(0)),
                onPressed: () =>  model.passwordVal  && model.confirmPasswordVal   ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInWidget())) : null,
                child: Text('Log In', style: FontStyle.next))),
      );
  }
}