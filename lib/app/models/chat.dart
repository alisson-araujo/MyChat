class Chat {
  // final int id;
  final String numberContact;
  final String? nameContact;
  final String? lastMsg;
  final String? lastMsgTime;
  final String? numberMsgNotRead;

  Chat({
    // this.id,
    required this.numberContact,
    this.nameContact,
    this.lastMsg,
    this.lastMsgTime,
    this.numberMsgNotRead,
  });

  toMap() {
    var map = <String, dynamic>{};
    // map['id'] = id;
    map['numberContact'] = numberContact;
    map['nameContact'] = nameContact;
    map['lastMsg'] = lastMsg;
    map['lastMsgTime'] = lastMsgTime;
    map['numberMsgNotRead'] = numberMsgNotRead;
    return map;
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      // id: map['id'],
      numberContact: map['numberContact'],
      nameContact: map['nameContact'],
      lastMsg: map['lastMsg'],
      lastMsgTime: map['lastMsgTime'],
      numberMsgNotRead: map['numberMsgNotRead'],
    );
  }
}
