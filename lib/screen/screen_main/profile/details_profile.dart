import 'dart:io';
import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/controller/profile/showProfileDetailsController.dart';
import 'package:evento/screen/screen_main/home/showcase_images/utils.dart';
import 'package:evento/widgets/hovering_utility_widget.dart';
import 'package:evento/widgets/profiledetail_card.dart';
import 'package:evento/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class DetailsProfile extends StatelessWidget {
  const DetailsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowProfilesDetailsController.showProfilesDetailsController.fetchVendorDetails();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              const CommonText(
                text: "Show Case",
                color: Color(
                  0xFF2D2D2D,
                ),
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 20.h,
              ),
              buildShowCaseGrid(),
              SizedBox(
                height: 20.h,
              ),
              const ProfileDetailCardWidget(
                headText: "Profile Description",
                widgetItems: [
                  CommonText(
                    text: dummyText,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<ShowProfilesDetailsController>(
                  builder: (controller){
                  return ProfileDetailCardWidget(
                    headText: "Address",
                    widgetItems: [
                      CommonText(
                        text: "${controller.vendorPlace} ,",
                      ),
                      CommonText(
                        text: "${controller.vendorCity}",
                      ),
                      Row(
                        children: [
                          CommonText(
                            text: "${controller.vendorState}",
                          ),
                          SizedBox(width: 10.w,),
                          CommonText(
                            text: "${controller.vendorPincode}",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildShowCaseGrid() {
    final controller = ShowProfilesDetailsController.showProfilesDetailsController;
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: controller.showCaseImages.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => SizedBox(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: GestureDetector(
                onTap: () {
                  showEnlargedImage(index);
                },
                child: GetBuilder<ShowProfilesDetailsController>(
                  id: 'showCaseSection',
                  builder: (controller) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: controller.showCaseImages[index].runtimeType
                                  .toString() ==
                              'String'
                          ? Image.asset(
                              controller.showCaseImages[index],
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              controller.showCaseImages[index],
                              fit: BoxFit.fill,
                            ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: HoveringUtilityWidget(
                icon: Icons.edit,
                width: 30.w,
                height: 30.h,
                iconSize: 17,
                borderColor: whiteColor,
                isShadow: true,
                onPressed: (context) async {
                  showImagePickingPlatforms(index: index);
                  debugPrint("CLicked");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showImagePickingPlatforms({index}) {
    return Get.defaultDialog(
      title: "Pick image from...",
      contentPadding: const EdgeInsets.all(65),
      titleStyle: const TextStyle(color: primaryTextColor),
      barrierDismissible: true,
      titlePadding: const EdgeInsets.all(6),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                  pickImageFromPlatform(isGallery: true, index: index);
                },
                child: Image.asset(
                  "assets/images/platform/galleryPlatform.png",
                ),
              ),
            ),
            SizedBox(
              width: 5.0.w,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                  pickImageFromPlatform(isGallery: false, index: index);
                },
                child: Image.asset(
                  "assets/images/platform/cameraPlatform.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImageFromPlatform({required isGallery, required index}) async {
    final file =
        await Utils.pickMedia(isGallery: isGallery, cropImage: cropSquareImage);
    if (file == null) return;
    ShowProfilesDetailsController.showProfilesDetailsController.pickImage(index: index, file: file);
  }

  Future<File?> cropSquareImage(File imageFile) async {
    return await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
      aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
    );
  }

  showEnlargedImage(int index) {
    final controller = ShowProfilesDetailsController.showProfilesDetailsController;
    return Get.dialog(
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          padding: const EdgeInsets.all(30),
          height: 150,
          width: 100,
          decoration: BoxDecoration(color: Colors.grey.shade400),
          child: controller.showCaseImages[index].runtimeType
                      .toString() ==
                  'String'
              ? Image.asset(
                  controller.showCaseImages[index],
                  fit: BoxFit.contain,
                )
              : Image.file(
                  controller.showCaseImages[index],
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}
