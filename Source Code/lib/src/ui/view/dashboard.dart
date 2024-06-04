import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/dashboard_controller.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController _ = Get.find<DashboardController>();
    return Scaffold(
        drawer: drawer(_),
        appBar: appbar(_),
        body: RefreshIndicator(
            onRefresh: () => _.getData(),
            child: Obx(
              () => _.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : body(_),
            )));
  }

  SingleChildScrollView body(DashboardController _) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.viewAssets);
            },
            child: Center(
              child: Container(
                width: Get.width - 30,
                height: 90,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [
                        UIDataColors.commonColor,
                        Color.fromARGB(193, 0, 0, 0)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.2, 2.9],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Assets',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Obx(() => Text(
                              '${_.assets.length}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28),
                            ))
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/dashboard/purple-bg-images.svg',
                      height: 75,
                    )
                  ],
                ).marginOnly(left: 10),
              ).marginOnly(bottom: 10, top: 15),
            ),
          ),
          InkWell(
            onTap: () async {
              // _.db.deleteTable('tasks');
            },
            child: Center(
              child: Container(
                width: Get.width - 26,
                height: 90,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [
                        UIDataColors.commonColor,
                        Color.fromARGB(193, 0, 0, 0)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.2, 2.9],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width/1.6,
                          child: Text(
                            'No of Assets(Last 12 months)',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/dashboard/purple-bg-images.svg',
                      height: 75,
                    )
                  ],
                ).marginOnly(left: 10),
              ).marginOnly(bottom: 10),
            ),
          ),
          Center(
            child: Container(
              width: Get.width - 30,
              height: 90,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [
                      UIDataColors.commonColor,
                      Color.fromARGB(193, 0, 0, 0)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.2, 2.9],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NAV(Net Assets Value)',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        "\$ 5,000",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/dashboard/purple-bg-images.svg',
                    height: 75,
                  )
                ],
              ).marginOnly(left: 10),
            ).marginOnly(bottom: 10),
          ),
          Text(
            'ASSET BY STATUS',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
          ).marginOnly(left: 15, top: 15),
          chart(_),
          Container(
            height: 100,
            width: Get.width,
            color: Color.fromARGB(25, 158, 158, 158),
            child: Wrap(
              children: [
                Wrap(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.blue,
                      ),
                    ),
                    Text('Dispose').marginOnly(left: 7),
                  ],
                ).marginOnly(left: 80, top: 17),
                Wrap(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color.fromARGB(255, 223, 0, 0),
                      ),
                    ),
                    Text('Lost').marginOnly(left: 7),
                  ],
                ).marginOnly(left: 80, top: 17),
                Wrap(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color.fromARGB(255, 0, 192, 45),
                      ),
                    ),
                    Text('Available').marginOnly(left: 7),
                  ],
                ).marginOnly(left: 80, top: 17),
                Wrap(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color.fromARGB(255, 224, 160, 0),
                      ),
                    ),
                    Text('Check Out').marginOnly(left: 7),
                  ],
                ).marginOnly(left: 80, top: 17),
              ],
            ),
          )
        ],
      ),
    );
  }

  SfCircularChart chart(DashboardController _) {
    return SfCircularChart(series: <CircularSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
          dataSource: _.data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          radius: '90%',
          explode: true,
          explodeGesture: ActivationMode.singleTap,
          explodeOffset: '5%',
          dataLabelSettings: const DataLabelSettings(
            // color: Colors.amber,
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            isVisible: true,
            // labelIntersectAction: LabelIntersectAction.shift,
            // Customize other data label settings here
          ),
          name: 'Gold')
    ]);
  }

  PreferredSize appbar(DashboardController _) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: AppBar(
          title: Center(
            child: InkWell(
              onTap: () {
                // _.db.delettte();
                // _.db.initializeDatabase();
                Get.toNamed(Routes.import);
              },
              child: Text(
                'HOME',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.scan);
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: UIDataColors.commonColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Icon(
                  Icons.center_focus_strong_outlined,
                  size: 24,
                  color: Colors.white,
                )),
              ).marginOnly(right: 18),
            ),
          ],
        ),
      ),
    );
  }

  Drawer drawer(DashboardController _) {
    return Drawer(
        backgroundColor: UIDataColors.commonColor,
        width: Get.width / 1.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    Get.offAndToNamed(Routes.profile);
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(141, 224, 224, 224),
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromARGB(195, 246, 246, 246),
                    )),
                  ).marginOnly(top: 50),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Subhan',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _.assetsCheck.toggle();
                },
                child: Text(
                  'Assets',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ).marginOnly(top: 20),
              ),
              Obx(
                () => _.assetsCheck.value
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAndToNamed(Routes.addAsset);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: const Color.fromARGB(170, 255, 255, 255),
                                ),
                                Text(
                                  'Add Assets',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ).marginOnly(left: 10)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAndToNamed(Routes.viewAssets);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 18,
                                  color: const Color.fromARGB(170, 255, 255, 255),
                                ),
                                Text(
                                  'View Assets',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ).marginOnly(left: 10)
                              ],
                            ).marginOnly(left: 3),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.offAndToNamed(Routes.scan);
                },
                child: Text(
                  'Scan Screen',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.offAndToNamed(Routes.bluetooth);
                },
                child: Text(
                  'My Devices',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.offAndToNamed(Routes.scanHistory);
                },
                child: Text(
                  'Scan History',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.offAndToNamed(Routes.import);
                },
                child: Text(
                  'Audit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.readWriteRfid);
                },
                child: Text(
                  'Write RFID',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(98, 255, 255, 255),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'Log Out',
                    content: Text('Are you sure u want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          GetStorage box = GetStorage();
                          await box.remove('auth');
                          Get.offAllNamed(Routes.login);
                        },
                        child: Text('Log out'),
                      ),
                    ],
                  );
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              
            ],
          ).marginSymmetric(horizontal: 40),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
