import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  double idrAmount = 0.0;
  double usdAmount = 0.0;
  double eurAmount = 0.0;
  double jpyAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'IDR'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  idrAmount = double.tryParse(value) ?? 0.0;
                  usdAmount = idrAmount /
                      15000; // Ganti nilai konversi sesuai kebutuhan
                  eurAmount = idrAmount /
                      17000; // Ganti nilai konversi sesuai kebutuhan
                  jpyAmount =
                      idrAmount / 140; // Ganti nilai konversi sesuai kebutuhan
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Hasil Konversi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'USD: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${usdAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'EUR: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${eurAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'JPY: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${jpyAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class TimeConverterScreen extends StatefulWidget {
  @override
  _TimeConverterScreenState createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  DateTime _selectedTime = DateTime.now();
  String _wibTime = '';
  String _witTime = '';
  String _witaTime = '';
  String _londonTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Waktu:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Pilih Waktu'),
            ),
            SizedBox(height: 20),
            Text('Waktu Terpilih: $_selectedTime'),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'WIB: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: _wibTime,
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'WIT: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: _witTime,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'WITA: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: _witaTime,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'London: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: _londonTime,
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Perform time zone conversions here
        _wibTime = _convertToTimeZone(_selectedTime, 7); // WIB: UTC+7
        _witTime = _convertToTimeZone(_selectedTime, 9); // WIT: UTC+9
        _witaTime = _convertToTimeZone(_selectedTime, 8); // WITA: UTC+8
        _londonTime = _convertToTimeZone(_selectedTime, 0); // London: UTC+0
      });
    }
  }

  String _convertToTimeZone(DateTime dateTime, int timeZoneOffset) {
    final convertedTime = dateTime.toUtc().add(Duration(hours: timeZoneOffset));
    return convertedTime.toString();
  }
}


// ... kode dari kelas TimeConverterScreen dan CurrencyConverterScreen

class CurrencyAndTimeConverterScreen extends StatefulWidget {
  @override
  _CurrencyAndTimeConverterScreenState createState() =>
      _CurrencyAndTimeConverterScreenState();
}

class _CurrencyAndTimeConverterScreenState
    extends State<CurrencyAndTimeConverterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Mata Uang & Waktu'),
        backgroundColor: Colors.greenAccent[700],
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Konversi Waktu'),
            Tab(text: 'Konversi Mata Uang'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TimeConverterScreen(),
          CurrencyConverterScreen(),
        ],
      ),
    );
  }
}
