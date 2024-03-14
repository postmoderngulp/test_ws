
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../provider/check_info_model.dart';
import '../style/colors.dart';
import '../style/font.dart';
import 'successful.dart';

class CheckInfo extends StatelessWidget {
  const CheckInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CheckInfoModel(),child: SubScheckInfo(),);
  }
}


class SubScheckInfo extends StatelessWidget {
  const SubScheckInfo({super.key});

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
        automaticallyImplyLeading: false,
        title: Text('Send a package',style: FontStyle.titleAppBar,),
        centerTitle: true,
        shadowColor: colors.gray1,
        elevation: 0.5,
      )),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h,),
              Text('Package Information',style:FontStyle.titleSend,),
              SizedBox(height: 8.h,),
               Text('Origin details'),
                SizedBox(height: 4.h,),
                Text('Mbaraugba, Ovom Amaa Asaa, Abia state',style:FontStyle.labelInfo,),
                SizedBox(height: 4.h,),
                Text('+234 56543 96854',style:FontStyle.labelInfo,),
                SizedBox(height: 8.h,),
                  Text('Destination details'),
                  SizedBox(height: 4.h,),
                  Destinations(),
                  SizedBox(height: 8.h,),
                   Text('Other details'),
                    SizedBox(height: 4.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Package items',style:FontStyle.labelInfo,),
                         Spacer(),
                         Text('Books ans stationary, Garri Ngwa',style:FontStyle.labelInfoWarn,),
                      ],
                    ),
                    SizedBox(height: 8.h,),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Weight of items',style:FontStyle.labelInfo,),
                          Spacer(),
                         Text('1000kg',style:FontStyle.labelInfoWarn,),
                      ],
                    ),  
                    SizedBox(height: 8.h,),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Worth of Items',style:FontStyle.labelInfo,),
                          Spacer(),
                         Text('N50,000',style:FontStyle.labelInfoWarn,),
                      ],
                    ),
                    SizedBox(height: 8.h,),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Tracking Number',style:FontStyle.labelInfo,),
                          Spacer(),
                         Text('R-7458-4567-4434-5854',style:FontStyle.labelInfoWarn,),
                      ],
                    ),
                     SizedBox(height: 37.h,),

                     SvgPicture.asset('assets/image/divider.svg'),
                     SizedBox(height: 8.h,),
                     Text('Charges',style:FontStyle.titleSend,),
                     SizedBox(height: 10.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Delivery Charges',style:FontStyle.labelInfo,),
                       Spacer(),
                      Text('N2,500.00',style:FontStyle.labelInfoWarn,),
                    ],),
                    SizedBox(height: 8.h,),
                  Row(children: [
                      Text('Instant delivery',style:FontStyle.labelInfo,),
                       Spacer(),
                      Text('N300.00',style:FontStyle.labelInfoWarn,),
                    ],),
                    SizedBox(height: 8.h,),
                  Row(children: [
                      Text('Tax and Service Charges',style:FontStyle.labelInfo,),
                       Spacer(),
                      Text('N200.00',style:FontStyle.labelInfoWarn,),
                    ],),
                    SizedBox(height: 9.h,),
                    SvgPicture.asset('assets/image/divider.svg'),
                     SizedBox(height: 4.h,),
                      Row(children: [
                      Text('Package total',style:FontStyle.labelInfo,),
                       Spacer(),
                      Text('N3000.00',style:FontStyle.labelInfoWarn,),
                    ],),
                    SizedBox(height: 24.h,),
                     Text('Click on  delivered for successful delivery and rate rider or report missing item',style: TextStyle(color: colors.main,fontSize: 12.sp),),
                     SizedBox(height: 24.h,),
                     Buttons()
            ],
          ),
        ),
      ),
    );
  }
}



class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
              SizedBox(
                width: 158.w,
                height: 48.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    side: MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  onPressed: () {}, child: Text('Report',style: TextStyle(color: colors.main),)),),
                  Spacer(),
                  SizedBox(
                width: 158.w,
                height: 48.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.main),
                    side: MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Successful()));}, child: Text('Successful')),),
        ],
      ),
    );
  }
}

class Destinations extends StatelessWidget {
  const Destinations({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('19 Ademola Alabi close, lagos ',style:FontStyle.labelInfo,),
          SizedBox(height: 4.h,),
          Text('+234 70644 80655',style:FontStyle.labelInfo,),
      ],
    ),);
  }
}