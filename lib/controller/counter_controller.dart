// <<<<<<<------ This CounterController Code is only for GetBuilder ------>>>>>>>
// import 'package:get/get.dart';
//
// class CounterController extends GetxController {
//   int counter = 0;
//
//   // Method to increment the counter
//   void increment() {
//     counter++;
//     update(); // This tells GetBuilder to rebuild the UI
//   }
//
//   // Method to decrement the counter
//   void decrement() {
//     counter--;
//     update(); // This also tells GetBuilder to rebuild the UI
//   }
// }


// <<<<<<<------ This CounterController Code is for GetBuilder, Obx, Dependency Injection and Routing ------>>>>>>>
import 'package:get/get.dart';

// This is the controller class.
class CounterController extends GetxController {
  // Using RxInt for Obx, and a regular integer for GetBuilder.
  var counter = 0.obs; // RxInt for Obx
  int counterGetBuilder = 0;

  // Method to increment both counters.
  void increment() {
    counter++; // For Obx
    counterGetBuilder++; // For GetBuilder
    update(); // Update GetBuilder's widget
  }
}