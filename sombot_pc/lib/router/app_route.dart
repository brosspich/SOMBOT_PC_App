import 'package:auto_route/auto_route.dart';
import 'package:sombot_pc/home_page.dart';
import 'package:sombot_pc/setting.dart';
part 'app_route.gr.dart';
@AutoRouterConfig()
class AppRouter extends _$AppRouter{

 @override
 List<AutoRoute> get routes => [
   AutoRoute(path: '/home',page: HomeRoute.page,initial: true),
    AutoRoute(path: '/detil',page: SettingRoute.page),
 ];
}