import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:tsc/requests/requests.dart';

class pro_info extends StatefulWidget {
  const pro_info({super.key});

  @override
  State<pro_info> createState() => _pro_infoState();
}

class _pro_infoState extends State<pro_info> {
  ApiClient api = ApiClient(baseUrl: 'http://192.168.0.190:3000');
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _pay() async {
    try {
      Map<String, dynamic> res =
          await api.getRequest(context, '/api/client_token', {});
      dynamic token = res['token'];
      print('token: ${token}');
      var request = BraintreeDropInRequest(
        tokenizationKey: token,
        collectDeviceData: true,
        paypalRequest: BraintreePayPalRequest(
          
          amount: '10.00',
          displayName: 'TSC',
        ),
        cardEnabled: true,
      );

      BraintreeDropInResult? result = await BraintreeDropIn.start(request);
      print('result: ${result}');
      print('token: ${request.tokenizationKey}');

      if (result != null) {
        final nonce = result.paymentMethodNonce?.nonce;

        if (nonce != null) {
          print('Nonce: ${result.paymentMethodNonce.nonce}');

          final transactionResponse = await api.postRequest(
            context: context,
            endpoint: '/api/pay',
            body: {
              'paymentMethodNonce': nonce,
              'amount': '10.00',
            },
            headers: {'Content-Type': 'application/json'},
          );

          if (transactionResponse.statusCode == 200) {
            // Handle successful transaction
            print('Transaction successful');
          } else {
            // Handle transaction error
            print('Transaction failed');
          }
        } else {
          // Nonce is null, user may have canceled payment
          print('Payment canceled or no payment method selected');
        }
      } else {
        // User canceled payment
        print('Payment canceled');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
      _showErrorDialog(context, 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: Color.fromARGB(255, 103, 159, 0),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 234, 234, 234),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        size: 19,
                        color: Color.fromARGB(255, 103, 159, 0),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                              image: AssetImage("lib/assets/solar1.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 19,
                        color: Color.fromARGB(255, 103, 159, 0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.03,
                              margin: EdgeInsets.only(left: 10),
                              color: Colors.white,
                              child: Row(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 154, 202, 64),
                                    borderRadius: BorderRadius.circular(36),
                                  ),

                                  width: MediaQuery.of(context).size.width *
                                      0.06, // Adjust width as needed
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 103, 159, 0),
                                    size: 15,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              'Available Panels',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'manrope'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              '00000',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 103, 159, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'manrope'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.03,
                              margin: EdgeInsets.only(left: 10),
                              color: Colors.white,
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 103, 159, 0),
                                      //  Color.fromARGB(255, 154, 202, 64),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.06, // Adjust width as needed
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    child: Center(
                                      child: Text(
                                        'E',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 154, 202, 64),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            fontFamily: 'manrope'),
                                      ),
                                    ))
                              ]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              'Generated Electricity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'manrope'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              '45 kW',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 103, 159, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'manrope'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.60, top: 20),
                child: Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'manrope'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 19, top: 20),
                child: Text(
                  'Lorem Ipsum Dolor Sit Amet, Consetetur Elitr, Sed Diam Nonumy ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'manrope'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.78, top: 20),
                child: Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'manrope'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.53, top: 10),
                child: Text(
                  '000,000 IQD',
                  style: TextStyle(
                      color: Color.fromARGB(255, 103, 159, 0),
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      fontFamily: 'manrope'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                width: 320,
                height: 56,
                margin: EdgeInsets.only(bottom: 12),
                child: FilledButton(
                    onPressed: () {
                      _pay();
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
                      'Invest',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.bold),
                    )),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
