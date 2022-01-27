import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/widgets/snackbar_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'api_constants.dart';
import 'models/registration.dart';

final controller = EventoController.eventoController;

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

  Future createVendor(EventoRegistration eventoModel, context) async {
    try {
      debugPrint(eventoModel.name);
      debugPrint(eventoModel.username);
      debugPrint(eventoModel.phoneNumber);
      debugPrint(eventoModel.email);
      debugPrint(eventoModel.password);
      debugPrint(eventoModel.password2);

      Response response = await _dio!.post(
        registerUrl,
        data: eventoModel.toJson(),
      );
      debugPrint("Complete error is ${response.data}");
      final Map<String,dynamic> ki = response.data;
      if(ki.containsKey('errors')){
        final responseBody = ki['errors'] as Map<String,dynamic>;
        if(responseBody['username'] != null){
          return commonSnackBar(title: "Authentication",message: responseBody['username'][0],color: whiteColor,bgColor: warningColors);
        }else if(responseBody['email'] != null){
         return commonSnackBar(title: "Authentication",message: responseBody['email'][0],color: whiteColor,bgColor: warningColors);
        }else if(responseBody['phone_number'] != null){
          return commonSnackBar(title: "Authentication",message: responseBody['phone_number'][0],color: whiteColor,bgColor: warningColors);
        }
      }else{
        commonSnackBar(title: "Registration",message: "That was a Success",color: whiteColor,bgColor: greenColor);
        Get.offNamedUntil('/login', (route) => false);
        controller.clearSignupControllers();
      }
    } on DioError catch (dioError) {
      debugPrint(dioError.toString());
    }
  }

  loginVendor() {}
}
