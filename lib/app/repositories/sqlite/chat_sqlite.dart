import 'package:flutter/material.dart';
import 'package:mychat/app/models/chat.dart';
import 'package:mychat/app/models/message.dart';
import 'package:mychat/app/repositories/sqlite/sqlite_db.dart';
import 'package:sqflite/sqflite.dart';

class ChatSqlite {
  late Database db;
  List _chats = [];
  List _messages = [];

  List get chats => _chats;
  List get messages => _messages;

  ChatSqlite() {
    _initRepository();
  }

  _initRepository() async {
    await _getChats();
  }

  _getChats() async {
    db = await SqliteDb.instance.database;
    _chats = await db.query('chat');
    _messages = await db.query('message', orderBy: 'send_date DESC');
  }

  setChat(Chat chat) async {
    db = await SqliteDb.instance.database;
    int id = await db.insert('chat', chat.toMap());
    debugPrint('chat registered, id: $id');
    return id;
  }

  setMessage(Message message) async {
    db = await SqliteDb.instance.database;
    await db.update(
      'chat',
      {'lastMsg': message.content, 'lastMsgTime': message.sendDate.toString()},
      where: 'id = ?',
      whereArgs: [message.idChat],
    );
    int id = await db.insert('message', message.toMap());
    debugPrint('registered message, id: $id');
  }

  getMessages(int idChat) async {
    db = await SqliteDb.instance.database;
    final resp = await db.query(
      'message',
      where: 'id_chat = ?',
      whereArgs: [idChat],
      // orderBy: 'send_date ASC',
    );
    return resp;
  }

  Future<List> getChat(int id) async {
    db = await SqliteDb.instance.database;
    final resp = await db.query('chat', where: 'id = ?', whereArgs: [id]);
    return resp;
  }

  Future<List> getChats() async {
    db = await SqliteDb.instance.database;
    final resp = await db.query('chat');
    return resp;
  }
}
