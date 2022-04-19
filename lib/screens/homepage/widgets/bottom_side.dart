import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

double sizing = 25.0;

class BottomSide extends StatelessWidget {
  const BottomSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        defaultSize: LayoutSize.desktop,
        builder: (context, size) {
          checkSizing(
              size); //* THIS FUNCTION IS JUST TO MAKE THE SIZE OF THE ICONS RESPONSIVE
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Get in touch!",
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.w900,
                    fontSize: 24.sp,
                  )),
              const Gap(30),
              RichText(
                text: TextSpan(
                    style: GoogleFonts.playfairDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp,
                        color: Colors.deepPurple),
                    children: [
                      TextSpan(
                        text: 'seunjeremiah@gmail.com ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('email');
                          },
                      ),
                      const TextSpan(
                        text: ' |  ',
                      ),
                      TextSpan(
                        text: '+2348098074775',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Phone number');
                          },
                      ),
                    ]),
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print('facebook');
                    },
                    child: SvgPicture.asset('assets/icons/facebook.svg',
                        height: sizing, width: sizing, color: Colors.deepPurple),
                  ),
                  size.size == LayoutSize.desktop ||
                          size.orientation == Orientation.landscape ||
                          Device.screenType == ScreenType.tablet
                      ? const Gap(50)
                      : const Gap(20),
                  InkWell(
                    onTap: () {
                      print('twitter');
                    },
                    child: SvgPicture.asset('assets/icons/twitter.svg',
                        height: sizing, width: sizing, color: Colors.deepPurple),
                  ),
                  size.size == LayoutSize.desktop ||
                          size.orientation == Orientation.landscape ||
                          Device.screenType == ScreenType.tablet
                      ? const Gap(50)
                      : const Gap(20),
                  InkWell(
                    onTap: () {
                      print('instagram');
                    },
                    child: SvgPicture.asset('assets/icons/instagram.svg',
                        height: sizing, width: sizing, color: Colors.deepPurple),
                  ),
                  size.size == LayoutSize.desktop ||
                          size.orientation == Orientation.landscape ||
                          Device.screenType == ScreenType.tablet
                      ? const Gap(50)
                      : const Gap(20),
                  InkWell(
                    onTap: () {
                      print('linkedin');
                    },
                    child: SvgPicture.asset('assets/icons/linkedin.svg',
                        height: sizing, width: sizing, color: Colors.deepPurple),
                  ),
                  size.size == LayoutSize.desktop ||
                          size.orientation == Orientation.landscape ||
                          Device.screenType == ScreenType.tablet
                      ? const Gap(50)
                      : const Gap(20),
                  InkWell(
                    onTap: () {
                      print('github');
                    },
                    child: SvgPicture.asset('assets/icons/github.svg',
                        height: sizing, width: sizing, color: Colors.deepPurple),
                  ),
                ],
              ),
              const Gap(100),
            ],
          );
        });
  }

  Future checkSizing(ScreenSize size) async {
    size.size == LayoutSize.desktop ||
            size.orientation == Orientation.landscape ||
            Device.screenType == ScreenType.tablet
        ? sizing = 25.0
        : sizing = 15.0;
  }
}
