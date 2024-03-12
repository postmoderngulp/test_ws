// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ws/session5/domain/entities/profile.dart';

import '../../../presentation/style/colors.dart';
import '../../../presentation/style/font.dart';
import 'call_rider.dart';

class ChatRider extends StatelessWidget {
  Profile profile;
   ChatRider({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(preferredSize: Size.fromHeight(63.h), child: AppBar(
        automaticallyImplyLeading: false,
         leading: GestureDetector(
           onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/image/back_button.svg'),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
              Container(
                width: 43.w,
                height: 43.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/image/avatar.png'))
                ),),
              SizedBox(width: 4.w,),
            Padding(
              padding:  EdgeInsets.only(top: 4.h),
              child: Text(profile.name,style: FontStyle.labelProfile,),
            ),
            Spacer()
          ],
        ),
        centerTitle: true,
        shadowColor: colors.gray1,
        elevation: 3,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 25.w),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CallRider(profile: profile,) )),
              child: SvgPicture.asset('assets/image/phone.svg'),
            ),
          )
        ],
      )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children:[ SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                
                    ListChat(),
                
               
                
                
              ],
            ),
          ),
          Positioned(
                  bottom: 0,
                  child: ChatTab())
          ]
        ),
      ),
    );
  }
}

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 24.w,),
        SvgPicture.asset('assets/image/emoji.svg'),
        SizedBox(width: 6.5.w,),
        const ChatField(),
         SvgPicture.asset('assets/image/triangle.svg'),
         SizedBox(width: 1.w,),
          SizedBox(width: 10.w,),
      ],
    );
  }
}


class ChatField extends StatelessWidget {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
         width: 267.w,
      height: 40.h,
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8),
            color: colors.gray1,
        ),
       
        child: TextField(
          showCursor: true,
          cursorColor: colors.main,
          decoration: InputDecoration(
            hintText: 'Enter message',
            contentPadding: EdgeInsets.all(12),
            hintStyle: FontStyle.resend,
            suffixIcon: Padding(
              padding:  EdgeInsets.all(11.w),
              child: SvgPicture.asset('assets/image/mike.svg'),
            ),
            fillColor: colors.gray1,
            focusColor: colors.gray1,
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.gray1)
            ),
            errorBorder: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.gray1)
            ),
            enabledBorder: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.gray1)
            ),
            focusedBorder: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.gray1)
            ),disabledBorder: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.gray1)
            ),
        
          ),
        ),
    );
  }
}


class ListChat extends StatelessWidget {
  const ListChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w),
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding:  EdgeInsets.only(bottom: 12.h,right: 170.w),
          child: const ListItem(),
        ),),
    );
  }
}


class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: colors.gray1,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Text('Привет',style: FontStyle.msg,),
      ),
    );
  }
}