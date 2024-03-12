import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/transations_model.dart';
import '../style/colors.dart';
import '../style/font.dart';
import 'Home.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(create: (context) => TransactonsModel(),child: const SubTrasactions(),);
  }
}

class SubTrasactions extends StatelessWidget {
  const SubTrasactions({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TransactonsModel>();
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
           model.angle == 5 ?  Text('Transaction Successful',style: FontStyle.titleSuccess,) : const SizedBox(),
            model.angle == 5 ?  SizedBox(height: 8.h,) : const SizedBox(),
           Column(
            children: [
              Text('Your rider is on the way to your destination'),
               SizedBox(height: 8.h,),
              Text('Tracking Number R-7458-4567-4434-5854'),
            ],
           ),
           SizedBox(height: 141.h,),
            SizedBox(
                width: 342.w,
                height: 46.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.main),
                    side: MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  onPressed: () {}, child: Text('Track my item')),),
                  SizedBox(height: 8.h,),
                    SizedBox(
                width: 342.w,
                height: 46.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    side: MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  onPressed: () {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()),(r) => false);}, child: Text('Go back to homepage',style: TextStyle(color: colors.main),)),),

        ],
      ),
    );
  }
}