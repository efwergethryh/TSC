import 'package:flutter/material.dart';
import 'package:tsc/Bankpages/bank_model.dart';
import 'package:tsc/bank_icons.dart';
import 'package:tsc/Bankpages/bar.dart';

class qr extends StatelessWidget {
  const qr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              bar(),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  'إضافة المال',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'manrope',
                      color: Color.fromARGB(255, 103, 159, 0)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    'FIB باستخدام تطبيق QR امسح',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'manrope',
                      color: Colors.black,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 234, 234, 234),
                    ),
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image(
                      image: AssetImage('lib/assets/image.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              Center(
                child: Text(
                  'SQ2U-NRS3-2K7a',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Center(
                child: Text(
                  'qr_or',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'manrope'),
                ),
              ),
              Center(
                child: Text(
                  'qr_pay_via',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'manrope'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Center(
                    child: bank(
                        text: 'First Iraqi bank',
                        bIcon: 'lib/assets/bank_logo.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
