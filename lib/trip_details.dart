import 'package:flutter/material.dart';
import './payment_page.dart';

class TripDetailsPage extends StatefulWidget {
  final String state;
  final int index;
  const TripDetailsPage({Key? key, required this.state, required this.index}) : super(key: key);

  @override
  _TripDetailsPageState createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  int _selectedLayer = 1;
  double _totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.state} Trip Details")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedLayer = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedLayer == 1 ? Colors.orange : Colors.grey,
                ),
                child: Text("Normal Package"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedLayer = 2;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedLayer == 2 ? Colors.orange : Colors.grey,
                ),
                child: Text("Premium Package"),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _selectedLayer == 1
                    ? (widget.index % 2 == 0 ? _buildNormalPackage1() : _buildNormalPackage2())
                    : (widget.index % 2 == 0 ? _buildPremiumPackage1() : _buildPremiumPackage2()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalPackage1() {
    _totalAmount = 10200.0;
    return _buildPackage("Standard Package", [
      ["3-star Hotel", "₹2,500/night"],
      ["AC Bus", "₹1,200"],
      ["Local Meals", "₹800/day"],
      ["Group Tour", "₹1,500"],
      ["Total (3 days)", "₹10,200"],
    ], "Rajesh Kumar", "+91 98765 43210");
  }

  Widget _buildNormalPackage2() {
    _totalAmount = 8500.0;
    return _buildPackage("Budget Package", [
      ["2-star Hotel", "₹1,800/night"],
      ["Non-AC Bus", "₹900"],
      ["Basic Meals", "₹600/day"],
      ["Self-Guided Tour", "₹1,000"],
      ["Total (3 days)", "₹8,500"],
    ], "Kumar Swamy", "+91 98765 67890");
  }

  Widget _buildPremiumPackage1() {
    _totalAmount = 36500.0;
    return _buildPackage("Luxury Package", [
      ["5-star Hotel", "₹6,500/night"],
      ["Private SUV", "₹5,000"],
      ["Fine Dining", "₹2,500/day"],
      ["Private Tour", "₹4,500"],
      ["Total (3 days)", "₹36,500"],
    ], "Suresh Babu", "+91 98765 87654");
  }

  Widget _buildPremiumPackage2() {
    _totalAmount = 50500.0;
    return _buildPackage("Exclusive Package", [
      ["Luxury Villa", "₹10,000/night"],
      ["Chauffeur-driven Car", "₹7,500"],
      ["Gourmet Meals", "₹3,500/day"],
      ["Custom Guided Tour", "₹6,000"],
      ["Total (3 days)", "₹50,500"],
    ], "Manoj Verma", "+91 98765 99999");
  }

  Widget _buildPackage(String title, List<List<String>> details, String guide, String contact) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        _buildTable(details),
        SizedBox(height: 25),
        _buildTripGuideDetails(guide, contact),
        SizedBox(height: 25),
        _buildBookTripButton(),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      children: data.map(
        (row) => TableRow(
          children: row.map(
            (cell) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cell, style: TextStyle(fontSize: 16)),
            ),
          ).toList(),
        ),
      ).toList(),
    );
  }

  Widget _buildTripGuideDetails(String name, String contact) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trip Guide: $name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Contact: $contact", style: TextStyle(fontSize: 16, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildBookTripButton() {
    return ElevatedButton(
      onPressed: () {
        // Pass the total amount to the PaymentPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(totalAmount: _totalAmount),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text("Book Trip", style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
