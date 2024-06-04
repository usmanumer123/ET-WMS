import 'package:flutter_application_1/src/bindings/addDocBindings.dart';
import 'package:flutter_application_1/src/bindings/addMaintenanceBindings.dart';
import 'package:flutter_application_1/src/bindings/aseetsdetailsBindings.dart';
import 'package:flutter_application_1/src/bindings/dashboard_bindings.dart';
import 'package:flutter_application_1/src/bindings/foundAssetsBindings.dart';
import 'package:flutter_application_1/src/bindings/historyBindings.dart';
import 'package:flutter_application_1/src/bindings/login_bindings.dart';
import 'package:flutter_application_1/src/bindings/maintenanceBindings.dart';
import 'package:flutter_application_1/src/bindings/viewAssets_bindings.dart';
import 'package:flutter_application_1/src/middlewares/auth.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/addDoc.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/addMaintenance.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/assetsDetails.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/despreciation.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/document.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/event.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/history.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/maintenancePage.dart';
import 'package:flutter_application_1/src/ui/view/CheckOutScreen/addLocation.dart';
import 'package:flutter_application_1/src/ui/view/CheckOutScreen/addSite.dart';
import 'package:flutter_application_1/src/ui/view/CheckOutScreen/checkOut.dart';
import 'package:flutter_application_1/src/ui/view/MyDevices/bluetooth.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/foundAssets.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/misplacedAssets.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/missingAssets.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/newAssets.dart';
import 'package:flutter_application_1/src/ui/view/addAsset.dart';
import 'package:flutter_application_1/src/ui/view/dashboard.dart';
import 'package:flutter_application_1/src/ui/view/dispose.dart';
import 'package:flutter_application_1/src/ui/view/editAssets.dart';
import 'package:flutter_application_1/src/ui/view/forgot.dart';
import 'package:flutter_application_1/src/ui/view/import.dart';
import 'package:flutter_application_1/src/ui/view/login.dart';
import 'package:flutter_application_1/src/ui/view/lost.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/scan_history.dart';
import 'package:flutter_application_1/src/ui/view/profile.dart';
import 'package:flutter_application_1/src/ui/view/signup.dart';
import 'package:flutter_application_1/src/ui/view/splash_screen.dart';
import 'package:flutter_application_1/src/ui/view/startScan.dart';
import 'package:flutter_application_1/src/ui/view/viewAssets.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/route_manager.dart';

import '../../ui/view/read_write_rfid/read_write_rfid.dart';

class AppPages {
  static const String INITIAL = Routes.splash;
  static final List<GetPage<dynamic>> routes = [
    GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.login,
        page: () => LogIn(),
        binding: LoginScreenBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.signUp,
        page: () => SignUpScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.forgot,
        page: () => ForgotScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.dashboard,
        page: () => Dashboard(),
        // middlewares: [AuthMiddleware()],
        binding: DashboardBindings(),
        
        transition: Transition.noTransition),
    GetPage(
        name: Routes.viewAssets,
        page: () => ViewAssets(),
        binding: ViewAssetsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addAsset,
        page: () => AddAssets(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.assetsDetails,
        page: () => AssetsDetails(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.document,
        page: () => Document(),
        // binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.event,
        page: () => Event(),
        // binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.maintenance,
        page: () => Maintenance(),
        binding: MaintenanceBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.checkout,
        page: () => CheckOut(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addSite,
        page: () => AddSite(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addLocation,
        page: () => AddLocation(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.dispose,
        page: () => Dispose(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.lost,
        page: () => Lost(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.scan,
        page: () => ScanScreen(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.scanHistory,
        page: () => ScanHistory(),
        binding: AssetsDetailsBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.history,
        page: () => History(),
        binding: HistoryBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addDoc,
        page: () => AddDocument(),
        binding: AddDocBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addMaintenance,
        page: () => AddMaintenance(),
        binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.despreciation,
        page: () => Despreciation(),
        // binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.bluetooth,
        page: () => BluetoothScreen(),
        binding: AddDocBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.editAssets,
        page: () => EditScreen(),
        binding: AddDocBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.foundAssets,
        page: () => FoundAssets(),
        binding: FoundAssetsBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.newAssets,
        page: () => NewAssets(),
        binding: AddDocBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.misplaced,
        page: () => Misplaced(),
        binding: AddDocBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.missingAssets,
        page: () => MissingAssets(),
        binding: AddDocBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.profile,
        page: () => Profile(),
        // binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.readWriteRfid,
        page: () => RadWriteRfid(),
        // binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
         GetPage(
        name: Routes.import,
        page: () => Import(),
        // binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
            GetPage(
        name: Routes.range,
        page: () => Import(),
        // binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
  ];
}
