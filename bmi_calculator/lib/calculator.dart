import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

enum WeightType { kg, pound }

enum HeightType { cm, meter, feetInch }

class _CalculatorState extends State<Calculator> {
  final kgCtr = TextEditingController();
  final poundCtr = TextEditingController();
  final cmCtr = TextEditingController();
  final meterCtr = TextEditingController();
  final feetCtr = TextEditingController();
  final inchCtr = TextEditingController();

  String bmiResult = "";
  String category = "";
  Color bgColor = Colors.white;

  WeightType weightType = WeightType.kg;
  HeightType heightType = HeightType.cm;

  // pound(LB) to kg
  double? poundToKg() {
    double? pound = double.tryParse(poundCtr.text.trim());
    if (pound == null || pound <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid input: pound")));
      return null;
    }
    return (pound * 0.45359237);
  }

  ///       cm to Meter
  double? cmToMeter() {
    double? cm = double.tryParse(cmCtr.text.trim());
    if (cm == null || cm <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid Input: cm")));
      return null;
    }
    return cm / 100;
  }

  ///     feet/inch to meter
  double? feetInchToMeter() {
    double? feet = double.tryParse(feetCtr.text.trim());
    double? inch = double.tryParse(inchCtr.text.trim());
    if (feet == null || feet <= 0 || inch == null || inch < 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid input: feet or inch")));
      return null;
    }
    double totalInch = (feet * 12) + inch;
    if (totalInch == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid input: totalInch")));
      return null;
    }
    return totalInch * 0.0254;
  }

  ///             meter validate
  double? meterValid() {
    double? meter = double.tryParse(meterCtr.text.trim());
    if (meter == null || meter <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid input: meter")));
      return null;
    }
    return meter;
  }

  ///             kg validate
  double? kgValid() {
    double? kg = double.tryParse(kgCtr.text.trim());
    if (kg == null || kg <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid input: kg")));
      return null;
    }
    return kg;
  }

  // set category and color
  void setCateogrycolor(double bmi) {
    if (bmi < 18.5) {
      category = "UnderWeight";
      bgColor = Colors.blue;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      category = "Normal";
      bgColor = Colors.green;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      category = "OverWeight";
      bgColor = Colors.orange;
    } else if (bmi >= 30.0) {
      category = "Obsee";
      bgColor = Colors.red;
    }
  }

  ///         final calculation in void
  void calculate() {
    final double? m;
    if (heightType == HeightType.cm) {
      m = cmToMeter();
    } else if (heightType == HeightType.meter) {
      m = meterValid();
    } else if (heightType == HeightType.feetInch) {
      m = feetInchToMeter();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid input: meter")));
      return;
    }

    final double? kg = (weightType == WeightType.kg) ? kgValid() : poundToKg();
    if (m == null || kg == null) return;
    final double bmi = kg / (m * m);

    setCateogrycolor(bmi); // call to add category and color

    setState(() {
      bmiResult = bmi.toStringAsFixed(1);
    });
  }

  @override
  void dispose() {
    super.dispose();
    kgCtr.dispose();
    poundCtr.dispose();
    cmCtr.dispose();
    meterCtr.dispose();
    feetCtr.dispose();
    inchCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            //                                Weight unit
            Text(
              "Weight unit",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            //                                Weight unit segemnted button
            SegmentedButton(
              segments: [
                const ButtonSegment(value: WeightType.kg, label: Text("KG")),
                const ButtonSegment(
                  value: WeightType.pound,
                  label: Text("Pound"),
                ),
              ],
              selected: {weightType},
              onSelectionChanged: (value) => setState(() {
                weightType = value.first;
              }),
            ),
            SizedBox(height: 16),
            //                                Weight unit-> input Form
            //                                Weight unit Form--> kg
            if (weightType == WeightType.kg) ...[
              TextFormField(
                controller: kgCtr,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ]
            //                                Weight unit Form--> pound
            else if (weightType == WeightType.pound) ...[
              TextFormField(
                controller: poundCtr,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: "Weight (lb)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
            SizedBox(height: 8),

            Text(
              "Height unit",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            //                                height unit
            SizedBox(height: 8),
            SegmentedButton(
              segments: [
                const ButtonSegment(value: HeightType.cm, label: Text("Cm")),
                const ButtonSegment(
                  value: HeightType.meter,
                  label: Text("meter"),
                ),
                const ButtonSegment(
                  value: HeightType.feetInch,
                  label: Text("feet/inch"),
                ),
              ],
              selected: {heightType},
              onSelectionChanged: (value) => setState(() {
                heightType = value.first;
              }),
            ),
            SizedBox(height: 16),

            //                          Height unit-> form field with condition
            if (heightType == HeightType.cm) ...[
              //                                Height unit--> cm
              TextFormField(
                controller: cmCtr,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: "Height (cm)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ]
            //                                Height unit--> meter
            else if (heightType == HeightType.meter) ...[
              TextFormField(
                controller: meterCtr,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: "Height (m)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ]
            //                                Weight unit--> feet/inch
            else ...[
              Row(
                children: [
                  Expanded(
                    // feet
                    child: TextFormField(
                      controller: feetCtr,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: "feet(')",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    // inch
                    child: TextFormField(
                      controller: inchCtr,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: "Inch (\")",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 16),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],
                foregroundColor: Colors.black,
              ),
              child: Text("Calculate BMI"),
            ),

            SizedBox(height: 24),
            if (bmiResult.isNotEmpty)
              Card(
                elevation: 4,
                color: bgColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Your BMI: $bmiResult",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Chip(
                        label: Text(
                          category,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        // backgroundColor: bgColor,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
