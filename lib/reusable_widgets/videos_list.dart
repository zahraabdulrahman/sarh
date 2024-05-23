import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class videos_list extends StatefulWidget {
  const videos_list({super.key});

  @override
  State<videos_list> createState() => _videos_listState();
}

class _videos_listState extends State<videos_list> {

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<videos_list> _lessons = [];
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
    // Get the reference to the videos folder in Firebase Storage
    Reference videosFolderRef = _storage.ref().child('videos');

    try {
      // List all items (videos) in the videos folder
      ListResult result = await videosFolderRef.listAll();

      // Loop through each item (video) in the list result
      for (Reference ref in result.items) {
        String videoUrl = await ref.getDownloadURL();
        String videoName = ref.name;

        // Create a new Lesson object and add it to the _lessons list
        // videos_list lesson = videos_list(videoUrl: videoUrl, text: videoName, videoPath: '');
        // _lessons.add(lesson);
      }

      // Update the UI after fetching all videos
      setState(() {});
    } catch (error) {
      print('Error fetching lessons: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

// Other methods and widget build here...
}


