

import 'package:flutter/material.dart';
import '../pages/sign_in.dart';
import '../../domain/entity/service.dart';
import '../../data/repositoryimpl/supabase_service.dart';

class ProfileModel extends ChangeNotifier {
  bool isDark =false;
  String? name;
  int? balance;


  ProfileModel(){
    _setup();
    
  }

  void signOut(BuildContext context)async{
    SupabaseService service = SupabaseService();
    await service.signOut();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInWidget()), (route) => false);
  }

  void _setup() async{
    SupabaseService service = SupabaseService();
    final val = await service.getProfile();
    name = val.name;
    balance = val.balance;
    notifyListeners();
  }

  void setDark (){

    isDark = !isDark;
    notifyListeners();
  }
  List<Servicee> serviceList = [
    Servicee(title: 'Edit Profile',
    label: 'Name, phone no, address, email ...',
    imgName: 'edit_profile'
      
    ),Servicee(title: 'Statements & Reports ',
    label: 'Download transaction details, orders, deliveries',
    imgName: 'statement'
      
    ),Servicee(title: 'Notification Settings',
    label: 'mute, unmute, set location & tracking setting',
    imgName: 'notification'
      
    ),Servicee(title: 'Card & Bank account settings',
    label: 'change cards, delete card details',
    imgName: 'cardbank'
      
    ),Servicee(title: 'Referrals',
    label: 'check no of friends and earn',
    imgName: 'referrals'
      
    ),Servicee(title: 'About Us',
    label: 'know more about us, terms and conditions',
    imgName: 'about'
      
    ),Servicee(title: 'Log Out',
    label: '',
    imgName: 'log_out'
      
    ),
  ];

}