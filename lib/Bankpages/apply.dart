import 'package:flutter/material.dart';
import 'package:tsc/Bankpages/bank_model.dart';
import 'package:tsc/bank_icons.dart';
import 'package:tsc/Bankpages/bar.dart';

class apply extends StatelessWidget {
  const apply({super.key});

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
                    'المبلغ',
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.add),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      Text(
                        '0IQD',
                        style: TextStyle(
                            color: Color.fromARGB(255, 3, 6, 55),
                            fontSize: 18,
                            fontFamily: ' manrope',
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      Icon(Icons.remove),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'qr'),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 5, 14, 66),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: Center(
                      child: Text(
                        'التقدم',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'manrope',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
