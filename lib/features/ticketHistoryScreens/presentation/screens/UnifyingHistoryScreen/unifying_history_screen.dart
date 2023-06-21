import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/iternal/helpers/color_helper.dart';

import '../../../../widgets/ticket_container.dart';

class UnifyingHistoryScreen extends StatefulWidget {
  const UnifyingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UnifyingHistoryScreen> createState() => _UnifyingHistoryScreenState();
}

class _UnifyingHistoryScreenState extends State<UnifyingHistoryScreen> {
  static const List<Tab> ticketTab = [
    Tab(
      text: 'В процессе',
    ),
    Tab(
      text: 'Забронированные',
    ),
    Tab(
      text: 'История',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ticketTab.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: ticketTab,
            splashBorderRadius: BorderRadius.circular(20),
            labelStyle: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            indicatorPadding: EdgeInsets.all(8),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blueAccent, blurRadius: 2)
                ]),                           
          ),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 75.w),
                      child: ClipPath(
                        clipper:
                            DolDurmaClipper(right: 105.w, holeRadius: 70.r),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: ColorHelper.lightGreen1,
                          ),
                          width: 200,
                          height: 250,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                "Б201",
                                style: TextStyle(
                                    color: ColorHelper.blue1,
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "mossreat"),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Юридическое лицо/",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorHelper.black05,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                " Открытие счета",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorHelper.black05,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: ColorHelper.blue1,
                                      ),
                                      Text(
                                        " Сегодня",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: ColorHelper.black05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 18,
                                        color: ColorHelper.blue1,
                                      ),
                                      Text(
                                        " 18:00",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: ColorHelper.black05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30.h,
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 75.w),
                      child: ClipPath(
                        clipper:
                            DolDurmaClipper(right: 105.w, holeRadius: 70.r),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: ColorHelper.lightYellow,
                          ),
                          width: 200,
                          height: 250,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                "Б201",
                                style: TextStyle(
                                    color: ColorHelper.blue1,
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "mossreat"),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Юридическое лицо/",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorHelper.black05,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                " Открытие счета",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorHelper.black05,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: ColorHelper.blue1,
                                      ),
                                      Text(
                                        " Сегодня",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: ColorHelper.black05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 18,
                                        color: ColorHelper.blue1,
                                      ),
                                      Text(
                                        " 18:00",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: ColorHelper.black05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30.h,
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 75.w),
                      child: ClipPath(
                        clipper:
                            DolDurmaClipper(right: 105.w, holeRadius: 70.r),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: ColorHelper.lightgrey1,
                          ),
                          width: 200,
                          height: 250,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                "Б201",
                                style: TextStyle(
                                    color: ColorHelper.blue1,
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "mossreat"),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Юридическое лицо/",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorHelper.black05,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                " Открытие счета",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorHelper.black05,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: ColorHelper.blue1,
                                      ),
                                      Text(
                                        " Сегодня",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: ColorHelper.black05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 18,
                                        color: ColorHelper.blue1,
                                      ),
                                      Text(
                                        " 18:00",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: ColorHelper.black05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30.h,
                    );
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
