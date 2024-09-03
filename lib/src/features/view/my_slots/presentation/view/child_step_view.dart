import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/data/model/my_slot_list_model.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/presentation/controller/my_slot_create_controller.dart';
import '../../../../../core/di/app_component.dart';

class ChildStepView extends StatelessWidget {
  final Data? childStepModel;
  final Data? nextChildStep;
  final int childTabbarIndex;

  ChildStepView(this.childStepModel, this.childTabbarIndex,
      {super.key, this.nextChildStep});

  final controller = locator<MySlotCreateController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.green,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            childStepModel!.title!,
            style: TextStyle(
              // color: Constants.childTypeName == 0 &&
              //         jobApplicantController.findChildStepNameByIndex(
              //                 Constants.childTypeName) ==
              //             childStepModel!.name
              //     ? ColorResources.WHITE
              //     : (jobApplicantController.childStepName.value ==
              //                     childStepModel!.name &&
              //                 jobApplicantController.findChildStepNameByIndex(
              //                         Constants.childTypeName) ==
              //                     childStepModel!.name) ||
              //             childStepModel!.selected
              //         ? ColorResources.WHITE
              //         : Colors.white54,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 15,
              minWidth: 26,
            ),
            /*decoration: childStepModel.selected ? new ShapeDecoration(
              color: ColorResources.WHITE,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ) : BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: ColorResources.WHITE54,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
            ),*/
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  // color: Constants.childTypeName == 0 &&
                  //         jobApplicantController.findChildStepNameByIndex(
                  //                 Constants.childTypeName) ==
                  //             childStepModel!.name
                  //     ? ColorResources.WHITE
                  //     : (jobApplicantController.childStepName.value ==
                  //                     childStepModel!.name &&
                  //                 jobApplicantController
                  //                         .findChildStepNameByIndex(
                  //                             Constants.childTypeName) ==
                  //                     childStepModel!.name) ||
                  //             childStepModel!.selected
                  //         ? ColorResources.WHITE
                  //         : Colors.white54,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: childStepModel?.selected ?? false
                      ? FontWeight.bold
                      : FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getCount(int count) {
    int l = count.toString().length;
    if (l > 3) {
      double countInDouble = count / 1000;
      return "${countInDouble.toStringAsFixed(1)}K";
    } else {
      return "$count";
    }
  }
}
