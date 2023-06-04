class Message {
  int idChat;
  String content;
  DateTime sendDate;
  DateTime? receiveDate;

  Message({
    required this.idChat,
    required this.content,
    required this.sendDate,
    this.receiveDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_chat': idChat,
      'content': content,
      'send_date': sendDate.toString(),
      'receive_date': receiveDate.toString(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      idChat: map['id_chat'],
      content: map['content'],
      sendDate: DateTime.parse(map['send_date']),
      receiveDate: DateTime.parse(map['receive_date']),
    );
  }
}









// id INTEGER PRIMARY KEY AUTOINCREMENT,
//       id_chat INTEGER NOT NULL,
//       content TEXT,
//       send_date DATETIME NOT NULL,
//       receive_date DATETIME,
//       FOREIGN KEY (id_chat) REFERENCES chat(id)