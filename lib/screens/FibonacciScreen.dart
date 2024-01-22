import 'package:flutter/material.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  double level23 = 0;
  double level38 = 0;
  double level50 = 0;
  double level0618 = 0;
  double level76 = 0;
  double level786 = 0;
  double level1618 = 0;
  double level2618 = 0;

  double level3618 = 0;
  double level4236 = 0;
  double level1272 = 0;
  double level1414 = 0;
  double level2272 = 0;
  double level2414 = 0;
  double level2 = 0;
  double level3 = 0;
  double level3272 = 0;
  double level3414 = 0;
  double level4 = 0;
  double level4272 = 0;
  double level4414 = 0;
  double level4618 = 0;
  double level4764 = 0;

  bool isUptrendCalc = true;
  final startPriceInput = TextEditingController();
  final currentPriceInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void calcFibonacciUptrend() {
    if (currentPriceInput.text.isEmpty || startPriceInput.text.isEmpty) {
      return;
    }

    double lowPrice = double.parse(startPriceInput.text);
    double highPrice = double.parse(currentPriceInput.text);

    //23.6% Level = Low + 0.236 * (High - Low)
    level23 = lowPrice + 0.236 * (highPrice - lowPrice);
    level38 = lowPrice + 0.382 * (highPrice - lowPrice);
    level50 = (highPrice + lowPrice) / 2;
    level0618 = lowPrice + 0.618 * (highPrice - lowPrice);

    level786 = lowPrice + 0.786 * (highPrice - lowPrice);
    level1618 = lowPrice + 1.618 * (highPrice - lowPrice);
    level2618 = lowPrice + 2.618 * (highPrice - lowPrice);

    setState(() {});
  }

  void calcFibonacciDowntrend() {
    if (currentPriceInput.text.isEmpty || startPriceInput.text.isEmpty) {
      return;
    }

    double lowPrice = double.parse(startPriceInput.text);
    double highPrice = double.parse(currentPriceInput.text);

    //23.6% Level = Low + 0.236 * (High - Low)
    level23 = highPrice - 0.236 * (highPrice - lowPrice);
    level38 = highPrice - 0.382 * (highPrice - lowPrice);
    level50 = (highPrice + lowPrice) / 2;
    level0618 = highPrice - 0.618 * (highPrice - lowPrice);

    level786 = highPrice - 0.786 * (highPrice - lowPrice);
    level1618 = highPrice - 1.618 * (highPrice - lowPrice);
    level2618 = highPrice - 2.618 * (highPrice - lowPrice);

    level3618 = highPrice - 3.618 * (highPrice - lowPrice);
    level4236 = highPrice - 4.236 * (highPrice - lowPrice);
    level1272 = highPrice - 1.272 * (highPrice - lowPrice);
    level1414 = highPrice - 1.414 * (highPrice - lowPrice);
    level2272 = highPrice - 2.272 * (highPrice - lowPrice);
    level2414 = highPrice - 2.414 * (highPrice - lowPrice);
    level2 = highPrice - 2 * (highPrice - lowPrice);
    level3 = highPrice - 3 * (highPrice - lowPrice);
    level3272 = highPrice - 3.272 * (highPrice - lowPrice);
    level3414 = highPrice - 3.414 * (highPrice - lowPrice);
    level4 = highPrice - 4 * (highPrice - lowPrice);
    level4272 = highPrice - 4.272 * (highPrice - lowPrice);
    level4414 = highPrice - 4.414 * (highPrice - lowPrice);
    level4618 = highPrice - 4.618 * (highPrice - lowPrice);
    level4764 = highPrice - 4.764 * (highPrice - lowPrice);

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
                          "Fibonacci Levels Calculation - By given Start and End point we are calculating 6 levels of Fibonacci Projections.",
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
                          hintText: 'Enter Low Price',
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
                          hintText: 'Enter High Price',
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
                            const Text("Is Uptrend ⇧⇧ Calculation?"),
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
                            onPressed: () {},
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
                      calcWidget()
                    ],
                  ),
                ))));
  }

  Widget calcWidget() {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "1. 0 Level -> ₹${isUptrendCalc ? currentPriceInput.text : startPriceInput.text}",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "2. 0.236 Level -> ₹${level23.roundToDouble()} (${level23.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "3. 0.382 Level -> ₹${level38.roundToDouble()} (${level38.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Text(
            "4. 0.5 Level -> ₹${level50.roundToDouble()} (${level50.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "5. 0.618 Level -> ₹${level0618.roundToDouble()} (${level0618.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "6. 0.786 Level -> ₹${level786.roundToDouble()} (${level786.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            "7. 1.618 Level -> ₹${level1618.roundToDouble()} (${level1618.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "8. 2.618 -> ₹${level2618.roundToDouble()} (${level2618.toStringAsFixed(2)})",
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
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
                calcFibonacciDowntrend();
              } else {
                calcFibonacciUptrend();
              }
            },
            child: const Text(
              "Calculate Prices",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 14),
            )));
  }
}
