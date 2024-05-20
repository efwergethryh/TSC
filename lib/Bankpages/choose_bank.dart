import 'package:flutter/material.dart';
import 'package:tsc/Bankpages/bank_model.dart';
import 'package:tsc/bank_icons.dart';
import 'package:tsc/Bankpages/bar.dart';

class chooseBank extends StatelessWidget {
  const chooseBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              height: 30,
            ),
            Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  'حدد البنك الذي تتعامل معه لإضافة أموال',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'manrope',
                    color: Colors.black,
                  ),
                )),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'apply'),
              child: Center(
                  child: bank(
                      text: 'First Iraqi bank',
                      bIcon: 'lib/assets/bank_logo.png')),
            ),
          ],
        ),
      ),
    );
  }
}
