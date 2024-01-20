import 'dart:convert';

import 'package:cropapp/data/models/my_crop_model.dart';

import '../../services/request_services.dart';

class MyCropRepo {
  Future<MyCropModel> getMyCrop() async {
    try {
      MyCropModel myCropModel = MyCropModel.fromJson(jsonDecode(
          await getRequestServices(
              'https://api.mapmycrop.com/satellite/field-imagery?api_key=424ddd23098841bbb64bb972d3ad177f&farm_id=30ee241065cf43ddac897e44ffb458d9&index=NDVI&satellite=S1&satellite_date=2023-12-08')));
      return myCropModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
