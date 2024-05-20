import 'package:flutter/material.dart';

class bar extends StatelessWidget {
  const bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      color: Color.fromARGB(80, 187, 222, 251),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_on_outlined, color: Colors.red, size: 30),
          Spacer(),
          Text(
            'Fast',
            style: TextStyle(
                color: Color.fromARGB(255, 8, 159, 0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'manrope',
                letterSpacing: 2),
          ),
          Text(
            'Pay',
            style: TextStyle(
                color: Color.fromARGB(255, 3, 13, 73),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'manrope',
                letterSpacing: 2),
          ),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_forward_sharp))
        ],
      ),
    );
  }
}
