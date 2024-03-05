import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(preferredSize: Size.fromHeight(63.h), child: AppBar(
        shadowColor: colors.gray1,
        leading: GestureDetector(
           onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/image/back_button.svg'),
          ),
        ),
        title: Text('Add Payment method',style: FontStyle.titleAppBar,),
        centerTitle: true,
        elevation: 3,
      )),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}