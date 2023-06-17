import 'package:Task/presentation/screens/about_consultant/about_consultant.dart';
import 'package:Task/presentation/screens/our_team/our_team.dart';
import 'package:Task/presentation/screens/records_and_honors/record_and_honores.dart';
import 'package:Task/presentation/widgets/independent/app_bar/custom_app_bar.dart';
import 'package:Task/presentation/widgets/independent/title_menu_item.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Task/app/app_theme.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(
            rightWidget: SvgPicture.asset('assets/images/svg/back.svg'),
            onRightClicked: () {},
            leftWidget: const SizedBox(),
            onLeftClicked: () {},
            title: translate('dashboard.menu_one_title')),
        body: Container(
          padding: const EdgeInsets.only(top: 24.0),
          color: Colors.transparent,
          width: width,
          // height: 300,
          child: ContainedTabBarView(
            onChange: (index) => setState(() {
              pageIndex = index;
            }),
            tabBarProperties: const TabBarProperties(
              unselectedLabelColor: AppColors.textGray,
              indicatorColor: AppColors.moshaver,
              indicatorWeight: 3,
              labelColor: AppColors.moshaver,
            ),
            tabs: [
              pageTabMenuItem(context, 'assets/images/svg/user.svg',
                  translate('dashboard.menu_one'), 0 == pageIndex),
              pageTabMenuItem(context, 'assets/images/svg/cup.svg',
                  translate('dashboard.menu_two'), 1 == pageIndex),
              pageTabMenuItem(context, 'assets/images/svg/people.svg',
                  translate('dashboard.menu_three'), 2 == pageIndex),
            ],
            views: [
              AboutConsultant(),
              RecordsAndHonors(),
              OurTeam()
            ],
          ),
        ),
        // bottomSheet:
        //     pageIndex == 0 ? navigationWidget(height * 0.1) : const SizedBox(),
      ),
    );
  }


  DateTime currentBackPressTime = DateTime(1980);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "برای خروج، دوبار بازگشت بزنید.");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
