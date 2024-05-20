import 'package:flutter/material.dart';

class wallet extends StatelessWidget {
  const wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Color.fromARGB(255, 103, 159, 0),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Text(
                      'My wallet',
                      style: TextStyle(
                          color: Color(0xFF689F00),
                          fontSize: 24,
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Color.fromARGB(255, 234, 234, 234),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                    child: Center(
                      child: Column(children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Current Wallet Balance',
                          style: TextStyle(
                              color: Color(0xFF689F00),
                              fontSize: 20,
                              fontFamily: 'manrope',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '000,000,000',
                          style: TextStyle(
                              color: Color(0xFF689F00),
                              fontFamily: 'manrope',
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: FilledButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                    (states) => Color(0xFF689F00),
                                  )),
                                  onPressed: () {},
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'manrope',
                                        color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: FilledButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                    (states) =>
                                        Color.fromARGB(255, 154, 202, 64),
                                  )),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'addMoney');
                                  },
                                  child: Text(
                                    'Transfer Money',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'manrope',
                                        color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(right: 190),
                  child: Text(
                    'My Investments',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    1,
                    2,
                    3,
                    4,
                  ]
                      .map((e) => Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.14,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '#2563',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'manrope',
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00/00/0000',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'manrope',
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 150),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 90),
                                          child: Text(
                                            '00000',
                                            style: TextStyle(
                                                color: Color(0xFF689F00),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'manrope'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Total Earnings/Monthly',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'manrope',
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
