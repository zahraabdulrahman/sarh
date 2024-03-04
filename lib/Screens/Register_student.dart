import 'package:flutter/material.dart';
import 'register.dart';
//import 'package:image_picker/image_picker.dart';
class Register_student extends StatelessWidget {
  const Register_student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(leading:
        IconButton(icon: const Icon(Icons.arrow_back,
        size:50,
        color: Color(0xFFA7E8BD),),
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Register_screen()),
          );
          },),
        ),
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/images/pfp.png')),
          const SizedBox(height: 0,),
          const Row(
            children: [
              SizedBox(width: 260,),
              Text("البريد الالكتروني", style: TextStyle(color: Color(0xFF3A3A3A),),)
            ],
          ),
        Row(
          children: [
            const SizedBox(width: 30,),
            Container(
                height: 49, width: 315,
                alignment: Alignment.centerRight,
                child: const TextField(
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    labelText: '',
                    hintText: 'ادخل بريدك الالكتروني',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFA7E8BD),
                            width: 1
                        )
                    ),
                  ),
                )),],
        ),
          const Row(
            children: [
              SizedBox(width: 285,),
              Text("الاسم الاول", style: TextStyle(color: Color(0xFF3A3A3A),),)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30,),
              Container(
                  height: 49, width: 315,
                  alignment: Alignment.centerRight,
                  child: const TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: 'اسمك الاول',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFA7E8BD),
                              width: 1
                          )
                      ),
                    ),
                  )),],
          ),
          const Row(
            children: [
              SizedBox(width: 288,),
              Text("اسم العائلة", style: TextStyle(color: Color(0xFF3A3A3A),),)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30,),
              Container(
                  height: 49, width: 315,
                  alignment: Alignment.centerRight,
                  child: const TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: 'اسمك الاخير',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFA7E8BD),
                              width: 1
                          )
                      ),
                    ),
                  )),],
          ),
          const Row(
            children: [
              SizedBox(width: 279,),
              Text("تاريخ الميلاد", style: TextStyle(color: Color(0xFF3A3A3A),),)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30,),
              Container(
                  height: 49, width: 315,
                  alignment: Alignment.centerRight,
                  child: const TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: 'يوم ميلادك',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFA7E8BD),
                              width: 1
                          )
                      ),
                    ),
                  )),],
          ),
          const Row(
            children: [
              SizedBox(width: 285,),
              Text("كلمة المرور", style: TextStyle(color: Color(0xFF3A3A3A),),)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30,),
              Container(
                  height: 49, width: 315,
                  alignment: Alignment.centerRight,
                  child: const TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: 'يجب ان يحتوي على حروف كبيرة وصغيره ورمز واحد على الأقل',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFA7E8BD),
                              width: 1
                          )
                      ),
                    ),
                  )),],
          ),
          const Row(
            children: [
              SizedBox(width: 258,),
              Text("تأكيد كلمة المرور", style: TextStyle(color: Color(0xFF3A3A3A),),)
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30,),
              Container(
                  height: 49, width: 315,
                  alignment: Alignment.centerRight,
                  child: const TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: 'إعادة كتابة كلمة المرور',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFA7E8BD),
                              width: 1
                          )
                      ),
                    ),
                  )),],
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 30),
            height: 72,
            width: 315,
            decoration:
            BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: const Color(0xFFA7E8BD),
                  ),
            child:
            const Row(children: [
              Icon(Icons.arrow_back,
                color: Colors.black,
                size: 19,),
              SizedBox(width: 130),
              Center(
                child: Text("إكمال",
                    style: TextStyle(fontSize: 20,)),
              )]),

          )
          ],),
    );
  }}