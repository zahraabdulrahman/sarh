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
  late String channelId;
  late AgoraClient client;
  String serverUrl = "https://agora-token-server-4cf5.onrender.com/";

  @override
  void initState() {
    super.initState();
    channelId = widget.channelId;
    initAgora();
  }

  void initAgora() async {
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: '1c60873bd7e04c4499eeca649c744656',
        channelName: channelId,
        tokenUrl: serverUrl,
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );

    await client.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar:AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: const Text("مكالة فيديو"),)
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: false, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                  client: client,
                  enabledButtons: const [
                    BuiltInButtons.toggleMic,
                    BuiltInButtons.callEnd,
                    BuiltInButtons.switchCamera,
                    BuiltInButtons.toggleCamera,
                  ]// Add this to enable screen sharing
              ),
            ],
          ),
        ),
      ),
    );
  }
}
