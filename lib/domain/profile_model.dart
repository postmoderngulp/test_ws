

import 'package:flutter/material.dart';
import 'package:test_ws/domain/entity/service.dart';

class ProfileModel extends ChangeNotifier {
  bool isDark =false;
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