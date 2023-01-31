import 'package:get/get.dart';

import '../model/chat/chat_data_model.dart';
import '../modules/bottom_app_bar/bindings/bottom_app_bar_binding.dart';
import '../modules/bottom_app_bar/views/bottom_app_bar_view.dart';
import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/coffee/bindings/coffee_binding.dart';
import '../modules/coffee/views/coffee_view.dart';
import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/chat_page_view.dart';
import '../modules/community/views/community_view.dart';
import '../modules/coupon/bindings/coupon_binding.dart';
import '../modules/coupon/views/coupon_view.dart';
import '../modules/friends/bindings/friends_binding.dart';
import '../modules/friends/views/friends_view.dart';
import '../modules/health/bindings/health_binding.dart';
import '../modules/health/views/health_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_bottom_nav_bar/bindings/my_bottom_nav_bar_binding.dart';
import '../modules/my_bottom_nav_bar/views/my_bottom_nav_bar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/running/bindings/running_binding.dart';
import '../modules/running/views/running_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/shopping/bindings/shopping_binding.dart';
import '../modules/shopping/views/shopping_view.dart';
import '../modules/walk/bindings/walk_binding.dart';
import '../modules/walk/views/walk_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WALK,
      page: () => const WalkView(),
      binding: WalkBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDS,
      page: () => const FriendsView(),
      binding: FriendsBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH,
      page: () => const HealthView(),
      binding: HealthBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.CHATPAGE,
      page: () => const ChatPageView(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.MY_BOTTOM_NAV_BAR,
      page: () => const MyBottomNavBarView(),
      binding: MyBottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => const CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPING,
      page: () => const ShoppingView(),
      binding: ShoppingBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.RUNNING,
      page: () => const RunningView(),
      binding: RunningBinding(),
    ),
    GetPage(
      name: _Paths.COFFEE,
      page: () => const CoffeeView(),
      binding: CoffeeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_APP_BAR,
      page: () => const BottomAppBarView(),
      binding: BottomAppBarBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
