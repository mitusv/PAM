import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String fromCurrency = 'MDL';
  String toCurrency = 'USD';
  double amount = 1000.00;
  double convertedAmount = 0.00;

  Map<String, double> exchangeRates = {
    'MDL': 1.0,
    'USD': 0.056,
    'EUR': 0.051,
    'GBP': 0.044,
  };

  void convertCurrency() {
    setState(() {
      double fromRate = exchangeRates[fromCurrency]!;
      double toRate = exchangeRates[toCurrency]!;
      convertedAmount = (amount / fromRate) * toRate;
    });
  }

  void swapCurrencies() {
    setState(() {
      String temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
      convertCurrency();
    });
  }

  @override
  void initState() {
    super.initState();
    convertCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2), // Set background to #F2F2F2
      appBar: AppBar(
        title: Text(
            'Currency Converter',
          style: TextStyle(
            fontWeight: FontWeight.bold,   // Makes the text bold
            color: Color(0xFF1F2261),
          ),
        ),

        backgroundColor: Color(0xFFF2F2F2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Card(
              elevation: 4,
              color: Colors.white, // Set background color to white
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _buildCurrencyDropdown(fromCurrency, (val) {
                          setState(() => fromCurrency = val!);
                          convertCurrency();
                        }),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              setState(() => amount = double.tryParse(val) ?? 0);
                              convertCurrency();
                            },
                            controller: TextEditingController(text: amount.toStringAsFixed(2)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.swap_vert, size: 36, color: Color(0xFF1A237E)),
                        onPressed: swapCurrencies,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Converted Amount', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _buildCurrencyDropdown(toCurrency, (val) {
                          setState(() => toCurrency = val!);
                          convertCurrency();
                        }),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            readOnly: true,
                            controller: TextEditingController(text: convertedAmount.toStringAsFixed(2)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Indicative Exchange Rate',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1 ${fromCurrency} = ${(exchangeRates[toCurrency]! / exchangeRates[fromCurrency]!).toStringAsFixed(4)} ${toCurrency}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown(String value, void Function(String?) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        items: exchangeRates.keys.map((String currency) {
          return DropdownMenuItem<String>(
            value: currency,
            child: Row(
              children: [
                _getCurrencyFlag(currency),
                SizedBox(width: 8),
                Text(currency),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: SizedBox(),
      ),
    );
  }

  Widget _getCurrencyFlag(String currency) {
    // Mapping currency code to flag asset name
    String flagAsset = 'assets/${currency.toLowerCase()}.png'; // assuming your image names are like 'usd.png', 'eur.png'

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          flagAsset,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to a default image or icon in case the image is not found
            return Icon(Icons.flag, color: Colors.grey);
          },
        ),
      ),
    );
  }
  }