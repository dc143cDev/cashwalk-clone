import 'package:get/get.dart';

import '../model/chat/chat_data_model.dart';

class ChatProvider extends GetConnect implements GetxService {
  Future<List<ChatModel>?> getChatData() async {
    final response = await get('http://localhost:8000/getChatList');
    print(response.body);
    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return chatFromJson(response.body);
    }
  }
}
