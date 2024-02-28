import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/domain/forgot_model.dart';
import 'package:test_ws/domain/otp_model.dart';
import 'package:test_ws/presentation/forgot.dart';
import 'package:test_ws/presentation/new_password.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => OtpModel(),child: const SubOtp(),);
  }
}


class SubOtp extends StatelessWidget {
  const SubOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 113.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Text('OTP Verification',style: FontStyle.titleSign,),
          ),
          SizedBox(height: 8.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Text('Enter the 6 digit numbers sent to your email',style: FontStyle.subTitleSign,),
          ),
          SizedBox(height: 52.h,),
          CodeInput(),
          SizedBox(height: 30.h,),
          Center(child: Text('If you didn’t receive code, resend after 1:00',style: FontStyle.resend,)),
          SizedBox(height: 82.h,),
          NewPassword(),
        ],
      ),
    ),));
  }
}

class CodeInput extends StatelessWidget {
  const CodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  24.w),
      child: Stack(
        children: [ Wrap(
          children: List.generate(6, (index) => Padding(
            padding: EdgeInsets.only(right: index == 5 ? 0.w : 30.w),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: colors.gray2)
              ),
            ),
          )),
        ),
        TextField(
          autofocus: true,
          showCursor: false,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.transparent,
            decorationThickness: 0
          ),
          decoration: InputDecoration(
            border: InputBorder.none,

          ),
        ),
        ]
      ),
    );
  }
}


class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OtpModel>();
    return
      Center(
        child: SizedBox(
            width: 342.w,
            height: 46.h,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(model.codeVal  ? colors.main : colors.gray2),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.69))),
                    elevation: const MaterialStatePropertyAll(0)),
                onPressed: () =>  model.codeVal  ? null : Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPasswordWidget())),
                child: Text('Log In', style: FontStyle.next))),
      );
  }
}