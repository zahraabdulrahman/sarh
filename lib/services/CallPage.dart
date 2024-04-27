import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:permission_handler/permission_handler.dart';


class CallPage extends StatefulWidget {
  final String channelId;

  const CallPage({required this.channelId, Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  late final AgoraClient client;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: '1c60873bd7e04c4499eeca649c744656',
        channelName: widget.channelId,
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );
  }

  late String userUID;
  late String specialistUID;
  late String formattedDate;
  late String formattedTime;
  

  void initAgora() async {
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


