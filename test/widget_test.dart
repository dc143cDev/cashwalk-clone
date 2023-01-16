//
// class CameraView extends StatefulWidget {
//   const CameraView({Key? key}) : super(key: key);
//
//   @override
//   State<CameraView> createState() => _CameraViewState();
// }
//
// class _CameraViewState extends State<CameraView> {
//   @override
//   // late final ImagePicker _imagePicker;
//
//   // Future<List<XFile>> pickImage({
//   //   ImageSource source = ImageSource.gallery,
//   //   int imageQuality = 100,
//   // }) async {
//   //   final file = await _imagePicker.pickImage(
//   //       source: source, imageQuality: imageQuality);
//   //   if (file != null) return [file];
//   //   return [];
//   // }
//
//   // Future _pickImage(ImageSource source) async {
//   //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   if (image == null) return;
//   //   setState(() {
//   //     _image = image;
//   //   });
//   // }
//
//   Widget build(BuildContext context) {
//     ImagePicker picker = ImagePicker();
//     XFile? image;
//     Future getImageFromGallery() async {
//       image = await picker.pickImage(source: ImageSource.gallery);
//       setState(() {});
//       print(image!.path);
//     }
//
//     return Center(
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 200,
//             child: Center(
//               child: image == null
//                   ? Text('no image')
//                   : Image.file(
//                 File(image!.path),
//               ),
//             ),
//           ),
//           FloatingActionButton(onPressed: () {
//             getImageFromGallery();
//           }),
//         ],
//       ),
//     );
//   }

// Future getImageFromGallery() async {
//   var image =
//       await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//   setState(() {
//     _image = image!;
//   });
// }

//
// Column(
// children: [
// Obx(
// () => controller.selectedImagePath.value == ''
// ? Text('No image')
// : Image.file(
// File(controller.selectedImagePath.value),
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Obx(() => Text(controller.selectedImageSize.value == ''
// ? ''
// : controller.selectedImageSize.value)),
// FloatingActionButton(
// heroTag: null,
// onPressed: () {
// controller.getImage(ImageSource.camera);
// },
// child: Text('c'),
// ),
// FloatingActionButton(
// onPressed: () {
// controller.getImage(ImageSource.gallery);
// },
// child: Text('g'),
// ),
// ],
// ),
