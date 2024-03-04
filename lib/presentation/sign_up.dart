
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
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
    final model  = context.watch<SignUpModel>();
    if (model.connective == 'none'){
      WidgetsBinding.instance.addPostFrameCallback((_) { 
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('No internet'),
          actions: [
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Text('Back'))
          ],
        ));
      });
    }
    if (model.error != null){
      WidgetsBinding.instance.addPostFrameCallback((_) { 
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text("${model.error}"),
          actions: [
            ElevatedButton(onPressed: () {
              model.error = null;
              Navigator.of(context).pop();
            } , child: Text('Back'))
          ],
        ));
      });
    }
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
                    onTap:  () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInWidget())),
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
              GestureDetector(
                onTap: () => model.googleSignIn(context),
                child: Center(child: SvgPicture.asset('assets/image/google.svg'))),
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
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
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
    onPressed: () => model.isCheck &&   model.nameVal && model.confirmPasswordVal && model.emailVal && model.passwordVal && model.numberVal ? model.isLoad ? null : {
      model.setLoad(),
      model.signUp(context)} : null,
    child: model.isLoad ? SizedBox(
      width: 30.w,
      height: 30.h,
      child: const CircularProgressIndicator(color: Colors.white,)) :  Text('Sign Up', style: FontStyle.next)));
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
        SizedBox(width: 18.w,),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFView(
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: false,
                pageFling: true,
                pageSnap: true,
                filePath: model.pdfPath,))),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                  text: 'By ticking this box, you agree to our ',
                  style: FontStyle.termsStyle,
                  children: [
                    TextSpan(
                      text: 'Terms and conditions and private policy',
                      style: FontStyle.termsWarnStyle
                    )
                  ]
                )),
              ),
            ),
            SizedBox(width: 40.w,)
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
        keyboardType: TextInputType.number,
        onChanged: (value) {
          model.number = value;
          model.setNumber();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
          hintText: '+7(999)999-99-99',
          hintStyle: FontStyle.labelField,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),


        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpModel>();
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
            borderSide: BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
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
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: colors.gray2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),  
      ),
    );
  }
}

