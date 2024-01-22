// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

class PullbackCalculation extends StatefulWidget {
  const PullbackCalculation({super.key});

  @override
  State<PullbackCalculation> createState() => _PullbackCalculationState();
}

class _PullbackCalculationState extends State<PullbackCalculation> {
  double differencePrice = 0;
  double onethirdPrice = 0;
  double halfPrice = 0;
  double twothirdPrice = 0;
  double onethird = 0;
  double half = 0;
  double twothird = 0;
  bool isUptrendCalc = true;
  final startPriceInput = TextEditingController();
  final currentPriceInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void reset() {
    setState(() {
      currentPriceInput.clear();
      startPriceInput.clear();
    });
  }

  void calcFibonacci() {}

  void calcPivotPoints() {}

  void calcUptrend() {
    if (currentPriceInput.text.isEmpty || startPriceInput.text.isEmpty) {
      return;
    }

    double spd = double.parse(startPriceInput.text);
    double cpd = double.parse(currentPriceInput.text);

    differencePrice = cpd - spd;
    onethird = differencePrice / 3;
    half = differencePrice / 2;
    twothird = (differencePrice) * (2 / 3);

    onethirdPrice = cpd - onethird;
    halfPrice = cpd - half;
    twothirdPrice = cpd - twothird;

    print("differencePrice : $differencePrice");
    print("onethird : $onethird");
    print("half : $half");
    print("twothird : $twothird");
    print("onethirdPrice : $onethirdPrice");
    print("halfPrice : $halfPrice");
    print("twothirdPrice : $twothirdPrice");

    setState(() {});
  }

  void calcDowntrend() {
    if (currentPriceInput.text.isEmpty || startPriceInput.text.isEmpty) {
      return;
    }

    double spd = double.parse(startPriceInput.text);
    double cpd = double.parse(currentPriceInput.text);

    differencePrice = spd - cpd;
    onethird = differencePrice / 3;
    half = differencePrice / 2;
    twothird = (differencePrice) * (2 / 3);

    onethirdPrice = cpd + onethird;
    halfPrice = cpd + half;
    twothirdPrice = cpd + twothird;

    print("differencePrice : $differencePrice");
    print("onethird : $onethird");
    print("half : $half");
    print("twothird : $twothird");
    print("onethirdPrice : $onethirdPrice");
    print("halfPrice : $halfPrice");
    print("twothirdPrice : $twothirdPrice");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "John Maggee Pullback Retracement Rule says after a considerable gain/loss a pullback will be followed by price trend 1/3 -> 50% -> and max 2/3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 94, 94),
                              fontSize: 14),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0))),
                          hintText: 'Enter Start Price',
                        ),
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.none,
                        controller: startPriceInput,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0))),
                          hintText: 'Enter End Price',
                        ),
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.none,
                        controller: currentPriceInput,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Is Profit Calculation"),
                            const SizedBox(width: 10),
                            Checkbox(
                              checkColor: Colors.white,
                              value: isUptrendCalc,
                              onChanged: (bool? value) {
                                setState(() {
                                  isUptrendCalc = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      calculateButton(context),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 40,
                        child: TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green)),
                            onPressed: () {
                              reset();
                            },
                            child: const Text(
                              "Reset Prices",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            )),
                      ),
                      const SizedBox(height: 25),
                      const Text("Calculations ->>"),
                      const SizedBox(height: 25),
                      calcWidget(),
                    ],
                  ),
                ))));
  }

  Widget calculateButton(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: 40,
        child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.green)),
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 148, 211, 151)),
            ),
            onPressed: () {
              if (isUptrendCalc) {
                calcUptrend();
              } else {
                calcDowntrend();
              }
            },
            child: const Text(
              "Calculate Prices",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 14),
            )));
  }

  Widget calcWidget() {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "1. Difference -> ₹${differencePrice.roundToDouble()}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "2. Start Price -> ₹${startPriceInput.text}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "3. End Price -> ₹${currentPriceInput.text}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Text(
            "4. 1/3 Amount -> ₹${onethird.roundToDouble()}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "5. 50% Amount -> ₹${half.roundToDouble()}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "6. 2/3 Amount -> ₹${twothird.roundToDouble()}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            "7. 1/3 Price -> ₹${onethirdPrice.roundToDouble()} (${onethirdPrice.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "8. 50% Price -> ₹${halfPrice.roundToDouble()} (${halfPrice.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "9. 2/3 Price -> ₹${twothirdPrice.roundToDouble()} (${twothirdPrice.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
