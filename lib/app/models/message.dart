class Message {
  int idChat;
  String content;
  DateTime sendDate;
  DateTime? receiveDate;
  int isReceived;

  Message({
    required this.idChat,
    required this.content,
    required this.sendDate,
    this.receiveDate,
    this.isReceived = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_chat': idChat,
      'content': content,
      'send_date': sendDate.toString(),
      'receive_date': receiveDate.toString(),
      'is_received': isReceived,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      idChat: map['id_chat'],
      content: map['content'],
      sendDate: DateTime.parse(map['send_date']),
      receiveDate: DateTime.parse(map['receive_date']),
      isReceived: map['is_received'],
    );
  }
}
