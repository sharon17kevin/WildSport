import 'dart:convert';
import 'package:get/get.dart';
import 'package:wild_sport/functions/shortsFunction.dart';
import 'package:wild_sport/models/shortsModel.dart';
import 'package:get_storage/get_storage.dart';

class ShortsController extends GetxController {
  var _shorts = <Short>[].obs;

  List<Short> get myNews => _shorts.value;

  void updateShorts(List<Short> shorts) {
    _shorts.value = shorts;
  }

  @override
  void onInit() {
    super.onInit();
    fetchShort();
  }

  Future<void> fetchShort() async {
    try{
      var response = await fetchShorts('http://192.168.8.104:3000/api/shorts');
      List<Short> short = shortFromJson(response);
      updateShorts(short);
      print("shorts ready");
    }catch(error) {
      throw Exception(error);
    }
  }
}