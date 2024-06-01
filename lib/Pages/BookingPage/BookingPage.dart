
import 'package:car_paking_system/Controller/IotController.dart';
import 'package:car_paking_system/Controller/ParkingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Components/Timmer.dart';

class BookingPage extends StatelessWidget {
  final String slotName;
  final String slotId;
  const BookingPage({super.key, required this.slotId, required this.slotName});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    ParkingController1 parkingController1 = Get.put(ParkingController1());
    TextEditingController nameController = TextEditingController();
    TextEditingController vehicalNumberController = TextEditingController();

    RxString fromTime = "10:00 AM".obs;
    RxString toTime = "10:30 AM".obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'Assets/animation/dadacar.json',
                    width: 350,
                                 
                  ),
                ],
              ),

              const Row(
                children: [
                  Text(
                    "Enter your name ",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter Vehicle Number ",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: vehicalNumberController,
                      decoration: InputDecoration(
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.car_rental,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: "BR 00 XXXX",
                         hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              // const Row(
              //   children: [
              //     Text(
              //       "Choose Slot Time (in Minuits)",
              //     )
              //   ],
              // ),
              // const SizedBox(height: 20),
              // TimerTile(
              //   fromTime: fromTime,
              //   toTime: toTime,
              // ),
              Row(
                children: [Text("Choose Slot Time (in Minutes)")],
              ),
              SizedBox(height: 10),
              Obx(
                () => Slider(
                  mouseCursor: MouseCursor.defer,
                  thumbColor: Theme.of(context).colorScheme.primary,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Theme.of(context).colorScheme.background,
                  label: "${parkingController.time.value} m",
                  value: parkingController.time.value,
                  onChanged: (v) {
                    parkingController.time.value = v;
                    parkingController.amount.value = v * 1;
                  },
                  divisions: 6,
                  min: 30,
                  max: 210,
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("30"),
                    Text("60"),
                    Text("90"),
                    Text("120"),
                    Text("150"),
                    Text("180"),
                    Text("210"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Slot Name",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        slotName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Amount to Be Pay"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.currency_rupee_sharp, size: 40,  color: Theme.of(context).colorScheme.primary,),
                          Obx(
                            () => Text(
                              "${parkingController.amount.value.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // BookedPopup(context);

                      parkingController1.bookSlot(
                          nameController.text,
                          vehicalNumberController.text,
                          slotId,
                          context,
                          parkingController.time.value,
                          parkingController.amount.value.toString());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "BOOK NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
