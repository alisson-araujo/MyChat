import 'package:mychat/app/models/user.dart';

abstract class AuthRepository {
  Future register({required User user});
  Future login({required String phoneNumber, required String password});
  Future refresh();
}
