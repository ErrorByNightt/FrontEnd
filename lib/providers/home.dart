import 'package:flutter/foundation.dart';

import '../model/message.dart';

class HomeProvider extends ChangeNotifier {
  final List<Messages> _messages = [];

  List<Messages> get messages => _messages;

  addNewMessage(Messages message) {
    _messages.add(message);
    notifyListeners();
  }
}
