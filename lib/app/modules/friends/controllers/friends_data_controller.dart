import 'package:cashwalkclone/app/api/user_provider.dart';
import 'package:cashwalkclone/app/model/user/user_data_model.dart';
import 'package:get/get.dart';

class FriendsDataController extends GetxController
    with StateMixin<List<UserModel>> {
  UserProvider userProvider = UserProvider();

  getUserDataForRanking() {
    print('유저 랭킹 데이터');
    userProvider.getUserData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  //새로고침 버튼.

  //인디케이터 값을 감지하도록 설정된 Rx bool.
  var isF5BtnClicked = false.obs;

  //새로고침 버튼 클릭시 호출.
  //value 를 true 로 만들어 인디케이터를 표시하고,
  //동시에 3초 딜레이 함수를 호출하여 3초 뒤에 값이 false 로 바뀌어 원상복귀 되도록 함.
  isF5() {
    isF5BtnClicked.value = true;
    Future.delayed(Duration(seconds: 3), () {
      isF5BtnClicked.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    userProvider.getUserData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
