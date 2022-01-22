import 'package:evento/constants/colors.dart';
import 'package:evento/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditAvailableSlots extends StatelessWidget {
  const EditAvailableSlots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateRangePickerController _dateRangePickerController =
        DateRangePickerController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              const CommonText(
                text: "Edit your Available Slots",
                color: primaryTextColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 550.h,
                  child: SfDateRangePicker(
                    todayHighlightColor: primaryTextColor,
                    backgroundColor: primaryBgColor,
                    initialSelectedDate:
                      DateTime(2022,2,1),
                    maxDate: DateTime(2022,2,28),
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.multiple,
                    showActionButtons: true,
                    controller: _dateRangePickerController,
                    confirmText: "UPDATE SLOTS",
                    selectionColor: warningColors,
                    initialSelectedDates: [
                      DateTime(2022,1,26),
                      DateTime(2022,2,23),
                      DateTime(2022,1,31),
                    ],
                    onCancel: () {
                      _dateRangePickerController.selectedDates = null;
                    },
                    onSubmit: (selectedDates) async {
                      await commonSnackBar(title: "Slots",message: "Slots Updated");
                      Future.delayed(const Duration(seconds: 1))
                          .whenComplete(() {
                            Get.back();
                          });

                      debugPrint(selectedDates.toString());
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: const Color(0xFFDFD6F3)),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CommonText(text: "Note: Selected dates will be treated as your unavailable days",size: 12,weight: FontWeight.w400,color: warningColors,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
