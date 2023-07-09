import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:train/features/profile/models/user_model.dart';

class FolowingController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  int folowingTabbarIndex = 1 ;

  final List<UserModel> users = [
    UserModel('محمدحسین حیدرزاده', '@mohammadhossein',false),
    UserModel('بهناز', '@behnaz',false),
    UserModel('طاها محمدزاده', '@taha',false),
    UserModel('زهرا طاهری', '@zahra',false),
    UserModel('نازنین', '@nazanin',true),
    UserModel('فرزانه', '@farzaneh',true),
    UserModel('غزل', '@ghazal',true),
    UserModel('محمد حسین', '@mhmd',true),
  ];
}