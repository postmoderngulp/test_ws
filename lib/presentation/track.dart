import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_ws/domain/track_model.dart';
import 'package:test_ws/presentation/check_info.dart';
import 'package:test_ws/presentation/style/colors.dart';
import 'package:test_ws/presentation/style/font.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class Track extends StatelessWidget {
  const Track({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TrackModel(),child: SubTack(),);
  }
}

class SubTack extends StatelessWidget {
  const SubTack({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TrackModel>();
    return  Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
                                    height: 300.h,
                                    child: YandexMap(
                                      onMapTap: (argument) {},
                                      mapObjects: [],
                                      mode2DEnabled: false,
                                      mapType: MapType.vector,
                                      nightModeEnabled:
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? true
                                              : false,
                                      onMapCreated: (controller) {
                                        model.mapController.complete(controller);
                                        controller.moveCamera(
                                            CameraUpdate.newCameraPosition(
                                                const CameraPosition(
                                                    zoom: 4.5,
                                                    target: Point(
                                                        latitude: 0,
                                                        longitude: 0))));
                                      },
                                      gestureRecognizers: <Factory<
                                          OneSequenceGestureRecognizer>>{
                                        Factory<OneSequenceGestureRecognizer>(
                                          () => EagerGestureRecognizer(),
                                        ),
                                      },
                                    ),
                                  ),
            SizedBox(
              height: 42.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Text('Tracking Number'),
            ),
             SizedBox(
              height: 24.h,
            ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                SvgPicture.asset('assets/image/sun.svg'),
                SizedBox(width: 4.w,),
                Text('R-7458-4567-4434-5854',style: TextStyle(color: colors.main),),
              ],
            ),
          ),
             SizedBox(
              height: 16.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Text('Package Status',style: TextStyle(color: colors.gray1),),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
               padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Wrap(
                children: List.generate(4, (index) => Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 14.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: colors.main,
                            borderRadius: BorderRadius.circular(2.33)
                          ),
                          child: Center(child: SvgPicture.asset('assets/image/ok.svg'))),
                        index == 3 ? const SizedBox() : SvgPicture.asset('assets/image/line.svg'),
                      ],
                    ),
                    SizedBox(width: 7.w,),
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Courier requested',style: TextStyle(color: colors.main),),
                        SizedBox(height: 4.h,),
                        Text('July 7 08:00am',style: FontStyle.labelInfoWarn,),
                      ],
                    )
                  ],
                )),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Center(child: ViewInfoButton()),
              )
          ],),
        ),
    );
  }
}


class ViewInfoButton extends StatelessWidget {
  const ViewInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
                width: 342.w,
                height: 46.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.main),
                    side: MaterialStatePropertyAll(BorderSide(color: colors.main  )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CheckInfo()));}, child: Text('View Package Info',style: TextStyle(color: Colors.white),)),);
  }
}