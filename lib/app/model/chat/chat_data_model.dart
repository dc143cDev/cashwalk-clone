List<ChatModel> chatFromJson(dynamic str) =>
    List<ChatModel>.from((str).map((x) => ChatModel.fromJson(x)));

class ChatModel {
  int? chatId;
  String? title;
  String? contents;

  ChatModel(
    this.chatId,
    this.title,
    this.contents,
  );

  ChatModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    title = json['chat_title'];
    contents = json['chat_contents'];
  }
}
