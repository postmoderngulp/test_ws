import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../presentation/style/colors.dart';
import '../../../presentation/style/font.dart';
import '../../domain/usecases/getProfilesFromRepository.dart';
import '../provider/chats_notifier.dart';
import 'chat_rider.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final useCase = context.read<GetProfilesFromRepository>();
    return ChangeNotifierProvider(create: (context) => ChatsNotifier(usecase: useCase),child: SubChatWidget(),);
  }
}


class SubChatWidget extends StatelessWidget {
  const SubChatWidget({super.key});

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
        title: Text('Chats',style: FontStyle.titleAppBar,),
        centerTitle: true,
        shadowColor: colors.gray1,
        elevation: 3,
      )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 21.h,),
              Search(),
              SizedBox(height: 27.h,),
              ListChats(),
              
            ],
          ),
        ),
      ),
    );
  }
}


class ListChats extends StatelessWidget {
  const ListChats({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatsNotifier>();
    return ListView.builder(
      itemCount: model.profiles.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatRider(profile: model.profiles[index],)),),
        child: Container(
        
        height: 84.2.h,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colors.gray2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8.w,),
              Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/image/avatar.png'))
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.profiles[index].name),
                      Text('Thanks for your service',style: FontStyle.labelProfile,),
        
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 26.w,
                    height: 26,
                    decoration: const BoxDecoration(
                      color: colors.main,
                      shape: BoxShape.circle
                    ),
                    child: const Center(child: Text('1',style: TextStyle(color: Colors.white),)),
                  ),
                  SizedBox(width: 8.w,)
            ],
          ),
        ),
      ),
    ),);
  }
}


class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatsNotifier>();
    return SizedBox(
      width: 342.w,
      height: 40.h,
      child: TextField(
        onChanged: (val) => model.search(val),
        cursorColor: colors.main,
        decoration: InputDecoration(
          fillColor: colors.gray1,
          filled: true,
          focusColor: colors.gray1,
          hoverColor: colors.gray1,
          contentPadding: EdgeInsets.all(20.w),
          hintText: 'Search services',
          hintStyle : FontStyle.labelSearch ,
          suffixIcon: Padding(
            padding:  EdgeInsets.all(12.w),
            child: SvgPicture.asset('assets/image/search.svg'),
          ),
          
          focusedBorder: OutlineInputBorder(
            
          borderSide: BorderSide(
            color: colors.gray1,
          ),
            borderRadius: BorderRadius.circular(4)
          ),
          border: OutlineInputBorder(
            
          borderSide: BorderSide(
            color: colors.gray1,
          ),
            borderRadius: BorderRadius.circular(4)
          ),
          enabledBorder: OutlineInputBorder(
            
          borderSide: BorderSide(
            color: colors.gray1,
          ),
            borderRadius: BorderRadius.circular(4)
          ),
        ),
      ),
    );
  }
}