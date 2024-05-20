import 'package:flutter/material.dart';

class bank extends StatelessWidget {
  late String text;
  late dynamic bIcon;
  bank({
    required this.text,
    required this.bIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.09,
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 103, 159, 0),
            ),
            Spacer(),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'manrope',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            bIcon is Icon
                ? bIcon = bIcon
                : bIcon = Image(
                    image: AssetImage(
                      bIcon,
                    ),
                    width: 40,
                  ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
