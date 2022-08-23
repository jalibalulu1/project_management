import 'package:get/get.dart';

import '../modules/admin_screen/bindings/admin_screen_binding.dart';
import '../modules/admin_screen/views/admin_screen_view.dart';
import '../modules/create_project/bindings/create_project_binding.dart';
import '../modules/create_project/views/create_project_view.dart';
import '../modules/create_user/bindings/create_user_binding.dart';
import '../modules/create_user/views/create_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/my_bio/bindings/my_bio_binding.dart';
import '../modules/my_bio/views/my_bio_view.dart';
import '../modules/my_project/bindings/my_project_binding.dart';
import '../modules/my_project/views/my_project_view.dart';
import '../modules/user_screen/bindings/user_screen_binding.dart';
import '../modules/user_screen/views/user_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SCREEN,
      page: () => AdminScreenView(),
      binding: AdminScreenBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER,
      page: () => CreateUserView(),
      binding: CreateUserBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PROJECT,
      page: () => CreateProjectView(),
      binding: CreateProjectBinding(),
    ),
    GetPage(
      name: _Paths.USER_SCREEN,
      page: () => UserScreenView(),
      binding: UserScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_BIO,
      page: () => MyBioView(),
      binding: MyBioBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROJECT,
      page: () => MyProjectView(),
      binding: MyProjectBinding(),
    ),
  ];
}
