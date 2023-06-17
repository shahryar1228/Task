import 'package:Task/app/app_theme.dart';
import 'package:Task/data/models/response/transportation/departments_response_model.dart';
import 'package:Task/data/models/response/transportation/save_date_response_model.dart';
import 'package:Task/data/repositories/remote/transportation/transportation_repository_impl.dart';
import 'package:Task/presentation/widgets/independent/loading_widget.dart';
import 'package:Task/presentation/widgets/independent/records_and_honors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';

class RecordsAndHonors extends StatefulWidget {
  const RecordsAndHonors({super.key});

  @override
  State<RecordsAndHonors> createState() => _RecordsAndHonorsState();
}

class _RecordsAndHonorsState extends State<RecordsAndHonors> {

  @override
  void initState() {
    super.initState();
    Get.find<RecordAndHonorsController>().loadDepartmentsData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: height * 0.045,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.open24,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: AppColors.open24, width: 2.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/svg/plus.svg"),
                const SizedBox(
                  width: 5,
                ),
                Text(translate("records_and_honors.add_history"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.open24Text)),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<RecordAndHonorsController>(
                init: RecordAndHonorsController(),
                builder: (_) => _.loading == false
                    ? (_.departmentsResponseModel !=null && _.departmentsResponseModel!.data !=null && _.departmentsResponseModel!.data!.isNotEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return InkWell(
                                  onTap: () {},
                                  child: RecordsAndHonorsListView(
                                      data:_.departmentsResponseModel!.data![i]));
                            },
                            itemCount: (_.departmentsResponseModel != null &&
                                    _.departmentsResponseModel!.data != null)
                                ? _.departmentsResponseModel!.data!.length
                                : 0,
                          )
                        : const Text("لیست خالیست")
                    : const Column(
                      children: [
                        SizedBox(height: 50,),
                        LoadingWidget(),
                      ],
                    )),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}

class RecordAndHonorsController extends GetxController {
  bool loading = false;
  bool fail = false;
  DepartmentsResponseModel? departmentsResponseModel;

  bool isLoading() {
    return loading;
  }

  void addHistory() async {
    // loading = true;
    // update();
    // TaskRepositoryImpl imp = TaskRepositoryImpl();
    // DepartmentsResponseModel response = await imp.loadList();
    // if(response.response!=null && response.response!.isDone){
    //   fail = false;
    // }else{
    //   fail = true;
    // }
    // loading = false;
    // update();
  }

  void loadDepartmentsData() async {
    loading = true;
    update();
    TaskRepositoryImpl imp = TaskRepositoryImpl();
    departmentsResponseModel = await imp.loadList();
    if (departmentsResponseModel != null &&
        departmentsResponseModel!.response != null &&
        departmentsResponseModel!.response!.isDone) {
      fail = false;
    } else {
      fail = true;
    }
    loading = false;
    update();
  }
}

class RecordAndHonorsControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordAndHonorsController>(() => RecordAndHonorsController());
  }
}
