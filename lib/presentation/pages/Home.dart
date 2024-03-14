import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../session5/data/datasource/remote_data_source.dart';
import '../../session5/data/repositoryimpl/repositoryImpl.dart';
import '../../session5/domain/usecases/getProfileFromRepository.dart';
import '../../session5/presentation/pages/home_widget.dart';
import '../style/font.dart';
import 'profile.dart';
import 'track.dart';
import 'wallet.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RemoteDataSource source = RemoteDataSourceImpl();
  late RepositoryImpl repo = RepositoryImpl(source: source);
  late getProfileFromRepository usecase = getProfileFromRepository(repository: repo);
  int currentIndex = 0;
  List<Widget> tabs = [HomeWidget(),Wallet(),Track(),Profile()];
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: MultiProvider(
          providers: [
            Provider.value(value:  usecase)
          ],
          child: Scaffold(
            backgroundColor: Colors.white,
            body: tabs[currentIndex],
            bottomNavigationBar:SizedBox(
              height: 60.h,
              child: Row(children: [
                SizedBox(width: 16.w,),
                GestureDetector(
                  onTap: () => setState(() {
                    currentIndex = 0;
                  }),
                  child: Column(
                    children: [
                     currentIndex == 0 ? SvgPicture.asset('assets/image/topMark.svg') : SizedBox(height: 0.h,),
                      currentIndex == 0 ?  SizedBox(height: 8.h,) : SizedBox(height: 10.h,),
                      currentIndex == 0 ? SvgPicture.asset('assets/image/home_active.svg') : SvgPicture.asset('assets/image/home.svg'),
                      SizedBox(height: 3.h,),
                      Text('Home',style: currentIndex == 0 ?  FontStyle.labelNavMain : FontStyle.labelNav ,),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => setState(() {
                    currentIndex = 1;
                  }),
                  child: Column(
                    children: [
                     currentIndex == 1 ? SvgPicture.asset('assets/image/topMark.svg') : SizedBox(height: 0.h,),
                      SizedBox(height: 8.h,),
                      currentIndex == 1 ? SvgPicture.asset('assets/image/wallet_active.svg') : SvgPicture.asset('assets/image/wallet.svg'),
                      SizedBox(height: 3.h,),
                      Text('Wallet',style: currentIndex == 1 ?  FontStyle.labelNavMain : FontStyle.labelNav  ,),
                    ],
                  ),
                )
                ,
                Spacer(),
                GestureDetector(
                  onTap: () => setState(() {
                    currentIndex = 2;
                  }),
                  child: Column(
                    children: [
                     currentIndex == 2 ? SvgPicture.asset('assets/image/topMark.svg') : SizedBox(height: 2.h,),
                      SizedBox(height: 8.h,),
                      currentIndex == 2 ? SvgPicture.asset('assets/image/track_active.svg') : SvgPicture.asset('assets/image/track.svg'),
                      SizedBox(height: 3.h,),
                      Text('Track',style: currentIndex == 2 ?  FontStyle.labelNavMain : FontStyle.labelNav  ,),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => setState(() {
                    currentIndex = 3;
                  }),
                  child: Column(
                    children: [
                     currentIndex == 3 ? SvgPicture.asset('assets/image/topMark.svg') : SizedBox(height: 2.h,),
                      SizedBox(height: 8.h,),
                      currentIndex == 3 ? SvgPicture.asset('assets/image/profile_active.svg') : SvgPicture.asset('assets/image/profile.svg'),
                      SizedBox(height: 3.h,),
                      Text('Profile',style: currentIndex == 3 ?  FontStyle.labelNavMain : FontStyle.labelNav  ,),
                    ],
                  ),
                ),
                 SizedBox(width: 17.w,),
              ],),
            ),
          ),
        ),
    );
  }
}
