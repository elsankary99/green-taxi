import 'package:auto_route/auto_route.dart';
import 'package:green_taxi/view/pages/home/home_page.dart';
import 'package:green_taxi/view/pages/login/login_page.dart';
import 'package:green_taxi/view/pages/otp/otp_page.dart';
import 'package:green_taxi/view/pages/profile/profile_page.dart';
import 'package:green_taxi/view/pages/splash/splash_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: OTPRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
