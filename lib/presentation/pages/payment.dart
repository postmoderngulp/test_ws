import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../provider/payment_model.dart';
import '../style/colors.dart';
import '../style/font.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => PaymentModel(),child: SubPayment(),);
  }
}

class SubPayment extends StatelessWidget {
  const SubPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PaymentModel>();
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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 67.h,),
            Container(
                width: 341.w,
                height: 84.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: colors.gray1,
                      blurRadius: 3
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 12.w,
                      height: 12.h,
                      child: Radio(value: model.val, groupValue: 1, onChanged: (val){ model.setVal(val!);},activeColor: colors.main,fillColor: MaterialStatePropertyAll(colors.main),)),
                    SizedBox(width: 8.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Pay with wallet',style: FontStyle.labelMain,),
                      Text('complete the payment using your e wallet',style: FontStyle.labelCard,),
                      ],
                    )
                  ],
                ),
            ),
            SizedBox(height: 12.h,),
           Container(
                width: 341.w,
                height: 84.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: colors.gray1,
                      blurRadius: 3
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     SizedBox(width: 10.w,),
                    SizedBox(
                      width: 12.w,
                      height: 12.h,
                      child: Radio(value: model.val, groupValue: 2, onChanged: (val){model.setVal(val!);},activeColor: colors.main,fillColor: MaterialStatePropertyAll(colors.main),)),
                    SizedBox(width: 8.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Credit / debit card',style: FontStyle.labelMain,),
                      Text('complete the payment using your debit card',style: FontStyle.labelCard,),
                      ],
                    )
                  ],
                ),
             ),
            Spacer(),
            SizedBox(
                  width: 342.w,
                  height: 46.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(colors.main ),
                      side: const MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                    ),
                    onPressed: () {}, child: const Text('Proceed to pay',style: TextStyle(color: Colors.white),)),),
                    SizedBox(height: 105.h,)
          ],
        ),
      ),
    );
  }
}