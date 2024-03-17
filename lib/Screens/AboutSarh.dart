import 'package:flutter/material.dart';
import 'package:sarh/Screens/HomePage.dart';

class AboutSarh extends StatefulWidget {
  const AboutSarh({super.key});

  @override
  State<AboutSarh> createState() => _AboutSarhState();
}

class _AboutSarhState extends State<AboutSarh> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

        ),
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: Column(
                children: [
              Row(
              children: [
              Transform(
              transform: Matrix4.translationValues(-10, 0.0, 0.0),
              child: const Icon(Icons.chat_bubble_outline_rounded),),
            GestureDetector(
                child: const Text(
                  "     عن صرح",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),
            Transform(
              transform: Matrix4.translationValues(-250, 0.0, 0.0),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 19,
              ),
            ),
            ],
          ),
        const Divider(
          color: Color.fromARGB(255, 255, 217, 114),
          thickness: 5,
          indent: 7,
          endIndent: 150,
        ),
                  const Text(
                    "صَرَحَ: \n "
                        "- صرَحَ يَصرَح ، صَرْحًا ، فهو صارِح ، والمفعول مَصْروح.\n"
                        "- صرَح الأمرَ :بيَّنه وأظهره.\n"
                        "- صَرَحَ بِالشَّيْءِ : كَشَفَه.ُ\n"
                    "\n"
                        "صرح هو مشروع تخرج لطالبتي علوم حاسب في جامعة القصيم, \nلدعم مرضى التخاطب في رحلة تعلمهم للتواصل مع الاخرين"
                    "\n\n\n"
                        "للتواصل والإستفسار: صرح ايميل"
                  ,
                  style: TextStyle(fontSize: 16),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
