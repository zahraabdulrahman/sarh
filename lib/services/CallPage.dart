import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CallPage extends StatefulWidget {
  final String channelId;
  final String userId;

  const CallPage({required this.channelId, required this.userId, Key? key})
      : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  AgoraClient? client;

  @override
  void initState() {
    super.initState();

    initAgora();
  }

  void initAgora() async {
    var token = await generateToken(); // Generate a token

    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: '1c60873bd7e04c4499eeca649c744656',
        channelName: widget.channelId,
        tempToken: token, // Use the generated token
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );

    await client!.initialize();
  }

  Future<String> generateToken() async {
    var appID = '1c60873bd7e04c4499eeca649c744656';
    var appCertificate = 'ee9713d0eeb34fd3a096d3fd0fa4bce2';
    var channelName = widget.channelId;
    var uid = widget.userId; // Set the user ID (optional)

    var url = 'https://api.agora.io/v1/token/rtc';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode({
        'app_id': appID,
        'app_certificate': appCertificate,
        'channel_name': channelName,
        'uid': uid,
        'role': 1, // Set the role (1 for publisher, 0 for subscriber)
        'privilege_expire_ts':
        DateTime.now().millisecondsSinceEpoch ~/ 1000 + 3600, // Set token expiration time (1 hour in this example)
      }),
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body['rtc_token'];
    } else {
      print('Token generation failed. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to generate token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: const Text("مكالة فيديو"),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              if (client != null)
                AgoraVideoViewer(
                  client: client!,
                  layoutType: Layout.floating,
                  enableHostControls: false, // Add this to enable host controls
                ),
              if (client != null)
                AgoraVideoButtons(
                  client: client!,
                  enabledButtons: const [
                    BuiltInButtons.toggleMic,
                    BuiltInButtons.callEnd,
                    BuiltInButtons.switchCamera,
                    BuiltInButtons.toggleCamera,
                  ], // Add this to enable screen sharing
                ),
            ],
          ),
        ),
      ),
    );
  }
}