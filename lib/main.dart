import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_ws/presentation/navigation/navigate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: "https://oeqeyuofmccivieafdoz.supabase.co",anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9lcWV5dW9mbWNjaXZpZWFmZG96Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkxOTIyMTUsImV4cCI6MjAyNDc2ODIxNX0.fwXJgiwyH4A1S2pHuUj4s6_COM3VuHiykrbgVkvOhv0",);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NavigateService service = NavigateService();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: service.routes,
        initialRoute: service.initialroute,
      ),
    );
  }
}
