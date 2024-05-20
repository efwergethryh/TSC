import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart' as c;
// import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'requests/requests.dart';
// import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late PageController _pageController;
  Future get_api() async {}

  double _currentPage = 0.0;
  @override
  void initState() {
    super.initState();
    get_api();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      "https://g.foolcdn.com/image/?url=https%3A//g.foolcdn.com/editorial/images/157215/solar-power-panels-on-a-roof-at-sunset.jpg&w=2000&op=resize",
      "https://th.bing.com/th/id/R.5fcea636e9f143ad6fd4d827e5531c80?rik=vCRfKsvlwGoXFw&riu=http%3a%2f%2fwww.articles-place.com%2fwp-content%2fuploads%2f2012%2f06%2f1234.jpg&ehk=nfZ5OJBdEWt4f8fUdHsRlAXNyw3JEe2FGeTwjWij91c%3d&risl=&pid=ImgRaw&r=0",
      "https://g.foolcdn.com/editorial/images/505800/solar-panels-on-home.jpg",
      "https://energyeducation.ca/wiki/images/thumb/2/2c/Fixed_Tilt_Solar_panel_at_Canterbury_Municipal_Building_Canterbury_New_Hampshire.jpg/1200px-Fixed_Tilt_Solar_panel_at_Canterbury_Municipal_Building_Canterbury_New_Hampshire.jpg",
    ];
    final List<String> panels = [
      "lib/assets/solar1.png",
      "lib/assets/solar1.png",
      "lib/assets/solar1.png",
      "lib/assets/solar1.png",
    ];
// Now imageUrls contains the list of URLs directly.

    final c.LineChartTopContainer lineChartContainer = c.LineChartTopContainer(
      chartData: c.ChartData(
          dataRows: [
            [0, 5, 3, 2, 0, 4, 6, 7, 4, 5, 6, 16],
          ],
          dataRowsColors: [
            Colors.white
          ],
          xUserLabels: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'June',
            'July',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
          ],
          dataRowsLegends: [
            'Jan',
          ],
          chartOptions: c.ChartOptions(
              legendOptions: c.LegendOptions(isLegendContainerShown: false),
              // xContainerOptions: c.XContainerOptions(isXContainerShown: false),
              labelCommonOptions: c.LabelCommonOptions(),
              yContainerOptions: c.YContainerOptions(isYContainerShown: false),
              dataContainerOptions: c.DataContainerOptions(
                gridLinesColor: Colors.transparent,
              ),
              lineChartOptions: c.LineChartOptions(
                  hotspotInnerRadius: 3,
                  hotspotOuterPaintColor: Color.fromARGB(255, 214, 161, 16),
                  hotspotInnerPaintColor: Colors.white))),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Profile container
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: 330,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 96, 163, 57),
                          Color.fromARGB(255, 147, 187, 18)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'wallet'),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Hi, Lorem Ipsum',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'manrope',
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          'Your Invest account value is',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'manrope',
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          '000,000,000',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'manrope',
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)),
                          onPressed: () {},
                          child: Text(
                            'See Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'manrope',
                                color: Color.fromARGB(255, 147, 187, 18)),
                          )),
                      Container(
                        width: 300,
                        height: 200,
                        child: c.LineChart(
                          painter: c.LineChartPainter(
                              lineChartContainer: lineChartContainer),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: CarouselSlider(
                    items: imageUrls
                        .map((url) => Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                    image: NetworkImage(url),
                                    fit: BoxFit.cover),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      autoPlay: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Panels',
                      style: TextStyle(
                          color: Color.fromARGB(255, 103, 159, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'manrope'),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'View all ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 103, 159, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'manrope'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: Color.fromARGB(255, 103, 159, 0),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'pro_info'),
                  child: SizedBox(
                    height: 280,
                    child: CarouselSlider(
                      items: panels
                          .map((url) => ClipRRect(
                                borderRadius: BorderRadius.circular(17),
                                child: Container(
                                  color: Color.fromARGB(255, 234, 234, 234),
                                  width: MediaQuery.of(context).size.width * 1,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      Image(
                                        image: AssetImage(url),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 70),
                                            child: Text(
                                              'AA #0000',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'manrope',
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              //Inner container
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                  color: Color.fromARGB(
                                                      255, 103, 159, 0),
                                                  child: Row(children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    154,
                                                                    202,
                                                                    64),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),

                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04, // Adjust width as needed
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.check,
                                                              size:
                                                                  12, // Adjust size as needed
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      103,
                                                                      159,
                                                                      0),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '00000',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'manrope'),
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                  color: Colors.white,
                                                  child: Row(children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    103,
                                                                    159,
                                                                    0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),

                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04, // Adjust width as needed
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                          child: Center(
                                                            child: Text(
                                                              "E",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12, // Adjust size as needed
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          154,
                                                                          202,
                                                                          64),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'manrop'),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '00000',
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  0, 0, 0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'manrope'),
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.9,
                        enlargeFactor: 0.2,
                        enlargeCenterPage: true,
                        viewportFraction: 0.5,
                        autoPlay: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Projects',
                      style: TextStyle(
                          color: Color.fromARGB(255, 103, 159, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'manrope'),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'View all ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 103, 159, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'manrope'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: Color.fromARGB(255, 103, 159, 0),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: CarouselSlider(
                    items: imageUrls
                        .map((url) => GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, 'details'),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(
                                      image: NetworkImage(url),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      autoPlay: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
