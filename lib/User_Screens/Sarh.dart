import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/cupertino.dart';
import '../reusable_widgets/reusable_widget.dart';
import 'consultations.dart';
import 'SessionsPage.dart';
import 'package:video_player/video_player.dart'; // Import video_player
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:chewie/chewie.dart';

class Sarh extends StatefulWidget {
  const Sarh({super.key});

  @override
  State<Sarh> createState() => _Sarh();
}

class _Sarh extends State<Sarh> {

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Lesson> _lessons = [];
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _fetchLessons();
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _fetchLessons() async {
    // Fetch lessons from Firestore
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection('lessons').get();

    setState(() {
      _lessons = snapshot.docs.map((doc) => Lesson.fromMap(doc.data())).toList();
    });
  }

  Future<void> _playVideo(Lesson lesson) async {
    if (_chewieController != null) {
      await _chewieController?.pause();
      // await _chewieController?.dispose();
    }

    final videoUrl = await _downloadVideo(lesson.videoUrl);
    if (videoUrl.isNotEmpty) {
      _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.file(File(videoUrl)),
        autoInitialize: true,
        looping: false,
      );

      setState(() {});
    }
  }

  Future<String> _downloadVideo(String videoUrl) async {
    try {
      final ref = _storage.ref('videos/$videoUrl');
      final downloadUrl = await ref.getDownloadURL();
      final http.Response response = await http.get(Uri.parse(downloadUrl));
      final bytes = response.bodyBytes;
      return await writeBytes(bytes);
    } catch (error) {
      print('Error downloading video: $error');
      return '';
    }
  }

  Future<String> writeBytes(List<int> bytes) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/lesson_video.mp4');
    await tempFile.writeAsBytes(bytes);
    return tempFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //extendBodyBehindAppBar: true, // <-- Set this
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
              'صرح',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/صرح.png'),
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');
              Map<String, dynamic> data = snapshot.data!.data()!;
              String firstName =
                  data['first name'] ?? ''; // Get the first name from data

              return SizedBox(
                child: Row(
                    children: [
                      Text(
                        'اهلاً $firstName',
                        style:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
              );
            },
          ),
          const Row(
            children: [
              SizedBox(
                child: Text("الدروس"),
                ),
            ],
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: _lessons.length,
                itemBuilder: (context, index) {
                  final lesson = _lessons[index];
                  return ListTile(
                    title: Text(lesson.text),
                    subtitle: _chewieController != null &&
                        _chewieController!.videoPlayerController.value.isInitialized
                        ? Chewie(controller: _chewieController!)
                        : const Text('Downloading video...'),
                    onTap: () async {
                      if (_chewieController == null ||
                          !_chewieController!.videoPlayerController.value.isInitialized) {
                        await _playVideo(lesson);
                      } else {
                        _chewieController!.enterFullScreen();
                      }
                    },
                  );
                },
              ),
            ),
          ),



          const Divider(color: Color.fromARGB(255, 216, 188, 128)),

          SizedBox(height: 20,),
          buttons2(
            context,
            60.0,
            250.0,
            9.0,
            1.0,
            20.0,
            15.0,
            "استشارات فورية",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Consulations()),
              );
            },
            const Color(0xFFFFD972),
            const Color(0xFF99CFA5),
          ),
          const SizedBox(height: 20,),
          buttons2(
            context,
            60.0,
            250.0,
            9.0,
            1.0,
            20.0,
            15.0,
            "جلسات مجدولة",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SessionsPage()),
              );
            },
            const Color(0xFFEFA7A7),
            const Color(0xFF99CFA5),
          ),
        ],
      ),
    );
  }
}

class Lesson {
  final String videoUrl;
  final String text;
  String videoPath; // Local path for downloaded video

  Lesson.fromMap(Map<String, dynamic> data)
      : videoUrl = data['videoUrl'] as String,
        text = data['text'] as String,
        videoPath = '';
}