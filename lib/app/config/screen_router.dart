
import 'package:Task/main.dart';
import 'package:Task/presentation/screens/about_consultant/about_consultant.dart';
import 'package:Task/presentation/screens/dashboard/dashboard.dart';
import 'package:Task/presentation/screens/our_team/our_team.dart';
import 'package:Task/presentation/screens/records_and_honors/record_and_honores.dart';
import 'package:Task/presentation/widgets/independent/custom_card.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

List<GetPage>  screenRouter = [
  GetPage(
      name: '/home',
      page: () => const DashboardScreen(),
      // binding: CustomCardBind(),//[0,1,2,3,4,5,6]
    bindings: [
      AboutConsultantSendDataBind(),
      CustomCardBind(),
      RecordAndHonorsControllerBind(),
      OurTeamControllerBind(),
    ]
  ),
  // GetPage(name: '/first', page: () => const First()),
  // GetPage(
  //   name: '/second',
  //   page: () => Second(),
  //   customTransition: SizeTransitions(),
  //   binding: SampleBind(),
  // ),
  // GetPage(
  //   name: '/third',
  //   transition: Transition.cupertino,
  //   page: () => Third(),
  // ),
];
