import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../data/datasource/remote_data_source.dart';
import '../../data/repositoryimpl/repositoryImpl.dart';
import '../../domain/entities/moves.dart';
import '../../domain/usecases/getProfileFromRepository.dart';
import '../../domain/usecases/getProfilesFromRepository.dart';

import '../../../presentation/style/colors.dart';
import '../../../presentation/style/font.dart';
import '../provider/home_notifier.dart';
import 'chats.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final usecase = context.read<getProfileFromRepository>();
    return ChangeNotifierProvider(create: (context) => HomeNotifier(usecase: usecase),child: SubHomeWidget(),);
  }
}


 List<Moves> moves = [
    Moves(namePath: 'customer', title: 'Customer Care', label: 'Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today'),
    Moves(namePath: 'send_package', title: 'Send a package', label: 'Request for a driver to pick up or deliver your package for you'),
    Moves(namePath: 'fund_wallet', title: 'Fund your wallet', label: 'To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today'),
    Moves(namePath: 'chats', title: 'Chats', label: 'Search for available rider within your area'),
  ];

  List<Image> adds = [
    Image.asset('assets/image/first_add.png'),
    Image.asset('assets/image/second_add.png'),
  ];


class SubHomeWidget extends StatefulWidget {
  
  const SubHomeWidget({super.key});

  @override
  State<SubHomeWidget> createState() => _SubHomeWidgetState();
}

class _SubHomeWidgetState extends State<SubHomeWidget> {
  RemoteDataSource source = RemoteDataSourceImpl();
  late RepositoryImpl repo = RepositoryImpl(source: source);
  late GetProfilesFromRepository useCase = GetProfilesFromRepository(repo: repo);
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 24.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Search(),

          ),
          SizedBox(height: 24.h,),
          Padding(
             padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: MiniProfile(),
          ),
           SizedBox(height: 39.h,),
          Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Text('Special for you',style: FontStyle.labelProfileWarn,),
                Spacer(),
                 SvgPicture.asset('assets/image/arrow_start.svg'),
              ],
            ),
          ),
         SizedBox(height: 7.h,),
          Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Banners(),
          ),
          SizedBox(height: 29.h,),
          Padding(
             padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Text('What would you like to do',style: FontStyle.titleMainMiniProfile,),
          ),
          SizedBox(height: 9.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Wrap(
              children: List.generate(moves.length, (index) =>  Padding(
                  padding:  EdgeInsets.only(right:  index == 0 ||  index == 2 ? 23.w : 0,bottom: 23.h),
                  child:  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiProvider(providers: [Provider.value(value: useCase)],
                    child: ChatsWidget()))),
                    child: Container(
                          width: 159.w,
                          height: 159.h,
                          decoration: BoxDecoration(
                            color: colors.gray6,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 26.h,),
                                  SvgPicture.asset('assets/image/${moves[index].namePath}.svg',colorFilter: ColorFilter.mode(colors.main, BlendMode.srcIn),),
                                   Text('${moves[index].title}',style: FontStyle.titleService,),
                                    SizedBox(height: 6.h,),
                                    Text('${moves[index].label}',style: FontStyle.labelDescService,),
                                ],
                            ),
                          ),
                    ),
                  ),
              )),
            ),
          )
        
        ],),
      ),
    );
  }
}


class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: adds.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding:  EdgeInsets.only(right: 10.w),
          child: SizedBox(
            width: 166.w,
            height: 64.h,
            
            child: adds[index]),
        ),),
    );
  }
}

class MiniProfile extends StatelessWidget {
  const MiniProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeNotifier>();
    return Container(
      width: 341.w,
      height: 91.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.main
      ),
      child: Stack(
        children: [
           Row(
             children: [
              Spacer(),
               Padding(
                 padding: const EdgeInsets.all(3.0),
                 child: SvgPicture.asset('assets/image/ellipse_right.svg'),
               ),
             ],
           ),
           Row(
             children: [
               Column(
                 children: [
                   Spacer(),
                   Padding(
                     padding: const EdgeInsets.all(3.0),
                     child: SvgPicture.asset('assets/image/ellipse_left.svg'),
                   ),
                 ],
               ),
              
             ],
           ),
             
          
          
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10.w,),
             Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/image/avatar.png'))
                  ),
                ),
                 SizedBox(width: 4.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.profile != null ? "${model.profile?.name}" : 'Hello ken!',style: FontStyle.titleProfile,),
                    Text('We trust you are having a great time',style: FontStyle.labelMiniProfile,),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset('assets/image/notification.svg',colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),),
                SizedBox(width: 15.w,)
          ],
        ),
        ], 
      ),
    );
  }
}


class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342.w,
      height: 34.h,
      child: TextField(
        
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