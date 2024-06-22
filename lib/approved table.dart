import 'package:flutter/material.dart';

class Approved extends StatefulWidget {
  @override
  _ApprovedPageState createState() => _ApprovedPageState();
}

class _ApprovedPageState extends State<Approved> {
  List<Map<String, String>> data = [];

  @override
  void initState() {
    super.initState();
    // Fetch the requested data from the database or any other source
    // Here, we are initializing the data with some static values
    fetchData();
  }

  void fetchData() {
    // Simulate fetching data from a database or an API
    // Replace this with your actual data fetching logic
    setState(() {
      data = [
        {
          "cardNumber": "1234 5678 9101 1121",
          "country": "USA",
          "zipCode": "12345",
          "date": "12/24",
          "cvc": "123"
        },
        {
          "cardNumber": "9876 5432 1098 7654",
          "country": "Canada",
          "zipCode": "M1X 2Y4",
          "date": "10/25",
          "cvc": "456"
        },
        // Add more data as needed
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color here
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Payments',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                shadows: [
                  Shadow(
                    blurRadius: 6.0,
                    color: Colors.black,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.playlist_add_check, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  'Paid Users (${data.length})',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.deepPurple,
                        offset: Offset(1, 1),
                      ),
                    ],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(9.0),
              child: DataTable(
                columnSpacing: 7.0,
                dataRowHeight: 60.0,
                border: TableBorder.all(color: Colors.purple, width: 2.0),
                columns: [
                  DataColumn(label: Text('Card Number', style: TextStyle(color: Colors.purple))),
                  DataColumn(label: Text('Country', style: TextStyle(color: Colors.purple))),
                  DataColumn(label: Text('Zip Code', style: TextStyle(color: Colors.purple))),
                  DataColumn(label: Text('Date', style: TextStyle(color: Colors.purple))),
                  DataColumn(label: Text('CVC', style: TextStyle(color: Colors.purple))),
                ],
                rows: data.map(
                      (item) => DataRow(
                    cells: [
                      DataCell(Text(item['cardNumber'] ?? '')),
                      DataCell(Text(item['country'] ?? '')),
                      DataCell(Text(item['zipCode'] ?? '')),
                      DataCell(Text(item['date'] ?? '')),
                      DataCell(Text(item['cvc'] ?? '')),
                    ],
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
