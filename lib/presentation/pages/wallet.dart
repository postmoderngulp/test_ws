import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'payment.dart';
import '../style/colors.dart';
import '../style/font.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(63.h), child: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Wallet',style: FontStyle.titleAppBar,),
            centerTitle: true,
            shadowColor: colors.gray1,
            elevation: 3,
          )),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height:  41.h,),
                 Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
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
                              SizedBox(width: 3.w,),
                              Text('N10,712:00',style: FontStyle.labelNavMain,),
                          ],),
                          
                        ],
                      ),
                      Spacer(),
                        SvgPicture.asset('assets/image/eye-slash.svg'),
                         SizedBox(width: 10.w,),
                  
                    ],),
                SizedBox(height:  28.h,),
                Container(
                  decoration: BoxDecoration(
                    color: colors.gray1,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 48.w),
                    child: Column(
                      children: [
                        SizedBox(height:  10.h,),
                        Text('Top Up',style: FontStyle.titleCard,),
                        SizedBox(height:  12.h,),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.main
                                  ),
                                  child: Padding(
                                   padding:  EdgeInsets.all(14.w),
                                    child: SvgPicture.asset('assets/image/bank.svg'),
                                  )),
                                SizedBox(height: 4.h,),
                                Text('Bank',style: FontStyle.labelProfile,)
                              ],
                            ),
                            SizedBox(width:  50.w,),
                           Column(
                              children: [
                                Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.main
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(14.w),
                                    child: SvgPicture.asset('assets/image/transfer.svg'),
                                  )),
                                SizedBox(height: 4.h,),
                                Text('Transfer',style: FontStyle.labelProfile)
                              ],
                            ),
                            SizedBox(width:  50.w,),
                             Column(
                              children: [
                                Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.main
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(14.w),
                                    child: GestureDetector(
                                      onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Payment())),
                                      child: SvgPicture.asset('assets/image/Card.svg')),
                                  )),
                                SizedBox(height: 4.h,),
                                Text('Card',style: FontStyle.labelProfile)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h,)
                      ],
                    ),
                  ),
                ),
              
                SizedBox(height: 41.h,),
                Text('Transaction History',style: FontStyle.title2,),
                SizedBox(height: 24.h,),
                Transactions(),
                SizedBox(height: 40.h,),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => Padding(
        padding:  EdgeInsets.only(bottom: 12.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: colors.gray,
                blurRadius: 1
              )
            ]
          ),
          child: Row(
            children: [
              SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('-N3,000.00',style: FontStyle.payd,),
                SizedBox(height: 4.h,),
                 Text('Delivery free'),  
              ],
            ),
            Spacer(),
             Text('July 7, 2022',style: FontStyle.labelFieldDate,),  
             SizedBox(width: 12.w,)
          ],),
        ),
      )
    );
  }
}


