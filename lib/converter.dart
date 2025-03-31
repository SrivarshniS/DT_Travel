import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _controller = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'INR';
  double _convertedAmount = 0.0;

  final Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.91,
    'GBP': 0.76,
    'JPY': 150.23,
    'INR': 83.10,
  };

  void _convertCurrency() {
    double inputAmount = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      double fromRate = exchangeRates[_fromCurrency] ?? 1.0;
      double toRate = exchangeRates[_toCurrency] ?? 1.0;
      _convertedAmount = (inputAmount / fromRate) * toRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Enter Amount",
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: _fromCurrency,
                  dropdownColor: Colors.grey[900],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency, style: TextStyle(fontSize: 18)),
                    );
                  }).toList(),
                ),
                Icon(Icons.swap_horiz, color: Colors.white),
                DropdownButton<String>(
                  value: _toCurrency,
                  dropdownColor: Colors.grey[900],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  onChanged: (String? newValue) {
                    setState(() {
                      _toCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency, style: TextStyle(fontSize: 18)),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text("Convert", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Text(
              "Converted Amount: $_convertedAmount $_toCurrency",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
