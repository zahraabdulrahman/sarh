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
                    decoration: BoxDecoration(
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
                              Size(73, 50),// Specify the desired width and height
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(8), // Specify the desired padding
                            )
                        ),
                    icon: Icon(Icons.volume_up),
                      label : Text("")
                    ),
                    SizedBox(height: 90, width: 40),
                  ])
              ,
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
              height: 166,
              width: 133,
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Column(
                children: [

                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      child: Image.asset(
                        'assets/images/emoji.png',
                        fit: BoxFit.cover,),

                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          child: Text("مشاعر",
                            style: TextStyle(
                              fontSize: 18,
                            ),)
                      ))
                ],
              ),),
              SizedBox(width: 60),
              Container(
                  height: 166,
                  width: 133,
                  decoration: BoxDecoration(
                      color: Color(0xFFEFA7A7)
                  ),
                child: Column(
                  children: [

                      AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                            child: Image.asset(
                                'assets/images/sentences.PNG',
                              fit: BoxFit.cover,),

                        ),
                      ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Text("جمل محفوظة",
                            style: TextStyle(
                              fontSize: 18,
                            ),)
                        ))
                  ],
                ),
            )
          ]),
              SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 166,
                        width: 133,
                        decoration: BoxDecoration(
                            color: Color(0xFFC7EAE4)
                        ),
                      child: Column(
                        children: [

                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              child: Image.asset(
                                'assets/images/arabic-food.jpg',
                                fit: BoxFit.cover,),

                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Text("طعام",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),)
                              ))
                        ],
                      ),),
                    SizedBox(width: 60),
                    Container(
                      height: 166,
                      width: 133,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFD972)
                      ),
                      child: Column(
                        children: [

                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              child: Image.asset(
                                'assets/images/stuff.png',
                                fit: BoxFit.cover,),

                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Text("أشياء",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),)
                              ))
                        ],
                      ),
                    )
                  ]),
              SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 166,
                        width: 133,
                        decoration: BoxDecoration(
                            color: Colors.grey
                        ),
                      child: Column(
                        children: [

                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              child: Image.asset(
                                'assets/images/clothes.jpg',
                                fit: BoxFit.cover,),

                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Text("ملابس",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),)
                              ))
                        ],
                      ),),
                    SizedBox(width: 60),
                    Container(
                      height: 166,
                      width: 133,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      child: Column(
                        children: [

                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              child: Image.asset(
                                'assets/images/water.png',
                                fit: BoxFit.cover,),

                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Text("مشروبات",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),)
                              ))
                        ],
                      ),
                    )
                  ]),
              SizedBox(height: 60),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 166,
                        width: 133,
                        decoration: BoxDecoration(
                            color: Colors.grey
                        ),
                      child: Column(
                        children: [

                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              child: Image.asset(
                                'assets/images/action.PNG',
                                fit: BoxFit.cover,),

                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Text("أفعال",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),)
                              ))
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    Container(
                      height: 166,
                      width: 133,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text("إضافة ملف جديد")
                          )
                        ],
                      ),
                    )
                  ]),
              SizedBox(height: 60),])

      ),
    );
  }
}