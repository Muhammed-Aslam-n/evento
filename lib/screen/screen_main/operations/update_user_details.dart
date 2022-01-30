import 'package:evento/constants/colors.dart';
import 'package:evento/controller/profile_updation/updateProfile.dart';
import 'package:evento/widgets/data_input_type.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/elusive_icons.dart';

class UpdateUserDetails extends StatelessWidget {
  UpdateUserDetails({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final updateProfileController = UpdateProfile.updateProfileController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const CommonText(
                    text: "Update Your Profile",
                    size: 20,
                    color: primaryTextColor,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller:
                    updateProfileController.nameController,
                    hintText: "Name",
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller: updateProfileController.phoneNumberController,
                    hintText: "Phone number",
                    prefixIcon: Icons.phone,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller: updateProfileController.emailEditingController,
                    hintText: "Email",
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller: updateProfileController.placeController,
                    hintText: "Place",
                    prefixIcon: Icons.place,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller: updateProfileController.cityEditingController,
                    hintText: "City",
                    prefixIcon: Icons.location_city,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller: updateProfileController.districtController,
                    hintText: "District",
                    prefixIcon: Elusive.location_circled,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DataInputField(
                    minLength: 9,
                    controller: updateProfileController.userStateController,
                    hintText: "State",
                    prefixIcon: Icons.bookmark,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          _validate();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: primaryTextColor),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    _formKey.currentState?.validate();
  }
}
