import 'package:flutter/material.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  final int numberOfDigits = 6; // Change this value as per your requirements
  final List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 50),
      child: Column(children: [
        Icon(
          Icons.lock_rounded,
          color: Color(0xFF689F00),
          size: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Verify number',
          style: TextStyle(
              color: Color(0xFF689F00),
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: 'fontgroup1'),
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 25),
                child: Text(
                  'Enter the code we sent to the number ending 0000',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(numberOfDigits, (index) {
              final controller = TextEditingController();
              controllers.add(controller);
              return SizedBox(
                width: 50,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromARGB(255, 238, 238, 238)),
                    controller: controller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        final nextIndex = index + 1;
                        if (nextIndex < numberOfDigits) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      } else {
                        final previousIndex = index - 1;
                        if (previousIndex >= 0) {
                          controllers[previousIndex].clear();
                          FocusScope.of(context).previousFocus();
                        }
                      }
                    },
                  ),
                ),
              );
            }),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            'Expires within 00:00:59',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'manrope',
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 150,
        ),
        Center(
          child: Container(
            width: 340,
            height: 56,
            margin: EdgeInsets.only(bottom: 20),
            child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'info');
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          13.0), // Adjust the borderRadius as needed
                    )),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFF689F00))),
                child: Text(
                  'Verify',
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
              'Resend code',
              style: TextStyle(
                  color: Color.fromARGB(227, 109, 109, 109),
                  fontSize: 16,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    )));
  }
}
