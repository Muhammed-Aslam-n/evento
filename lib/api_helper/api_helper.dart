import 'package:dio/dio.dart';
import 'package:evento/models/registration.dart';
import 'package:evento/screen/profile_setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'api_constants.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
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

  Future createVendor(EventoRegistration eventoModel) async {
    try {
      Response response = await _dio!.post(
        registerUrl,
        data: eventoModel.toJson(),
      );

      if(response.statusCode == 200){
        Get.to(() => const SetupProfile());
      }
      debugPrint("Response of Post is ${response.data}");
      for (var item in response.data) {
        debugPrint(item.toString());
      }
    } catch (dioError) {
      debugPrint("Common Post is not Worked Well now.....$dioError");
    }
  }
}
