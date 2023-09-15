import 'dart:convert';
import 'package:get/get.dart';
import 'package:wild_sport/models/highlightsModel.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wild_sport/functions/highlightsFunctions.dart';

class HighlightsController extends GetxController {
  var _highlights = <Highlight>[].obs;

  List<Highlight> get myNews => _highlights.value;

  void updateHighlights(List<Highlight> highlights) {
    _highlights.value = highlights;
  }

  @override
  void onInit() {
    super.onInit();
    fetchHighlight();
  }

  Future<void> fetchHighlight() async {
    try{
      var response = await fetchHighlights('http://172.20.10.3:3000/api/highlights');
      List<Highlight> highlight = highlightsFromJson(response);
      updateHighlights(highlight);
      print("highlights ready");
    }catch(error) {
      throw Exception(error);
    }
  }
}