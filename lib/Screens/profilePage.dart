import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(150, 43, 0.0),
          child: const Text(
            'بطاقات',
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
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(
                  height: 150,
                  width: 337,
                    decoration: const BoxDecoration(
                        color: Colors.grey
                    ),

                )]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size(73, 50),// Specify the desired width and height
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8), // Specify the desired padding
                            )
                        ),
                    icon: const Icon(Icons.volume_up),
                      label : const Text("")
                    ),
                    const SizedBox(height: 90, width: 40),
                  ])
              ,
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
              height: 166,
              width: 133,
              decoration: const BoxDecoration(
                color: Colors.grey
              )),
              const SizedBox(width: 60),
              Container(
                  height: 166,
                  width: 133,
                  decoration: const BoxDecoration(
                      color: Colors.grey
                  ),
            )
          ]),
              const SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 166,
                        width: 133,
                        decoration: const BoxDecoration(
                            color: Colors.grey
                        )),
                    const SizedBox(width: 60),
                    Container(
                      height: 166,
                      width: 133,
                      decoration: const BoxDecoration(
                          color: Colors.grey
                      ),
                    )
                  ]),
              const SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 166,
                        width: 133,
                        decoration: const BoxDecoration(
                            color: Colors.grey
                        )),
                    const SizedBox(width: 60),
                    Container(
                      height: 166,
                      width: 133,
                      decoration: const BoxDecoration(
                          color: Colors.grey
                      ),
                    )
                  ]),
              const SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 166,
                        width: 133,
                        decoration: const BoxDecoration(
                            color: Colors.grey
                        )),
                    const SizedBox(width: 60),
                    Container(
                      height: 166,
                      width: 133,
                      decoration: const BoxDecoration(
                          color: Colors.grey
                      ),
                    )
                  ]),
              const SizedBox(height: 60),])

      ),
    );
  }
}