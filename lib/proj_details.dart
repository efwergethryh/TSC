import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart' as c;

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> with TickerProviderStateMixin {
  List<Widget> _tabs = [
    Tab(
      text: 'Daily',
    ),
    Tab(text: 'Weekly'),
    Tab(text: 'Monthly'),
  ];
  late final c.LineChartTopContainer lineChartContainer;
  late List<Widget> _tabViews;
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    lineChartContainer = c.LineChartTopContainer(
      chartData: c.ChartData(
          dataRows: [
            [0, 5, 3, 2, 0, 4, 6, 7, 4, 5, 6, 16],
          ],
          dataRowsColors: [
            Colors.black
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
                  hotspotOuterPaintColor: Color.fromARGB(255, 103, 159, 0),
                  hotspotInnerPaintColor: Colors.white))),
    );
    _tabViews = [
      Container(
        width: 300,
        height: 200,
        child: c.LineChart(
          painter: c.LineChartPainter(lineChartContainer: lineChartContainer),
        ),
      ),
      Container(
        width: 300,
        height: 200,
        child: c.LineChart(
          painter: c.LineChartPainter(lineChartContainer: lineChartContainer),
        ),
      ),
      Container(
        width: 300,
        height: 200,
        child: c.LineChart(
          painter: c.LineChartPainter(lineChartContainer: lineChartContainer),
        ),
      ),
    ];
  }

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
                    width: 80,
                  ),
                  Text(
                    'Project Details',
                    style: TextStyle(
                        color: Color(0xFF689F00),
                        fontSize: 24,
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 234, 234, 234),
                  
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Number Of Panels',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'manrope',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 80),
                          child: Text(
                            '20',
                            style: TextStyle(
                                color: Color(0xFF689F00),
                                fontFamily: 'manrope',
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 1,
                      height: 70,
                      color: Color.fromARGB(255, 112, 112, 112),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //Second column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Total Income',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'manrope',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '000,000,000',
                          style: TextStyle(
                              color: Color(0xFF689F00),
                              fontFamily: 'manrope',
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 234, 234, 234),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: TabBar(
                        
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'manrope',
                        ),
                        tabs: _tabs,
                        indicator: BoxDecoration(
                          // Use BoxDecoration to create a custom indicator
                          color: Colors.white,
                          // Indicator color
                          borderRadius: BorderRadius.circular(
                              15), // Optional: border radius
                        ),
                        controller: _tabController,
                        onTap: (value) {
                          setState(() {
                            _selectedIndex = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: _tabViews,
                        controller: _tabController,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 234, 234, 234),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                      ),
                      Text(
                        'View Contract ( PDF )',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'manrope',
                            fontSize: 15),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.13,
                      ),
                      Icon(
                        Icons.open_in_full_rounded,
                        color: Color.fromARGB(255, 103, 159, 0),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
