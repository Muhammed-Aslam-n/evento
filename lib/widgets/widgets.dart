import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: AppBar(
              centerTitle: true,
              leading: const Icon(
                Icons.keyboard_arrow_left,
                color: primaryTextColor,
              ),
              backgroundColor: whiteColor,
              title: const CommonText(
                text: "Payment Method",
                color: primaryTextColor,
              ),
            ),
          )),
    );
  }
}

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign isCenter;
  final double? height;

  const CommonText(
      {this.text,
      this.weight,
      this.size,
      this.color,
      this.isCenter = TextAlign.left,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: "poppins",
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w600,
      ),
      textAlign: isCenter,
    );
  }
}

// class CommonText extends StatelessWidget {
//   final String? text;
//   final Color? color;
//   final double? size;
//   final FontWeight? weight;
//
//   const CommonText({this.text, this.weight, this.size, this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text ?? '',
//       style: TextStyle(
//           color: color ?? Colors.grey.shade800,
//           fontSize: size,
//           fontWeight: weight ?? FontWeight.w400),
//     );
//   }
// }

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class DataTextFields extends StatelessWidget {
  final String? hintText, errorText;
  final int? minLength, maxLength;
  final double? hintSize;
  final bool ismaxLength, obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const DataTextFields(
      {Key? key,
      this.hintText,
      this.errorText,
      this.controller,
      this.minLength,
      this.ismaxLength = false,
      this.textInputType,
      this.maxLength,
      this.obscureText = false,
      this.hintSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.87,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.name,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(fontSize: hintSize ?? 12),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
          ),
        ),
        // validator: Validators.compose(
        //   [
        //     Validators.required("$hintText is required"),
        //     Validators.minLength(minLength ?? 1,
        //         "$hintText must be greater than $minLength characters"),
        //     ismaxLength
        //         ? Validators.maxLength(maxLength ?? 3,
        //             "$hintText must be less than ${maxLength ?? 3} digits")
        //         : Validators.maxLength(150, "$hintText must be less than 150")
        //   ],
        // ),
        validator: ValidationBuilder().minLength(3).build(),
      ),
    );
  }
}

Widget commonButton(
        {text, height, width, color, textSize, textColor, onPressed}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(width ?? 250.w, height ?? 48.h)),
        backgroundColor:
            MaterialStateProperty.all<Color>(color ?? secondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: CommonText(
        text: text,
        size: textSize ?? 20.sp,
        weight: FontWeight.w500,
        color: whiteColor,
      ),
    );

class CommonProfileDisplayWidget extends StatelessWidget {
  final String? url;
  final Color? color;
  final double? height, width;

  const CommonProfileDisplayWidget(
      {Key? key, this.url, this.color, this.height = 40, this.width = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height! + 4,
      width: width! + 4,
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: color ?? secondaryColor, shape: BoxShape.circle),
      child: ClipOval(
        child: Image.network(
          url ?? sampleProfileImageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: Image.asset(
                "assets/gifs/loadingGiphy.gif",
                height: height ?? 40.h,
                width: width ?? 40.w,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CommonAppointmentWidget extends StatelessWidget {
  final String? url, dayText, title, subtitle;
  final Color? color;
  final double? containerHeight,
      containerWidth,
      imageHeight,
      imageWidth,
      size,
      tileGape,
      dayCardTextSize;
  final FontWeight? weight;
  final bool isTrailing;

  const CommonAppointmentWidget(
      {Key? key,
      this.url,
      this.color,
      this.title,
      this.subtitle,
      this.size,
      this.weight,
      this.isTrailing = false,
      this.containerHeight,
      this.containerWidth,
      this.imageHeight,
      this.imageWidth,
      this.dayText,
      this.tileGape,
      this.dayCardTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: primaryBgColor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 34.h,
                width: 84.w,
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: dayContainerRadius,
                        bottomRight: dayContainerRadius)),
                child: Center(
                    child: CommonText(
                  text: dayText ?? 'Today',
                  color: whiteColor,
                  size: dayCardTextSize ?? 14.5,
                  weight: FontWeight.w400,
                )),
              ),
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  horizontalTitleGap: 16,
                  leading: SizedBox(
                    height: imageHeight,
                    width: imageWidth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        url ?? sampleProfileImageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: Image.asset(
                              "assets/gifs/loadingGiphy.gif",
                              height: imageHeight ?? 40.h,
                              width: imageWidth ?? 40.w,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  title: CommonText(
                    text: title ?? '',
                    color: primaryTextColor,
                    size: size ?? 14.0,
                    weight: weight ?? FontWeight.w500,
                  ),
                  subtitle: CommonText(
                    text: subtitle ?? '',
                    color: primaryTextColor,
                    size: size ?? 11.5,
                    weight: weight ?? FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}

class AppointmentShortCardWidget extends StatelessWidget {
  final String? url, dayText, title;
  final Color? color;
  final double? containerHeight,
      containerWidth,
      imageHeight,
      imageWidth,
      size,
      contentWidth,
      dayCardHeight,
      tileGape,
      dayCardTextSize;
  final FontWeight? weight;

  const AppointmentShortCardWidget(
      {Key? key,
      this.url,
      this.color,
      this.title,
      this.size,
      this.weight,
      this.containerHeight,
      this.containerWidth,
      this.imageHeight,
      this.imageWidth,
      this.contentWidth,
      this.dayText,
      this.tileGape,
      this.dayCardHeight,
      this.dayCardTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: primaryBgColor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: dayCardHeight ?? 34.h,
                width: 84.w,
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: dayContainerRadius,
                        bottomRight: dayContainerRadius)),
                child: Center(
                    child: CommonText(
                  text: dayText ?? 'Today',
                  color: whiteColor,
                  size: dayCardTextSize ?? 14.5,
                  weight: FontWeight.w400,
                )),
              ),
            ),
            SizedBox(
              height: contentWidth ?? 10.h,
            ),
            Expanded(
              child: ListTile(
                horizontalTitleGap: tileGape ?? 16,
                trailing: SizedBox(
                  height: imageHeight,
                  width: imageWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      url ?? sampleProfileImageUrl,
                      // height: imageHeight,
                      // width: imageWidth,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: Image.asset(
                            "assets/gifs/loadingGiphy.gif",
                            height: imageHeight ?? 40.h,
                            width: imageWidth ?? 40.w,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                title: CommonText(
                  text: title ?? '',
                  color: primaryTextColor,
                  size: size ?? 14.0,
                  weight: weight ?? FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
}

class OrderDetailsCard extends StatelessWidget {
  final String? title;
  final List<Widget>? list;
  final bool isIcon;
  final double? titleSize;
  final IconData? icon;
  final void Function(BuildContext context)? onTap;

  const OrderDetailsCard(
      {Key? key,
      this.title,
      this.isIcon = false,
      this.titleSize = 18,
      this.icon,
      this.onTap,
      this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303.w,
      decoration: BoxDecoration(
        color: primaryBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 36.h,
              width: 112.w,
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: orderContainerRadius,
                    bottomRight: orderContainerRadius),
              ),
              child: Center(
                  child: CommonText(
                text: title,
                size: titleSize ?? 18,
                color: whiteColor,
              )),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: list!.map((e) => e).toList(),
              ),
              isIcon
                  ? GestureDetector(
                      onTap: () => onTap!(context),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        height: 48.h,
                        width: 48.w,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.grey.shade400, width: 0.4),
                        ),
                        child: Icon(
                          icon,
                          color: const Color(0xFF58BC8A),
                          size: 27,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class HoveringUtilityWidget extends StatelessWidget {
  final double? height, width;
  final IconData? icon;
  final Color? borderColor, iconColor, containerColor;
  final double? iconSize;
  final bool isShadow;
  final Future Function(BuildContext context)? onPressed;

  const HoveringUtilityWidget(
      {Key? key,
      this.height,
      this.width,
      this.icon,
      this.borderColor,
      this.iconColor,
      this.containerColor,
      this.iconSize,
      this.isShadow = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 51.h,
      width: width ?? 51.w,
      decoration: BoxDecoration(
        color: containerColor ?? whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: isShadow ? Colors.grey.shade400 : Colors.transparent,
            offset: const Offset(
              1.2,
              0.0,
            ),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
        border:
            Border.all(color: borderColor ?? primaryTextColor, width: 0.3.w),
      ),
      child: Center(
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () async => onPressed!(context),
          icon: Icon(
            icon,
            color: iconColor ?? primaryColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

class FloatingAButton extends StatelessWidget {
  final void Function(BuildContext context)? onPressed;
  final IconData? icon;
  final double? iconSize, elevation;
  final Color? fabBackground, iconColor;
  final String? toolTip;

  const FloatingAButton(
      {Key? key,
      this.onPressed,
      this.icon,
      this.iconSize,
      this.elevation,
      this.fabBackground,
      this.iconColor,
      this.toolTip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed!(context),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      backgroundColor: fabBackground,
      tooltip: toolTip,
      splashColor: Colors.transparent,
      elevation: elevation ?? 0,
    );
  }
}

commonSnackBar(
    {String? title, String? message, Color? color, Color? bgColor}) async {
  Get.snackbar(
    title ?? '',
    message ?? '',
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
    colorText: color ?? const Color(0xFF58BC8A),
    backgroundColor: bgColor ?? whiteColor,
  );
}

class ProfileDetailCardWidget extends StatelessWidget {
  final String? headText;
  final double? headSize;
  final List<Widget>? widgetItems;
  final void Function(BuildContext context)? onPressed;

  const ProfileDetailCardWidget(
      {Key? key,
      this.headText,
      this.headSize,
      this.onPressed,
      this.widgetItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            CommonText(
              text: headText ?? '',
              color: secondaryColor,
              size: headSize ?? 17,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgetItems!.map((widgets) => widgets).toList(),
              ),
            ),
            SizedBox(
              height: 0.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => onPressed!(context),
                child: const CommonText(
                  text: "Edit",
                  color: primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

buildRatingStars(rating) {
  return RatingBar.builder(
    initialRating: rating,
    itemSize: 25,
    itemCount: 5,
    allowHalfRating: true,
    itemBuilder: (context, index) {
      return const Icon(
        Icons.star,
        color: Colors.amber,
      );
    },
    onRatingUpdate: (rating) {
      debugPrint(rating.toString());
    },
  );
}


class BuildReviewWidget extends StatelessWidget {
  final String? userText,contentText,url,rating;
  const BuildReviewWidget({Key? key, this.userText, this.contentText, this.rating, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryBgColor
      ),
      child: Column(
        children: [
          ListTile(
            leading: CommonProfileDisplayWidget(url: url,height: 65,width: 52,color: Colors.transparent,),
            title: CommonText(text: userText??'',size: 12,),
            subtitle: CommonText(text: rating,color: primaryTextColor,size: 11,),
          ),
          SizedBox(height: 10.h,),
          CommonText(text: contentText,size: 11,)
        ],
      ),
    );
  }
}




class DataInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final int? minLength, maxLength;
  final double? hintSize,sbHeight;
  final bool obscureText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  const DataInputField({Key? key, this.labelText, this.hintText, this.minLength, this.maxLength, this.hintSize, this.obscureText=false, this.controller, this.textInputType, this.prefixIcon, this.sbHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sbHeight??80.h,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.name,
        enableSuggestions: true,
        decoration: InputDecoration(
          border: InputBorder.none,
            focusedBorder: bssBorderStyle,
            enabledBorder: bssBorderStyle,
          focusedErrorBorder: bssBorderStyle,
          errorBorder: bssBorderStyle,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon,color: primaryTextColor,),
          hintStyle: TextStyle(fontSize: hintSize ?? 12),
          filled: true,
          fillColor: Colors.white70,
          focusColor: primaryTextColor,
          prefixIconColor: primaryTextColor
        ),
        validator: ValidationBuilder().minLength(minLength??3).maxLength(maxLength??150).build(),
      ),
    );
  }
}



class ShowSimpleDialogue extends StatelessWidget {
  final String? title,mdFileName;
  const ShowSimpleDialogue({Key? key, this.title, this.mdFileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          CommonText(text: title,size: 16.3,color: primaryTextColor,),
          Expanded(child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 150)).then((value) => rootBundle.loadString('assets/policies/privacy_policy.md')),
            builder: (context,snapShot){
              if(snapShot.hasData){
                return Markdown(
                  data: snapShot.data.toString(),
                );
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),),
          TextButton(onPressed: (){
            Get.back();
          }, child: const Text("Close"))
        ],
      ),
    );
  }
}



