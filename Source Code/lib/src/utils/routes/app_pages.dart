import 'package:ET_WMS/src/middlewares/auth.dart';
import 'package:ET_WMS/src/bindings/dashboard_bindings.dart';
import 'package:ET_WMS/src/bindings/login_bindings.dart';
import 'package:ET_WMS/src/ui/view/dashboard.dart';
import 'package:ET_WMS/src/ui/view/forgot.dart';
import 'package:ET_WMS/src/ui/view/login.dart';
import 'package:ET_WMS/src/ui/view/profile.dart';
import 'package:ET_WMS/src/ui/view/signup.dart';
import 'package:ET_WMS/src/ui/view/splash_screen.dart';
import 'package:ET_WMS/src/utils/routes/routes.dart';
import 'package:get/route_manager.dart';



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
        name: Routes.profile,
        page: () => Profile(),
        // binding: AddMaintenanceBindings(),
        transition: Transition.noTransition),
  ];
}
