import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/widgets/course_grid.dart';
import 'package:ulearning_app/pages/homepage/widgets/home_page_text.dart';
import 'package:ulearning_app/pages/homepage/widgets/home_page_widgets.dart';
import 'package:ulearning_app/pages/homepage/widgets/menu_view.dart';
import 'package:ulearning_app/pages/homepage/widgets/search_view.dart';
import 'package:ulearning_app/pages/homepage/widgets/slider_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildHomePageAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
              margin: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25.w,
              ),
              child: CustomScrollView(
                // crossAxisAlignment: CrossAxisAlignment.start,

                slivers: [
                  const SliverToBoxAdapter(
                    child: HomePageText(
                      text: "Hello",
                      color: AppColors.primaryThirdElementText,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: HomePageText(
                      text: "Mudit",
                      color: AppColors.primaryText,
                      top: 0,
                    ),
                  ),
                  SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                  const SliverToBoxAdapter(child: SearchView()),
                  SliverToBoxAdapter(
                    child: SliderView(
                      currentPage: state.index,
                    ),
                  ),
                  const SliverToBoxAdapter(child: MenuView()),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 0.w,
                    ),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.6,
                      ),
                      delegate: SliverChildBuilderDelegate(childCount: 4,
                          (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: const CourseGrid(),
                        );
                      }),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
