import 'package:flutter/material.dart';
import 'package:cafe_library_services/Report%20Damage/write_form.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ReportDamage(),
    ),
  );
}

class ReportDamage extends StatefulWidget {
  const ReportDamage({Key? key}) : super(key: key);

  @override
  State<ReportDamage> createState() => _ReportDamageState();
}

class _ReportDamageState extends State<ReportDamage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Damage'),
        automaticallyImplyLeading: false,
        actions: [ //use 'leading' to make it appear on the left
          IconButton(
            icon: Icon(Icons.person),
            onPressed: (){
              //go to profile
            },
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: const Icon(Icons.emoji_people, size: 50),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black12),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'Books have a profound impact on individuals'
                            ' and societies, shaping thoughts, fostering creativity, and'
                            ' preserving cultural heritage. They are a timeless and'
                            ' versatile medium for the expression and transmission of'
                            ' ideas.',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: WriteForm()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}