import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/app/widgets/custom_button_yellow.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CameraController extends GetxController {
  WalkController walkController = WalkController();
  //get storage 사용하기 쉽게 미리 선언.
  GetStorage storage = GetStorage();

  var textInt = 0.obs;

  //color picker 으로 감지할 색상. 총 걸음수, 100걸음, 텍스트.
  var totalColor = 0xFf4169e1.obs;
  var walkColor = 0xFFff69b4.obs;
  var textColor = 0xFFdd972b.obs;

  var selectedTotalColor = Color(0).obs;
  var selectedWalkColor = Color(0).obs;
  var selectedTextColor = Color(0).obs;

  //현재 선택된 이미지 번호. 에셋 이미지로 0~4까지 다섯개.
  var selectedImagePath = '0'.obs;

  //갤러리의 pageView controller 가 감지할 현재 갤러리 번호.
  var galleryPageIndex = 0.obs;
  //갤러리 표시용. 위 값에서 +1.
  var galleryPageIndexPlus = 0.obs;

  //시작 페이지 0번. 노란 이미지.
  final pageController = PageController(initialPage: 0);

  //갤러리 페이지 변화를 감지. 변화된 페이지는 currentPage 라는 내부 변수로 담음.
  //이것을 galleryPageIndex 로 다시 담아주기.
  //print 는 디버그용.
  onGalleryPageChanged(int page) {
    print('page num:' + page.toString());
    int currentPage = page.toInt();
    //페이지가 바뀔때마다 호출. 즉, galleryPageIndex 가 현재 페이지를 담게 됨.
    galleryPageIndex.value = currentPage;
    galleryPageIndexPlus.value = currentPage += 1;
    print('main page image path:' + selectedImagePath.value.toString());
    print('current page:' + galleryPageIndex.value.toString());
  }

  //적용 버튼 클릭시 호출.
  //walk controller 로 보낼 selectedImagePath 를 스트링으로 바꿔줌.
  //그리고 저장해야할 값들(페이지 인덱스 스트링 값, 세가지 컬러 값)을 get storage 에 저장.
  applyBtnClicked() {
    selectedImagePath.value = galleryPageIndex.value.toString();
    storage.write('mainPageImageIndex', selectedImagePath.value);
    storage.write('totalColor', totalColor.value);
    storage.write('walkColor', walkColor.value);
    storage.write('textColor', textColor.value);

    print('write:' + storage.read('mainPageImageIndex'));
    print('write total color:' + storage.read('totalColor').toString());
    print('write walk color:' + storage.read('walkColor').toString());
    print('write text color:' + storage.read('textColor').toString());
  }

  count() {
    textInt.value++;
    print(textInt.value);
    storage.listenKey('test', (value) => print('new key is $value'));
  }

  read() {
    storage.read('test');
    print(textInt.value);
  }

  debugBtn() {
    storage.write('test', 'vvv');
    print(textInt.value);
    print(textColor);
    print('write:' + storage.read('mainPageImageIndex'));
    print('write total color:' + storage.read('totalColor').toString());
    print('write walk color:' + storage.read('walkColor').toString());
    print('write text color:' + storage.read('textColor').toString());
  }

  //총 걸음 표시 색상 선택시 호출.
  //color picker 패키를 사용하여 색상 정해줌. 기본 컬러는 총 걸음 표시 색상. 바뀌면 함께 바뀜.
  //onColorChanged 로 색상이 바뀔때마다 Color 형태로 값을 저장. 아래 두 메소드도 작동방식 동일.
  totalColorChangeBtnClicked() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ColorPicker(
              pickerColor: selectedTotalColor.value,
              onColorChanged: (Color color) {
                selectedTotalColor.value = color;
                print(selectedTotalColor.value);
                totalColor.value = color.value;
              },
              pickerAreaHeightPercent: 0.9,
              enableAlpha: true,
              paletteType: PaletteType.hsvWithHue,
            ),
            SizedBox(
              height: 70,
            ),
            CustomButtonYellow(
              btnText: '적용하기',
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  walkColorChangeBtnClicked() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ColorPicker(
              pickerColor: selectedWalkColor.value,
              onColorChanged: (Color color) {
                selectedWalkColor.value = color;
                //int 로 변환
                print(color.value);
                walkColor.value = color.value;
              },
              pickerAreaHeightPercent: 0.9,
              enableAlpha: true,
              paletteType: PaletteType.hsvWithHue,
            ),
            SizedBox(
              height: 70,
            ),
            CustomButtonYellow(
              btnText: '적용하기',
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  textColorChangeBtnClicked() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ColorPicker(
              pickerColor: selectedTextColor.value,
              onColorChanged: (Color color) {
                selectedTextColor.value = color;
                print(selectedTextColor.value);
                textColor.value = color.value;
              },
              pickerAreaHeightPercent: 0.9,
              enableAlpha: true,
              paletteType: PaletteType.hsvWithHue,
            ),
            SizedBox(
              height: 70,
            ),
            CustomButtonYellow(
              btnText: '적용하기',
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
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
