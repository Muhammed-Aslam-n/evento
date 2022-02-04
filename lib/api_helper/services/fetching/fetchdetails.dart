import 'package:dio/dio.dart';
import 'package:evento/api_helper/models/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../api_constants/api_constants.dart';

class FetchVendorAPI{

  static FetchVendorAPI fetchVendorAPI = Get.find();
  Dio? _dio;
  static const secureStorage = FlutterSecureStorage();

  FetchVendorAPI(){
    _dio = Dio();
  }

  Future<List<EventoRegistration>?> fetchDetails() async {
    try {
      final eventoList = <EventoRegistration>[];
      Response response = await _dio!.get(getUrl);
      EventoRegistration? evento;
      for (var item in response.data) {
        evento = EventoRegistration.fromJson(item);
        eventoList.add(evento);
      }
      debugPrint("Value Kitti Mone");
      return eventoList;
    } on DioError catch (dioError) {
      debugPrint(dioError.message.toString());
    }
  }

}