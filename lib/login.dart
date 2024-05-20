import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String selectedPrefix = '+647';
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 0, top: 120),
          child: Column(children: [
            Text(
              'Sign in',
              style: TextStyle(
                  color: Color(0xFF689F00),
                  fontSize: 24,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(right: 80),
                  child: Text(
                    'Enter your mobile number',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            Center(
              child: Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    DropdownButton<String>(
                        value: selectedPrefix,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPrefix = newValue!;
                          });
                        },
                        items: <String>[
                          '+647',
                          '+1',
                          '+44',
                          '+91'
                        ] // Add your selectable prefixes here
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: SizedBox(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        icon: Container()),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '|',
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                          hintText: '750 000 0000',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'manrope',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Center(
              child: Container(
                width: 320,
                height: 56,
                margin: EdgeInsets.only(bottom: 12),
                child: FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'verify');
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
                      'Sign in',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  'Continue as a guest',
                  style: TextStyle(
                      color: Color.fromARGB(227, 109, 109, 109),
                      fontSize: 16,
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
