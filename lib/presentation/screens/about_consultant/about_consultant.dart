import 'package:Task/app/app_theme.dart';
import 'package:Task/data/models/request/save_date_request_model.dart';
import 'package:Task/data/models/response/transportation/save_date_response_model.dart';
import 'package:Task/data/repositories/remote/transportation/transportation_repository_impl.dart';
import 'package:Task/presentation/widgets/independent/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';

class AboutConsultant extends StatefulWidget {
  List<bool> daysOfWeek = [];

  AboutConsultant({super.key});

  @override
  State<AboutConsultant> createState() => _AboutConsultantState();
}

class _AboutConsultantState extends State<AboutConsultant> {
  @override
  Widget build(BuildContext context) {
    widget.daysOfWeek.addAll([false, false, false, false, false, false, false]);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, right: 24.0, left: 24.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CustomCard(
              index: 0,
              text: translate("about_consultant.saturday"),
              onCheck: (bool value) {
                widget.daysOfWeek[0] = value;
              },
            ),
            CustomCard(
              index: 1,
              text: translate("about_consultant.sunday"),
              onCheck: (bool value) {
                widget.daysOfWeek[1] = value;
              },
            ),
            CustomCard(
              index: 2,
              text: translate("about_consultant.monday"),
              onCheck: (bool value) {
                widget.daysOfWeek[2] = value;
              },
            ),
            CustomCard(
              index: 3,
              text: translate("about_consultant.tuesday"),
              onCheck: (bool value) {
                widget.daysOfWeek[3] = value;
              },
            ),
            CustomCard(
              index: 4,
              text: translate("about_consultant.wednesday"),
              onCheck: (bool value) {
                widget.daysOfWeek[4] = value;
              },
            ),
            CustomCard(
              index: 5,
              text: translate("about_consultant.thursday"),
              onCheck: (bool value) {
                widget.daysOfWeek[5] = value;
              },
            ),
            CustomCard(
              index: 6,
              text: translate("about_consultant.friday"),
              onCheck: (bool value) {
                widget.daysOfWeek[6] = value;
              },
            ),
            const SizedBox(
              height: 120,
            )
          ],
        ),
      ),
      bottomNavigationBar: navigationWidget(context, height * 0.1),
    );
  }

  Widget navigationWidget(BuildContext context, double height) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: GetBuilder<AboutConsultantController>(
          init: AboutConsultantController(),
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.find<AboutConsultantController>().changeValue(widget.daysOfWeek);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.411,
                  decoration: BoxDecoration(
                      color: _.fail==false ? AppColors.moshaver : AppColors.fail,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                      border:
                      Border.all(color: AppColors.moshaver, width: 2.0)),
                  child: _.loading == false
                      ? Text(translate("about_consultant.save"),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.white))
                      : const CircularProgressIndicator(color: AppColors.white),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.411,
                  decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                      border:
                      Border.all(color: AppColors.divider, width: 2.0)),
                  child: Text(translate("about_consultant.cancel"),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.open24Text)),
                ),
              ),
            ],
          )),
    );
  }

}

class AboutConsultantController extends GetxController {
  bool loading = false;
  bool fail = false;

  bool isLoading() {
    return loading;
  }

  void changeValue(List<bool> daysOfWeek ) async {
    loading = true;
    update();
    SaveDateRequestModel model = SaveDateRequestModel(selectedDay: convertListToString(daysOfWeek));
    TaskRepositoryImpl imp = TaskRepositoryImpl();
    SaveDateResponseModel response = await imp.saveDate(model);
    if(response.response!=null && response.response!.isDone){
      fail = false;
    }else{
      fail = true;
    }
    loading = false;
    update();
  }

  String convertListToString (List<bool> daysOfWeek){
    String str = "{";
    for (int i = 0; i < daysOfWeek.length; i++) {
      if (daysOfWeek[i]){
        if(str.length>1){str += ",";}
        str += "${i}";
      }
    }
    str += "}";
    return str;
  }
}

class AboutConsultantSendDataBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutConsultantController>(() => AboutConsultantController());
  }
}
