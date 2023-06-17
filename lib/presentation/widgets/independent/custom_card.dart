import 'package:Task/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CustomCard extends StatefulWidget {
  bool value = true;
  String text;
  int index;
  Function onCheck;
  TextEditingController controller = TextEditingController();

  CustomCard({Key? key,required this.index, required this.onCheck, required this.text})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: GetBuilder<Controller>(
          init: Controller(),
          builder: (_) => Container(
                height: Get.find<Controller>().returnCheckBoxValue(widget.index)
                    ? height * 0.24
                    : height * 0.058,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: AppColors.divider, width: 1.0)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              splashRadius: 30.0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              activeColor: AppColors.primaryColor,
                              checkColor: AppColors.white,
                              side: const BorderSide(
                                  width: 1, color: AppColors.textGray),
                              value:
                                  Get.find<Controller>().returnCheckBoxValue(widget.index),
                              onChanged: (bool? value) {
                                widget.onCheck(value);
                                Get.find<Controller>().changeChangeBoxValue(widget.index);
                              },
                            ),
                            Text(widget.text,
                                style: const TextStyle(
                                    color: AppColors.textColor)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: GetBuilder<Controller>(
                              init: Controller(),
                              builder: (_) => Text(
                                    (_.checkBoxValue[widget.index])
                                        ? translate("about_consultant.open")
                                        : translate("about_consultant.close"),
                                    style: const TextStyle(
                                        color: AppColors.textGray),
                                  )),
                        ),
                      ],
                    ),
                    GetBuilder<Controller>(
                        init: Controller(),
                        builder: (_) => _.checkBoxValue[widget.index]
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 2,
                                      color: AppColors.divider,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("از ساعت",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.textColor)),
                                            SizedBox(
                                              height: height * 0.056,
                                              width: width * 0.3611,
                                              child: const TextField(
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.datetime,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: '19:00',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("تا ساعت",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.textColor)),
                                            SizedBox(
                                              height: height * 0.056,
                                              width: width * 0.3611,
                                              child: const TextField(
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.datetime,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                  fillColor: AppColors.primaryColor,
                                                  border: OutlineInputBorder(),
                                                  hintText: '19:00',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    GetBuilder<Controller>(
                                        init: Controller(),
                                        builder: (_) => InkWell(
                                          onTap: (){Get.find<Controller>().changeOpen24Value(widget.index);},
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: height* 0.045,
                                            width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Get.find<Controller>().returnOpen24Value(widget.index) ? AppColors.open24 : AppColors.white,
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                  border: Border.all(color: Get.find<Controller>().returnOpen24Value(widget.index) ? AppColors.open24Text : AppColors.divider, width: 2.0)),
                                              child: Text(translate("about_consultant.open24"),textAlign: TextAlign.center,style: const TextStyle(color: AppColors.open24Text)),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()),
                  ],
                ),
              )),
    );
  }
}

class Controller extends GetxController {
  // List<int> index;
  // Controller(this.index);
  List<bool> checkBoxValue = [false,false,false,false,false,false,false];
  List<bool> open24Value = [false,false,false,false,false,false,false];

  //////////////CheckBox//////////////
  bool returnCheckBoxValue(int index) {
    return checkBoxValue[index];
  }

  void changeChangeBoxValue(int index) {
    checkBoxValue[index] = !checkBoxValue[index];
    update();
  }

  ////////////24 Hour//////////////////
  bool returnOpen24Value(int index) {
    return open24Value[index];
  }

  void changeOpen24Value(int index) {
    open24Value[index] = !open24Value[index];
    // use update method to update all count variables
    update();
  }
}

class CustomCardBind extends Bindings {
  // List<int> index;
  // CustomCardBind(this.index);
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
