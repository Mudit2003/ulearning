
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});
  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          color: AppColors.primaryBackground,
          child: Scaffold(
            body: SizedBox(
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      context
                          .read<WelcomeBloc>()
                          .add(WelcomePageChangeEvent(page: index));
                    },
                    children: <Widget>[
                      _page(
                        index: 1,
                        context: context,
                        buttonName: 'next',
                        title: 'First see learning',
                        subTitle:
                            'Forget about a paper for all the the knowledge in one learning',
                        imagePath: 'reading.png',
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttonName: 'next',
                        title: 'Connect with everyone',
                        subTitle:
                            'Always keep in touch with you tutor and friends',
                        imagePath: 'boy.png',
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttonName: 'get started',
                        title: 'Always fascinated learning',
                        subTitle:
                            'Anywhere anytime the time is our discretion study whenever you want',
                        imagePath: 'man.png',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 80.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _page(
      {required int index,
      required context,
      required String buttonName,
      required String title,
      required String subTitle,
      required String imagePath}) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              "assets/images/$imagePath",
              fit: BoxFit.cover,
            )),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              Global.storageService
                  .setBool(AppConstants.storageDeviceOpenFirstTime, true);
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/signIn/',
                (route) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primaryThirdElementText,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    // the offeset value is x , y +x in the right of box , -x in the left of box and so for y
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: AppColors.primaryBackground,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
