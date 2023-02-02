import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:get/get.dart';

import '../model/chat/chat_data_model.dart';

class ChatProvider extends GetConnect implements GetxService {
  String url = 'https://localhost:3001/';

  UrlController urlController = UrlController();

  Future<List<ChatModel>?> getChatData() async {
    final response = await get('${urlController.baseUrl}getChatList');
    print(response.body);
    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return chatFromJson(response.body);
    }
  }
}
