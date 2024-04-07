import 'package:flutter/material.dart';
import 'cards/index.dart';
import 'package:sarh/reusable_widgets/card_list_widget.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.bottomRight,
          child: const Text(
            'بطاقات',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/صرح.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 250,
      ),
      body:
      Column(
        children: [
          CardsBarWidget(),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Feelings(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 166,
                                width: 133,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFA7A7),
                                  borderRadius: BorderRadius.circular(10),
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
                                            child: const Text("مشاعر",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),)
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 60),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Sentences(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 166,
                                  width: 133,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC7EAE4),
                                    borderRadius: BorderRadius.circular(10),
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
                                              child: const Text("جمل محفوظة",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),)
                                          ))
                                    ],
                                  ),)
            
                            )]),
                      const SizedBox(height: 60),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Food(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 166,
                                width: 133,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFA7A7),
                                  borderRadius: BorderRadius.circular(10),
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
                                            child: const Text("طعام",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),)
                                        ))
                                  ],
                                ),),),
                            const SizedBox(width: 60),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Things(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 166,
                                width: 133,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFD972),
                                  borderRadius: BorderRadius.circular(10),
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
                                            child: const Text("أشياء",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),)
                                        ))
                                  ],
                                ),),)
            
                          ]),
                      const SizedBox(height: 60),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Clothes(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 166,
                                width: 133,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFA7E8BD),
                                  borderRadius: BorderRadius.circular(10),
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
                                            child: const Text("ملابس",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),)
                                        ))
                                  ],
                                ),),),
                            const SizedBox(width: 60),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Drinks(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 166,
                                width: 133,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFC7EAE4),
                                  borderRadius: BorderRadius.circular(10),
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
                                            child: const Text("مشروبات",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),)
                                        ))
                                  ],
                                ),),)
            
                          ]),
                      const SizedBox(height: 60),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Actionss(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 166,
                                width: 133,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFD972),
                                  borderRadius: BorderRadius.circular(10),
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
                                            child: const Text("أفعال",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),)
                                        ))
                                  ],
                                ),),),
                            const SizedBox(width: 60),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddFolder(),
                                  ),
                                );
                              },
                              child: Container(
                                  height: 166,
                                  width: 133,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFA7E8BD),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text("إضافة ملف",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                  )),)
            
                          ]),
                      const SizedBox(height: 60),])
            
            ),
          ),
        ],
      ),
    );
  }
}