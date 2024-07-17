import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

class UpcommingScreen extends StatelessWidget {
  const UpcommingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 139,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.deepGrey),
                  child: Row(
                    children: [
                      Container(
                        height: 139,
                        width: 107,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("F4EEEE")),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Title",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            textColor: Colors.black,
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rate_rounded,
                                                size: 40,
                                              ),
                                              Positioned(
                                                  top: 15,
                                                  child: CustomText(
                                                    text: "5",
                                                    textColor: Colors.white,
                                                    textAlign: TextAlign.center,
                                                    fontSize: 10,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        text: "Lorem ipsum dolor sit amet",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        textColor: Colors.black,
                                      ),
                                    ],
                                  )),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    size: 23,
                                                  ),
                                                  10.pw,
                                                  CustomText(
                                                    text: "1",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    textColor: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            10.pw,
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    size: 23,
                                                  ),
                                                  10.pw,
                                                  CustomText(
                                                    text: "1",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    textColor: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    Expanded(
                                      child: Container(
                                        height: 44,
                                        decoration: BoxDecoration(
                                            color: HexColor("979797"),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(10))),
                                        child: Center(
                                          child: CustomText(
                                            text: "Details",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: 0.15,
                                            textAlign: TextAlign.center,
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
