import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/colors.dart';
import '../style/font.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(63.h), child: AppBar(
        leading: GestureDetector(
           onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/image/back_button.svg'),
          ),
        ),
        shadowColor: colors.gray1,
        automaticallyImplyLeading: false,
        title: Text('Notification',style: FontStyle.titleAppBar,),
        centerTitle: true,
        elevation: 3,
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.h,
          ),
          SvgPicture.asset('assets/image/notification_banner.svg'),
          SizedBox(
            height: 18.h,
          ),
          Center(child: Text('You have no notifications'))
        ],
      ),
    );
  }
}