import 'package:evento/constants/colors.dart';
import 'package:evento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

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
  final String? url,dayText, title, subtitle;
  final Color? color;
  final double? containerHeight, containerWidth, imageHeight, imageWidth, size,tileGape,dayCardTextSize;
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
      this.imageWidth,this.dayText,this.tileGape,this.dayCardTextSize})
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
                    bottomRight: dayContainerRadius
                  )
                ),
                child: Center(child: CommonText(text: dayText??'Today',color: whiteColor,size: dayCardTextSize??14.5,weight: FontWeight.w400,)),
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
  final String? url,dayText, title;
  final Color? color;
  final double? containerHeight, containerWidth, imageHeight, imageWidth, size,contentWidth,dayCardHeight,tileGape,dayCardTextSize;
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
        this.imageWidth, this.contentWidth, this.dayText,this.tileGape, this.dayCardHeight, this.dayCardTextSize})
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
            height: dayCardHeight??34.h,
            width: 84.w,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: dayContainerRadius,
                    bottomRight: dayContainerRadius
                )
            ),
            child: Center(child: CommonText(text: dayText??'Today',color: whiteColor,size: dayCardTextSize??14.5,weight: FontWeight.w400,)),
          ),
        ),
        SizedBox(
          height: contentWidth??10.h,
        ),
        Expanded(
          child: ListTile(
            horizontalTitleGap: tileGape??16,
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


