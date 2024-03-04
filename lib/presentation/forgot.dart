import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/presentation/otp.dart';
import 'package:test_ws/presentation/sign_in.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

import '../domain/forgot_model.dart';


class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ForgotModel(),child: const SubForgot(),);
  }
}


class SubForgot extends StatelessWidget {
  const SubForgot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 110.h,),
          Text('Forgot Password',style: FontStyle.titleSign,),
          SizedBox(height: 8.h,),
          Text('Enter your email address',style: FontStyle.subTitleSign,),
          SizedBox(height: 56.h,),
          Text('Email Address',style: FontStyle.subTitleSign,),
          SizedBox(height: 8.h,),
          EmailField(),
          SizedBox(height: 56.h,),
          OtpButton(),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Remember password? Back to ',
                style: FontStyle.labelSignUp,
              ),
              SizedBox(
                width: 1.w,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInWidget()), (route) => false),
                child: Text(
                  'Sign in',
                  style: FontStyle.labelSignUpMain,
                ),
              ),
            ],
          ),

      ],),
    ),));
  }
}

class OtpButton extends StatelessWidget {
  const OtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForgotModel>();
    return
      SizedBox(
          width: 342.w,
          height: 46.h,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(model.emailVal  ? colors.main : colors.gray2),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.69))),
                  elevation: const MaterialStatePropertyAll(0)),
              onPressed: () =>  model.emailVal  ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp())) : null,
              child: Text('Send OTP', style: FontStyle.next)));
  }
}


class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForgotModel>();
    return SizedBox(
      width: 342.w,
      height: 44.h,
      child: TextField(
        controller: model.controller,
        onChanged: (value) {
          model.email = value;
          model.setEmail();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
          hintText: '***********@mail.com',
          hintStyle: FontStyle.labelField,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: model.controller.text.isEmpty || model.emailVal ?  colors.gray2 : colors.error),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:  model.controller.text.isEmpty ||model.emailVal ?  colors.gray2 : colors.error),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: model.controller.text.isEmpty || model.emailVal ?  colors.gray2 : colors.error),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:  model.controller.text.isEmpty || model.emailVal ?  colors.gray2 : colors.error),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:  model.controller.text.isEmpty || model.emailVal ?  colors.gray2 : colors.error),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:  model.controller.text.isEmpty || model.emailVal ?  colors.gray2 : colors.error),
            borderRadius: BorderRadius.circular(4),
          ),

        ),
      ),
    );
  }
}