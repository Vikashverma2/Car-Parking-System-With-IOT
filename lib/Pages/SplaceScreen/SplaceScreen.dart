
import 'package:car_paking_system/Controller/SplaceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../ConstData.dart';
import '../../Controller/IotController.dart';

class Splace_Screen extends StatelessWidget {
  const Splace_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ParkingController1 parkingController1 = Get.put(ParkingController1());
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'Assets/animation/anmi2.json',
                      width: 350,
                    ),
                   
                  ],
                ),
                 SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CAR PARKING SYSTEM",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "This is a Car parking app for Smart car parking station. Here you can find Avalible slot and book your parking slot in a secured manner, anywhere, anytime.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
             SizedBox(height: 40),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("Assets/Photos/tit.png", width: 160,)


                // Text(
                //   "Made By ❤️ : $LeaderName",
                //   style: Theme.of(context).textTheme.labelSmall,
                // ),
              ],
            ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
