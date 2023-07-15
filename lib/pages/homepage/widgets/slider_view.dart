import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/widgets/home_page_widgets.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            onPageChanged: (value) {
              context.read<HomePageBloc>().add(HomePageDotsEvent(index: value));
            },
            children: [
              sliderContainer(path: 'assets/icons/Art.png'),
              sliderContainer(path: 'assets/icons/Image(1).png'),
              sliderContainer(path: 'assets/icons/Image(2).png'),
            ],
          ),
        ),
        Container(
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPage,
            decorator: DotsDecorator(
                color: AppColors.primaryThirdElementText,
                activeColor: AppColors.primaryElement,
                size: const Size.square(5.0),
                activeSize: const Size(17.0, 5.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
        )
      ],
    );
  }
}
