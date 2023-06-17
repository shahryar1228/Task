import 'package:Task/app/app_theme.dart';
import 'package:Task/app/utils/usefull_functions.dart';
import 'package:Task/data/models/response/transportation/departments_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecordsAndHonorsListView extends StatefulWidget {
  Datum data;

  RecordsAndHonorsListView({super.key, required this.data});

  @override
  State<RecordsAndHonorsListView> createState() =>
      _RecordsAndHonorsListViewState();
}

class _RecordsAndHonorsListViewState extends State<RecordsAndHonorsListView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Container(
        height: height * 0.098,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: AppColors.divider, width: 1.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child:
                    // CircleAvatar(
                    //   radius: 30.0,
                    //   backgroundImage: NetworkImage(
                    //       widget.data.icon),
                    //   backgroundColor: hexToColor("#${widget.data.backgroundItem}"),
                    // ),
                    Container(
                      height: 50,
                        decoration: BoxDecoration(//0xFFADADAD
                          color: hexToColor("#${widget.data.backgroundItem}"),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        child:
                        SvgPicture.asset(
                          color: hexToColor("#${widget.data.color}"),
                            "assets/images/svg/record_and_honors_list_item.svg")
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(widget.data.name ?? ""),
                            SizedBox(
                              width: 10,
                            ),
                            const Text("(ترکیه رهیاب)",
                                style: TextStyle(color: AppColors.textGray)),
                          ],
                        ),
                        Text(
                          widget.data.details,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text("ترکیه - استانبول"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1, child: SvgPicture.asset("assets/images/svg/edit.svg")),
          ],
        ),
      ),
    );
  }
}
