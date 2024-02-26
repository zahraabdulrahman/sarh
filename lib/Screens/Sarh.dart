import 'package:flutter/material.dart';
//import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/cupertino.dart';
import 'consultations.dart';
import 'SessionsPage.dart';

class Sarh extends StatefulWidget {
  const Sarh({super.key});

  @override
  State<Sarh> createState() => _Sarh();
}

class videos extends StatelessWidget {
  const videos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _Sarh extends State<Sarh> {
  @override
  Widget build(BuildContext context) {
    // final List<Image> images = const [
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2FOn38NTWDT_U%2Fmaxresdefault.jpg&tbnid=aAW11fqEXJJ6xM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygBegQIARBH..i&imgrefurl=https%3A%2F%2Fm.youtube.com%2Fwatch%3Fv%3DOn38NTWDT_U&docid=RsqcSyJU0vArJM&w=1280&h=720&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygBegQIARBH"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.assettype.com%2Fajel%252F2022-09%252Fe8365b7d-dc17-438b-9324-9a1b8cc66c1b%252F______8___8___18_.png%3Fw%3D480%26auto%3Dformat%252Ccompress%26fit%3Dmax&tbnid=OricJCXG4RVjTM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygHegQIARBW..i&imgrefurl=https%3A%2F%2Fajel.sa%2Flocal%2Fhi8n3azohi&docid=WVxBU1ZQp4jo1M&w=480&h=270&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygHegQIARBW"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fadmin.dotcarecms.com%2Fstorage%2FAKW%2Fposts%2FDecember2023%2FduRdtcH1Vb9Hj5r4MjVXCUdTH9Ql3qGXkAizGbqC.webp&tbnid=mrikq1DJjbbibM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygUegQIARB1..i&imgrefurl=https%3A%2F%2Fwww.andalusiackw.com%2F%25D8%25AC%25D9%2584%25D8%25B3%25D8%25A7%25D8%25AA-%25D8%25AA%25D8%25AE%25D8%25A7%25D8%25B7%25D8%25A8-%25D8%25A8%25D8%25A7%25D9%2584%25D9%2585%25D9%2586%25D8%25B2%25D9%2584&docid=m_gaTKAgk5GzBM&w=1000&h=670&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygUegQIARB1"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fibsacademy.org%2FU%2Fc%2Fspeech-therapist.jpg&tbnid=hLbI1vIqGsilgM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygTegQIARBz..i&imgrefurl=https%3A%2F%2Fibsacademy.org%2Fcourse-542-beginner-speech-therapist-diploma.html&docid=ZlBCJI6RTavmTM&w=1200&h=628&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygTegQIARBz"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Ftopinturkey.com%2Fwp-content%2Fuploads%2F2020%2F06%2F%25D8%25A7%25D8%25AE%25D8%25AA%25D8%25B5%25D8%25A7%25D8%25B5-%25D9%2585%25D8%25B4%25D8%25A7%25D9%2583%25D9%2584-%25D8%25A7%25D9%2584%25D9%2586%25D8%25B7%25D9%2582-%25D9%2588%25D8%25B5%25D8%25B9%25D9%2588%25D8%25A8%25D8%25A7%25D8%25AA-%25D8%25A7%25D9%2584%25D8%25AA%25D9%2583%25D9%2584%25D9%2585.jpg&tbnid=CVC4yoVivDqJwM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMyguegUIARCxAQ..i&imgrefurl=https%3A%2F%2Ftopinturkey.com%2F%25D8%25AA%25D8%25AE%25D8%25B5%25D8%25B5-%25D9%2585%25D8%25B4%25D8%25A7%25D9%2583%25D9%2584-%25D8%25A7%25D9%2584%25D9%2586%25D8%25B7%25D9%2582-%25D9%2588%25D8%25B5%25D8%25B9%25D9%2588%25D8%25A8%25D8%25A7%25D8%25AA-%25D8%25A7%25D9%2584%25D8%25AA%25D9%2583%25D9%2584%25D9%2585%2F&docid=M7YqYOFhOZ7AKM&w=1200&h=628&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMyguegUIARCxAQ"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2FE-mBWAmujsg%2Fhqdefault.jpg&tbnid=vMkCx2Xo1EMOpM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygzegUIARDAAQ..i&imgrefurl=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DE-mBWAmujsg&docid=WxTnbOMWjILS7M&w=480&h=360&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygzegUIARDAAQ"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2FOn38NTWDT_U%2Fmaxresdefault.jpg&tbnid=aAW11fqEXJJ6xM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygBegQIARBH..i&imgrefurl=https%3A%2F%2Fm.youtube.com%2Fwatch%3Fv%3DOn38NTWDT_U&docid=RsqcSyJU0vArJM&w=1280&h=720&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygBegQIARBH"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.assettype.com%2Fajel%252F2022-09%252Fe8365b7d-dc17-438b-9324-9a1b8cc66c1b%252F______8___8___18_.png%3Fw%3D480%26auto%3Dformat%252Ccompress%26fit%3Dmax&tbnid=OricJCXG4RVjTM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygHegQIARBW..i&imgrefurl=https%3A%2F%2Fajel.sa%2Flocal%2Fhi8n3azohi&docid=WVxBU1ZQp4jo1M&w=480&h=270&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygHegQIARBW"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fadmin.dotcarecms.com%2Fstorage%2FAKW%2Fposts%2FDecember2023%2FduRdtcH1Vb9Hj5r4MjVXCUdTH9Ql3qGXkAizGbqC.webp&tbnid=mrikq1DJjbbibM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygUegQIARB1..i&imgrefurl=https%3A%2F%2Fwww.andalusiackw.com%2F%25D8%25AC%25D9%2584%25D8%25B3%25D8%25A7%25D8%25AA-%25D8%25AA%25D8%25AE%25D8%25A7%25D8%25B7%25D8%25A8-%25D8%25A8%25D8%25A7%25D9%2584%25D9%2585%25D9%2586%25D8%25B2%25D9%2584&docid=m_gaTKAgk5GzBM&w=1000&h=670&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygUegQIARB1"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fibsacademy.org%2FU%2Fc%2Fspeech-therapist.jpg&tbnid=hLbI1vIqGsilgM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygTegQIARBz..i&imgrefurl=https%3A%2F%2Fibsacademy.org%2Fcourse-542-beginner-speech-therapist-diploma.html&docid=ZlBCJI6RTavmTM&w=1200&h=628&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygTegQIARBz"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Ftopinturkey.com%2Fwp-content%2Fuploads%2F2020%2F06%2F%25D8%25A7%25D8%25AE%25D8%25AA%25D8%25B5%25D8%25A7%25D8%25B5-%25D9%2585%25D8%25B4%25D8%25A7%25D9%2583%25D9%2584-%25D8%25A7%25D9%2584%25D9%2586%25D8%25B7%25D9%2582-%25D9%2588%25D8%25B5%25D8%25B9%25D9%2588%25D8%25A8%25D8%25A7%25D8%25AA-%25D8%25A7%25D9%2584%25D8%25AA%25D9%2583%25D9%2584%25D9%2585.jpg&tbnid=CVC4yoVivDqJwM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMyguegUIARCxAQ..i&imgrefurl=https%3A%2F%2Ftopinturkey.com%2F%25D8%25AA%25D8%25AE%25D8%25B5%25D8%25B5-%25D9%2585%25D8%25B4%25D8%25A7%25D9%2583%25D9%2584-%25D8%25A7%25D9%2584%25D9%2586%25D8%25B7%25D9%2582-%25D9%2588%25D8%25B5%25D8%25B9%25D9%2588%25D8%25A8%25D8%25A7%25D8%25AA-%25D8%25A7%25D9%2584%25D8%25AA%25D9%2583%25D9%2584%25D9%2585%2F&docid=M7YqYOFhOZ7AKM&w=1200&h=628&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMyguegUIARCxAQ"),
    //           height: 40,
    //           width: 40,),
    //   Image(
    //       image: NetworkImage(
    //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2FE-mBWAmujsg%2Fhqdefault.jpg&tbnid=vMkCx2Xo1EMOpM&vet=12ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygzegUIARDAAQ..i&imgrefurl=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DE-mBWAmujsg&docid=WxTnbOMWjILS7M&w=480&h=360&q=%D9%85%D9%82%D8%A7%D8%B7%D8%B9%20%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9%20%D9%84%D9%85%D8%B1%D8%B6%D9%89%20%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8&ved=2ahUKEwjU1qaQ0LWEAxVdXaQEHcR2Br8QMygzegUIARDAAQ"),
    //           height: 40,
    //           width: 40,),
    // ];
    // final _containerHeight = 300.0;
    //final ScrollController _scrollController = ScrollController();
    return Scaffold(
      //extendBodyBehindAppBar: true, // <-- Set this
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(310, 43, 0.0),
          child: const Text(
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
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                child: Transform(
                  transform: Matrix4.translationValues(320, -3, 0.0),
                  child: const Text(
                    "أهلا احمد",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: Transform(
                  transform: Matrix4.translationValues(350, 1, 0),
                  child: const Text("الدروس"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.grey[400],
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.grey[400],
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(color: Color.fromARGB(255, 216, 188, 128)),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber.shade100
                ),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text('استشارات فورية', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Consulations()),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber.shade100
                ),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text('جلسات مجدولة', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SessionsPage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
