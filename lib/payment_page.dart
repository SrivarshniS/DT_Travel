import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final double totalAmount;

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isPaymentSuccessful = false;  // Track the payment success
  bool _isProcessingPayment = false;  // Track if the payment process is running

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Confirmation"),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          // Payment layer
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Trip Payment",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Total Amount: ₹${widget.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 40),
                  Image.asset(
                    'assets/images/g.png', // Add your Google Pay logo image here
                    //width: 150,
                    //height: 150,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Trigger the payment process
                      _processPayment(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text("Proceed to Payment"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Secure Payment via Google Pay",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),

          // Success message and animation layer
          if (_isPaymentSuccessful)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: _isPaymentSuccessful ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16), // Optional: rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 100,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Payment Successful!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 40),
                        TextButton(
                          onPressed: () {
                            // Close the payment screen or navigate to another page
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // This method simulates the payment process and triggers the success animation
  void _processPayment(BuildContext context) {
    setState(() {
      _isProcessingPayment = true;
    });

    // Placeholder for Google Pay integration code
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Redirecting to Google Pay...")),
    );

    // Simulate payment success after 6 seconds
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _isPaymentSuccessful = true;  // Show the success message and animation
        _isProcessingPayment = false;
      });
    });
  }
}
