// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:test_ws/domain/profile_model.dart';
import 'package:test_ws/presentation/notification.dart';
import 'package:test_ws/presentation/payment.dart';
import 'package:test_ws/presentation/send_package.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ProfileModel(),child: SubProfile(),);
  }
}

class SubProfile extends StatelessWidget {
  const SubProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(63.h), child: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile',style: FontStyle.titleAppBar,),
        centerTitle: true,
        shadowColor: colors.gray1,
        elevation: 3,
      )),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 23.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 27.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/image/avatar.png'))
                ),
              ),
               SizedBox(width: 5.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Hello Ken'),
                  Row(children: [
                      Text('Current balance:',style: FontStyle.labelProfile,),
                      Text('N10,712:00'),
                  ],),
                  
                ],
              ),
              Spacer(),
                SvgPicture.asset('assets/image/eye-slash.svg'),
                 SizedBox(width: 10.w,),
          
            ],),
          SizedBox(height: 19.h,),
          Row(
            children: [
              Text(
          'Enable dark Mode'
              ),
              Spacer(),
              Transform.scale(
                scale: 0.85,
                child: CupertinoSwitch(
                
                  value: true, onChanged: (val){},activeColor: colors.main,),
              )
            ],
          ),
          SizedBox(height: 19.h,),
          Services()
              ],),
        ),
      ),);
  }
}


class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileModel>();
    return ListView.builder(
      shrinkWrap: true,
      itemCount:model.serviceList.length,
      itemBuilder: (BuildContext context, int index) => index == model.serviceList.length - 1  ? LogOut(index: index) : Padding(
        padding:  EdgeInsets.only(bottom: 12.h),
        child: ServiceItem(index: index,),
      ),);
  }
}


class ServiceItem extends StatelessWidget {
  int index;
   ServiceItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileModel>();
    return   GestureDetector(
      onTap: () {
         if(index == 1) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SendPackage()));
        }
        if(index == 2) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  NotificationWidget()));
        }
         if(index == 3) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Payment()));
        }

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: colors.gray2,
              blurRadius: 1
            )
          ]
        ),
        width: 342.w,
        height: 62.h,
        child: Row(children: [
          SizedBox(width: 12.w,),
          SvgPicture.asset('assets/image/${model.serviceList[index].imgName}.svg'),
          SizedBox(width: 12.w,),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${model.serviceList[index].title}',style: FontStyle.serviceTitle,),
                SizedBox(height: 2.h,),
                Text('${model.serviceList[index].label}',style: FontStyle.labelService,), 
            
              ],
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/image/arrow_down.svg'),
          SizedBox(width: 27.47.w,),
        ],),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
   int index;
  LogOut({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileModel>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: colors.gray2,
            blurRadius: 1
          )
        ]
      ),
      width: 342.w,
      height: 50.h,
      child: Row(children: [
        SizedBox(width: 12.w,),
        SvgPicture.asset('assets/image/${model.serviceList[index].imgName}.svg'),
        SizedBox(width: 12.w,),
            Text('${model.serviceList[index].title}'), 
            Spacer(),
        SvgPicture.asset('assets/image/arrow_down.svg'),
        
        SizedBox(width: 27.47.w,),
      ],),
    );
  }
}
