import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/home_controller.dart';
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
  late HomeController _homeController;
  @override
  void initState() {
    _homeController = HomeController(context: context);
    _homeController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile != null
        ? buildScaffold(_homeController)
        : Container();
  }

  Scaffold buildScaffold(HomeController homeController) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar:
          buildHomePageAppBar(homeController.userProfile!.avatar.toString()),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
              margin: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25.w,
              ),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: HomePageText(
                      text: "Hello",
                      color: AppColors.primaryThirdElementText,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HomePageText(
                      text: homeController.userProfile!.name!,
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
