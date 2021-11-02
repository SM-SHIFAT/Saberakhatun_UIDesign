import 'package:flutter/material.dart';
import 'dart:math' as math;

enum BannerPosition { left, right }

class BannerListTile extends StatelessWidget {
  final bool? bannerPositionRight;
  final bool? showBanner;
  final String? bannerText;
  final Color? bannerTextColor;
  final Color? bannerColor;
  final Color? backgroundColor;
  final Text? title;
  final Widget? subtitle;
  final BorderRadius? borderRadius;
  final Widget? imageContainer;
  final Widget? trailing;
  final double? trailingBoxwidth;
  final double? width;
  final double? subtitleOpacity;
  final double? bannersize;
  final bool? randomBackgroundColor; //Change background color randomly

  final List<Color> color = const [
    Color(0xff003354),
    Colors.blue
  ]; //Backgroundcolor list
  static int num = math.Random().nextInt(2); //takes a random number

  const BannerListTile({
    Key? key,
    this.bannerText,
    this.bannersize = 40.0,
    this.showBanner = true,
    this.bannerPositionRight = true,
    this.bannerTextColor,
    this.bannerColor,
    this.title,
    this.subtitle,
    this.borderRadius,
    this.imageContainer,
    this.trailing,
    this.trailingBoxwidth,
    this.backgroundColor = const Color(0xff003354),
    this.width,
    this.randomBackgroundColor,
    this.subtitleOpacity = 0.80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Container(
        width: width ?? screenwidth,
        child: Material(
          color: randomBackgroundColor == true ? color[num] : backgroundColor,
          child: Container(
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ClipPath(
                        clipper: ImageBoxClipper(),
                        child: Container(
                          height: 90,
                          width: 90,
                          color: Colors.white,
                          child: imageContainer,
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: 3, right: 3, top: 4, bottom: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  <------------------------------added here
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (title != null) title ?? Text(""),
                                        if (subtitle != null)
                                          Opacity(
                                              opacity: subtitleOpacity ?? 0.8,
                                              child: subtitle ?? Text("")),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                )
                              ],
                            ),
                            //  <------------------------------ to here

                            // if (title != null) title ?? Text(""),
                            // if (subtitle != null)
                            //   Opacity(
                            //       opacity: subtitleOpacity ?? 0.8,
                            //       child: subtitle ?? Text("")),
                          ],
                        ),
                      ),
                    ),
                    if (trailing !=
                        null) //                          >Trailing portion
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: trailingBoxwidth != null
                                ? trailingBoxwidth! < 50
                                    ? 50
                                    : trailingBoxwidth
                                : 50,
                            child: trailing ?? SizedBox(width: 0, height: 0)),
                      ),
                  ],
                ),
                if (showBanner ==
                    true) //                               >Banner implementation
                  Positioned(
                    top: 0,
                    left: bannerPositionRight == false ? 0 : null,
                    right: bannerPositionRight == true ||
                            bannerPositionRight == null
                        ? 0
                        : null,
                    child: ClipPath(
                      clipper: BannerClipper(bannerPositionRight),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bannerColor ?? Color(0xffcf0517),
                        ),
                        height: bannersize == null
                            ? 40
                            : bannersize! > 90 || bannersize! < 40
                                ? 40
                                : bannersize, //40
                        width: bannersize == null
                            ? 40
                            : bannersize! > 90 || bannersize! < 40
                                ? 40
                                : bannersize,
                        child: Align(
                            //                                     >Banner alignment
                            alignment: bannerPositionRight == false
                                ? Alignment.topLeft
                                : Alignment.topRight,
                            child: Transform.rotate(
                              //                     >Banner Text Rotate
                              angle: bannerPositionRight == false
                                  ? -math.pi / 4
                                  : math.pi / 4,
                              child: Container(
                                height: bannersize == null
                                    ? 30
                                    : bannersize! > 90 || bannersize! < 40
                                        ? 30
                                        : (30.0 * bannersize!) / 40.0, //30
                                width: bannersize == null
                                    ? 30
                                    : bannersize! > 90 || bannersize! < 40
                                        ? 30
                                        : (30.0 * bannersize!) / 40.0,
                                child: FittedBox(
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 2,
                                            top: 2,
                                            left: 2,
                                            bottom: 4),
                                        child: Text(
                                          //                    >Banner Text
                                          bannerText ?? "New",
                                          style: TextStyle(
                                              color: bannerTextColor ??
                                                  Colors.yellow),
                                        ))),
                              ),
                            )),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Custom image container shape
class ImageBoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

//Custom banner container shape
class BannerClipper extends CustomClipper<Path> {
  final bool? side;

  BannerClipper(this.side);

  @override
  Path getClip(Size size) {
    var path = Path();

    if (side == null || side == true) {
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else {
      path.lineTo(size.width, 0);
      path.lineTo(0, size.height);
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
