// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_ws/session5/domain/entities/profile.dart';

import '../../../presentation/style/colors.dart';
import '../../../presentation/style/font.dart';

class CallRider extends StatelessWidget {
  Profile profile;
   CallRider({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 85.h,),
           Center(
             child: Container(
                  width: 84.w,
                  height: 84.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/image/avatar.png'))
                  ),
                ),
           ),
              SizedBox(height: 9.3.h,),
              Text(profile.name,style: FontStyle.titleCall,),
               SizedBox(height: 9.3.h,),
              Text('+${profile.number}',style: FontStyle.titleNumber,),
                SizedBox(height: 9.3.h,),
              Text('calling...',style: FontStyle.labelSignUpMain,),
              SizedBox(height: 113.h,),
              CallPanel()
        ],
      ),
    );
  }
}

class CallPanel extends StatelessWidget {
  const CallPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341.52.w,
      height: 332.16.h,
      decoration: BoxDecoration(
        color: colors.gray6,
        borderRadius: BorderRadius.circular(8.12)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Row(
              children: [
                SvgPicture.asset('assets/image/plus.svg'),
                Spacer(),
                SvgPicture.asset('assets/image/pause.svg'),
                Spacer(),
                SvgPicture.asset('assets/image/video.svg'),
              ],
            ),
            SizedBox(height: 43.h,),
             Row(
              children: [
                SvgPicture.asset('assets/image/sound.svg'),
                Spacer(),
                SvgPicture.asset('assets/image/off_mike.svg'),
                Spacer(),
                SvgPicture.asset('assets/image/keypad.svg'),
              ],
            ),
             SizedBox(height: 56.h,),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 71.w,
              height: 68.h,
              decoration: BoxDecoration(
                color: colors.error,shape: BoxShape.circle
              ),
              child: Padding(
                padding:  EdgeInsets.all(15.0),
                child: SvgPicture.asset('assets/image/call_off.svg'),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}