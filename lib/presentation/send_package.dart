import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/domain/send_package_model.dart';
import 'package:test_ws/presentation/send_info.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';

class SendPackage extends StatelessWidget {
  const SendPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SendPackageModel(),child: SubSendPackage(),);
  }
}

class SubSendPackage extends StatelessWidget {
  const SubSendPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 43.h,),
              Row(
                children: [
                    SvgPicture.asset('assets/image/details.svg'),
                    SizedBox(width: 8.w,),
                    Text('Origin Details')
                ],
              ),
              SizedBox(height: 5.h,),
                Address(),
                SizedBox(height: 5.h,),
                State(),
                  SizedBox(height: 5.h,),
                Number(),
                  SizedBox(height: 5.h,),
                Others(),
                 SizedBox(height: 39.h,),
                Row(
                children: [
                    SvgPicture.asset('assets/image/details.svg'),
                    SizedBox(width: 8.w,),
                    Text('Destination Details')
                ],
              ),
              SizedBox(height: 4.h,),
                Destinations(),
                 SizedBox(height: 10.h,),
                 Row(
                children: [
                    SvgPicture.asset('assets/image/add.svg'),
                    SizedBox(width: 8.w,),
                    Text('Add destination')
                ],
              ),
              SizedBox(height: 13.h,),
              Text('Package Details'),
              SizedBox(height: 8.h,),
              Items(),
              SizedBox(height: 8.h,),
              Weight(),
              SizedBox(height: 8.h,),
              Worth(),
              SizedBox(height: 39.h,),
              Text('Select delivery type'),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sendinfo(),)),
                    child: Container(
                        width: 159.w,
                        height: 75.h,
                      decoration: BoxDecoration(
                        color: colors.main,
                        borderRadius: BorderRadius.circular(8),
                    
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 12.h,),
                          SvgPicture.asset('assets/image/clock.svg'),
                           SizedBox(height: 10.h,),
                             Text('Instant delivery',style: FontStyle.delivery,),
                        ],
                      ),
                    ),
                  ),
                     SizedBox(width: 24.w,),
                   Container(

                     width: 159.w,
                      height: 75.h,
                    decoration: BoxDecoration(
                      boxShadow: [
            BoxShadow(
              color: colors.gray2,
              blurRadius: 1
            )
          ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h,),
                        SvgPicture.asset('assets/image/calendar.svg'),
                         SizedBox(height: 10.h,),
                           Text('Scheduled delivery',style: FontStyle.schedulded,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}


class Destinations extends StatelessWidget {
  const Destinations({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DestinationAddress(),
        SizedBox(height: 4.h),
        DestinationState(),
         SizedBox(height: 4.h),
        DestinationAddress(),
        SizedBox(height: 4.h),
        DestinationOthers(),
      ],
    ),);
  }
}


class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'package items',
        hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}

class Weight extends StatelessWidget {
  const Weight({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Weight of item(kg)',
        hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}


class Worth extends StatelessWidget {
  const Worth({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Worth of Items',
        hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}


class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Address',
        hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}


class DestinationAddress extends StatelessWidget {
  const DestinationAddress({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Address',
        hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}

class State extends StatelessWidget {
  const State({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'State,Country',
          hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}


class DestinationState extends StatelessWidget {
  const DestinationState({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'State,Country',
          hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}

class DestinationNumber extends StatelessWidget {
  const DestinationNumber({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone number',
          hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  const Number({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none,
          hintText: 'Phone number',
          hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}
class Others extends StatelessWidget {
  const Others({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Others',
          hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}

class DestinationOthers extends StatelessWidget {
  const DestinationOthers({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: 32.h,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Others',
          hintStyle: FontStyle.labelSend
        ),
      ),
    );
  }
}



