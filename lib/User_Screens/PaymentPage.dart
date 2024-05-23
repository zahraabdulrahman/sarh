import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sarh/User_Screens/PaymentDetails.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'الدفع',
          style: TextStyle(color: Colors.black, fontSize: 16),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
            child: Row(
              children: [
                Text(
                  'التكلفة',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 180, 0),
                  child: Text('130.25 ر.س'),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            // thickness: 5,
            indent: 15,
            endIndent: 15,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
            child: Row(
              children: [
                Text('الضربية', style: TextStyle(fontSize: 18)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 180, 0),
                  child: Text('19.75 ر.س'),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            // thickness: 5,
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
            child: Row(
              children: [
                Text('الاجمالي', style: TextStyle(fontSize: 18)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 180, 0),
                  child: Text('150 ر.س'),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            // thickness: 5,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text('يمكنك الدفع من خلال:', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaymentDetails()),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white  ,
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100,0,100,0),
                        child: Image.asset(
                                          'assets/images/mada.png',
                                          width: 60,
                                          height: 50,
                                        ),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
