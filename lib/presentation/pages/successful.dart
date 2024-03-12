
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../provider/succesfsful_model.dart';
import 'Home.dart';
import '../style/colors.dart';
import '../style/font.dart';

class Successful extends StatelessWidget {
  const Successful({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SuccessfulModel(),child: SubSuccessful(),);
  }
}


class SubSuccessful extends StatelessWidget {
  const SubSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
   final model = context.watch<SuccessfulModel>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150.h,),
         model.angle == 5 ? Center(child: SvgPicture.asset('assets/image/success.svg')) : AnimatedRotation(
            turns: model.angle,
            duration: const Duration(seconds: 1),
            child: Center(
              child: SizedBox(
                width: 119.w,
                height: 119.h,
                child: Image.asset('assets/image/loading.png')),
            ),
          ),
          model.angle == 5 ? SizedBox(height: 75.h,) : SizedBox(height: 130.h,),
           model.angle == 5 ?  Text('Delivery Successful',style: FontStyle.titleSuccess,) : const SizedBox(),
            model.angle == 5 ?  SizedBox(height: 8.h,) : const SizedBox(),
              model.angle == 5 ?   Text('Your Item has been delivered successfully',) : SizedBox(),
           SizedBox(height: 67.h,),
            Text('Rate Rider',),
             SizedBox(height: 16.h,),
              Wrap(children: List.generate(model.stars.length, (index) => Padding(
                padding:  EdgeInsets.only(right: index == 4 ? 0.w: 16.w),
                child: SvgPicture.asset('assets/image/star.svg',colorFilter: ColorFilter.mode ( !model.stars[index] ? colors.gray2 : colors.warning, BlendMode.srcIn),),
              )),),
              SizedBox(height: 37.h,),
              Container(
                width: 342.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: colors.gray1,blurRadius: 3)
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add feedbak',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                    hintStyle: TextStyle(color: colors.gray1,fontSize: 12.sp),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding:  EdgeInsets.all(12.w),
                      child: SvgPicture.asset('assets/image/feedback.svg'),
                      
                    )
                  ),
                ),
              ),
              SizedBox(height: 76.h,),
                    SizedBox(
                width: 342.w,
                height: 46.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.main),
                    side: MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  onPressed: () {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()),(r) => false);}, child: Text('Done',style: TextStyle(color: Colors.white),)),),

        ],
      ),
    );
  }
}