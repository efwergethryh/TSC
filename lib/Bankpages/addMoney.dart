import 'package:flutter/material.dart';
import 'package:tsc/Bankpages/bank_model.dart';
import 'package:tsc/bank_icons.dart';
import 'package:tsc/Bankpages/bar.dart';

class addMoney extends StatelessWidget {
  const addMoney({super.key});

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
                  'حدد مصدر إضافة الأموال الخاصة بك',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'manrope',
                    color: Colors.black,
                  ),
                )),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'chooseBank'),
              child: Center(
                  child: bank(
                text: 'FastPayالبنك إلى',
                bIcon: Icon(
                  bank_icons.bank,
                  color: Color.fromARGB(255, 103, 159, 0),
                ),
              )),
            ),
            Center(
                child: bank(
              text: 'FastPayبطاقة إلى ',
              bIcon: Icon(
                bank_icons.credit_card,
                color: Color.fromARGB(255, 103, 159, 0),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
