import 'package:flutter/material.dart';

class info extends StatefulWidget {
  const info({super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  bool agree = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 0, top: 120),
          child: Column(children: [
            Text(
              'Complete profile',
              style: TextStyle(
                  color: Color(0xFF689F00),
                  fontSize: 24,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(right: 200, bottom: 10),
              child: Text(
                'First name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 168, 168, 168),
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w500),
                    hintText: "lorem ipsum",
                    fillColor: Color.fromARGB(255, 238, 238, 238),
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 200, bottom: 10),
              child: Text(
                'Last name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 168, 168, 168),
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w500),
                    hintText: "lorem ipsum",
                    fillColor: Color.fromARGB(255, 238, 238, 238),
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 200, bottom: 10),
              child: Text(
                'Birth date ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.date_range_sharp,
                      color: Color(0xFF689F00),
                      size: 35,
                    ),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 168, 168, 168),
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w500),
                    hintText: "00/00/0000",
                    fillColor: Color.fromARGB(255, 238, 238, 238),
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Checkbox(
                  checkColor: Color(0xFF689F00),
                  activeColor: Color(0xFF689F00),

                  side: BorderSide(
                      color: Color.fromARGB(255, 238, 238, 238), width: 3),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0))), // Rounded Checkbox
                  value: agree,
                  onChanged: (inputValue) {
                    setState(() {
                      agree = inputValue!;
                    });
                  },
                ),
                Text(
                  'I agree to the',
                  style: TextStyle(
                    color: Color.fromARGB(255, 109, 109, 109),
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        color: Color(0xFF689F00),
                        fontSize: 15,
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 320,
                height: 56,
                margin: EdgeInsets.only(bottom: 12),
                child: FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              13.0), // Adjust the borderRadius as needed
                        )),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xFF689F00))),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
