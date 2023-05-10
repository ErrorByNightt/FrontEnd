import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coding_game/soketMessages.dart';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'model/Chat_screen.dart';
import 'package:lottie/lottie.dart';

class ChatScreen extends StatefulWidget {
  bool list = false;
  String? userPicAssetPath,name = "";
   ChatScreen(this.list,  this.userPicAssetPath,this.name);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  int tabSelected = 3;
  List<ChatModel> chats = <ChatModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _socket = IO.io(
      'http://192.168.43.133:8080',
    );
    _connectSocket();
    super.initState();
    _loadMessages();
    //1
    ChatModel chatModel = new ChatModel();
    chatModel.setUserName("Sanskar");
    chatModel.setUserPicAssetPath("assets/images/chat_screen/profilepic.jpg");
    chatModel.setLastMessage("This is strange i can send message to myself");
    chatModel.setTime("2 hours");
    chatModel.setUnreadMessage(4);
    chatModel.setLastMessageSendByMe(false);
    chats.add(chatModel);

    //2
    ChatModel chatModel2 = new ChatModel();
    chatModel2.setUserName("Jessica");
    chatModel2.setUserPicAssetPath("assets/images/chat_screen/profilepic2.png");
    chatModel2.setLastMessage("Hahaha, yeah!");
    chatModel2.setTime("22 min");
    chatModel2.setUnreadMessage(0);
    chatModel2.setLastMessageSendByMe(true);
    chats.add(chatModel2);

    //3
    ChatModel chatModel3 = new ChatModel();
    chatModel3.setUserName("Adrianne");
    chatModel3.setUserPicAssetPath("assets/images/chat_screen/profilepic3.png");
    chatModel3.setLastMessage("Let's catch up sometime sanskar");
    chatModel3.setTime("2 min");
    chatModel3.setUnreadMessage(0);
    chatModel3.setLastMessageSendByMe(false);
    chats.add(chatModel3);

    //4
    ChatModel chatModel4 = new ChatModel();
    chatModel4.setUserName("Marlene");
    chatModel4.setUserPicAssetPath("assets/images/chat_screen/profilepic4.png");
    chatModel4.setLastMessage("Hey Sanskar how are you?");
    chatModel4.setTime("22 min");
    chatModel4.setUnreadMessage(0);
    chatModel4.setLastMessageSendByMe(false);
    chats.add(chatModel4);

    //5
    ChatModel chatModel5 = new ChatModel();
    chatModel5.setUserName("Samanta");
    chatModel5.setUserPicAssetPath("assets/images/chat_screen/profilepic5.png");
    chatModel5.setLastMessage("That's awesome sanskar");
    chatModel5.setTime("15 minutes");
    chatModel5.setUnreadMessage(0);
    chatModel5.setLastMessageSendByMe(false);
    chats.add(chatModel5);

    print(chats.toString() + "this is the data we are saving");
  }

  List<types.Message> _messages = [];
  late IO.Socket _socket;

  _connectSocket() {
    _socket.onConnect((data) => print('Connection established'));
    _socket.onConnectError((data) => print('Connect Error: $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    _socket.on('message', (reply) {
      replys = reply;
      if (replys != null) {
        textMessage = types.TextMessage(
          author: _chat,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: replys,
        );
        _addMessage(textMessage);
      }
    });
  }

  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _chat = const types.User(id: '1');
  var textMessage;
  var replys;

  @override
  void dispose() {
    super.dispose();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    _socket.emit(
      'message',
      message.text,
    );
    _addMessage(textMessage);
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
      _socket.emit(
        'message',
        message.name,
      );
      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width / 4.4;
    double myWidth2 = MediaQuery.of(context).size.width / 2;
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: myWidth,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff213A50), Color(0xff071930)],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight)),
              ),
              Column(
                children: <Widget>[
                  /* SizedBox(
                    height: 90,
                  ),*/
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: tabSelected == 1
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      gradient: LinearGradient(
                                          colors: [
                                            const Color(0xffA2834D),
                                            const Color(0xffBC9A5F)
                                          ],
                                          begin: FractionalOffset.topRight,
                                          end: FractionalOffset.bottomLeft))
                                  : BoxDecoration(),
                              child: Image.asset(
                                "assets/images/profile.png",
                                width: 35,
                                height: 35,
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: tabSelected == 1
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    gradient: LinearGradient(
                                        colors: [
                                          const Color(0xffA2834D),
                                          const Color(0xffBC9A5F)
                                        ],
                                        begin: FractionalOffset.topRight,
                                        end: FractionalOffset.bottomLeft))
                                : BoxDecoration(),
                            child: Image.asset(
                              "assets/images/tindergoldlogo.png",
                              width: 35,
                              height: 35,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Pairs",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  gradient: LinearGradient(
                                      colors: [
                                        const Color(0xffA2834D),
                                        const Color(0xffBC9A5F)
                                      ],
                                      begin: FractionalOffset.topRight,
                                      end: FractionalOffset.bottomLeft)),
                              child: Image.asset(
                                "assets/images/chatbubble.png",
                                width: 30,
                                height: 30,
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Activities",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),*/
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    flex: 1,
                    child: LayoutBuilder(builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 0.2,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: chats.length,
                                    itemBuilder: (context, index) {
                                      return ChatTile(
                                        myWidth: myWidth,
                                        userName:
                                            chats[index].getUserName() ?? '',
                                        userPicAssetPath: chats[index]
                                                .getUserPicAssetPath() ??
                                            '',
                                        lastMessage:
                                            chats[index].getLastMessage() ?? '',
                                        time: chats[index].getTme() ?? '',
                                        unreadMessages:
                                            chats[index].getUnreadMessages() ??
                                                0,
                                        lastMessageSendByMe: chats[index]
                                                .getlastMessageSendByMe() ??
                                            false,
                                      );
                                    })
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
        widget.list? Container(
          width: 1186,
          child: Stack(
            children: <Widget>[
              Chat(
                messages: _messages,
                onAttachmentPressed: _handleAttachmentPressed,
                onMessageTap: _handleMessageTap,
                onPreviewDataFetched: _handlePreviewDataFetched,
                onSendPressed: _handleSendPressed,
                showUserAvatars: true,
                showUserNames: true,
                user: _user,
    avatarBuilder: (user) {
    return Column(
      children: [
        CircleAvatar(
        backgroundImage: AssetImage(widget.userPicAssetPath!),
        radius: 20,
        ),
        SizedBox(height: 4), // Adjust the spacing between avatar and name
        Text(widget.name!,style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );}
              )
            ],
          ),
        ): Column(
          children: [
            SizedBox( width: 1090,),
            Container(
              width: 600,
              height: 600,

              child:            Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_WpDG3calyJ.json' ,    width: 600,
                height: 600,),
            ),
          ],
        ) ,
      ],
    ));
  }
}

class ChatTile extends StatelessWidget {
  final String? userName, userPicAssetPath, lastMessage, time;
  int? unreadMessages = 0;
  bool? lastMessageSendByMe = false;
bool? list ;
  double myWidth;

  ChatTile({
    this.userName,
    this.userPicAssetPath,
    this.lastMessage,
    this.time,
    this.unreadMessages,
    this.lastMessageSendByMe,
    required this.myWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        list = true;

       // ChatScreen(list!);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatScreen(list!,this.userPicAssetPath,this.userName)));

/*        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SoketMessages()));*/
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: const Color(0xff213A50),
                image: DecorationImage(
                  image: AssetImage(userPicAssetPath!),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                border: unreadMessages! > 0
                    ? Border.all(
                        color: const Color(0xffD9B372),
                        width: 2.0,
                      )
                    : null,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: myWidth - 136,
                  alignment: Alignment.topLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        this.userName!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      unreadMessages! > 0
                          ? Row(
                              children: <Widget>[
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD9B372),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "$unreadMessages",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            )
                          : Container(),
                      // TODO add Spacer(),
                      Spacer(),
                      Text(
                        time!,
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    lastMessageSendByMe!
                        ? Row(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/chat_screen/back_arrow.png",
                                width: 14,
                                height: 14,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          )
                        : Container(),
                    Container(
                      width: myWidth - 158,
                      child: Text(
                        lastMessage!,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 14,
                          color: unreadMessages! > 0
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: myWidth - 136,
                  height: 0.2,
                  color: Colors.white70,
                ),
                SizedBox(
                  height: 8,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

///
