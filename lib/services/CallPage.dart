import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:permission_handler/permission_handler.dart';


class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: '1c60873bd7e04c4499eeca649c744656',
      channelName: "sarhcalls",
      tempToken: "007eJxTYHgue+j0k4k+sWo2OVcP3PRTZjhsXx3E++t59FRDuS26b3oUGAyTzQwszI2TUsxTDUySTUwsLVNTkxPNTCyTzU1MzEzN+DfIpTUEMjJsNpJjYIRCEJ+ToTixKCM5MSenmIEBAM8FIBk=",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

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


