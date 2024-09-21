// <<<<<<<------ This code is only for check GetBuilder ------>>>>>>>
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controller/counter_controller.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'GetX GetBuilder Example',
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   // Create and initialize the controller using Get.put()
//   final CounterController counterController = Get.put(CounterController());
//
//   @override
//   Widget build(BuildContext context) {
//     // print(counterController);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GetX GetBuilder Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             // Using GetBuilder to listen to the controller and update the UI
//             GetBuilder<CounterController>(
//               builder: (controller) {
//                 return Text(
//                   '${controller.counter}', // Display the current counter value
//                   style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: counterController.increment,
//                   child: const Text("Increment"),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: counterController.decrement,
//                   child: const Text("Decrement"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// <<<<<<<------ This Code is for GetBuilder, Obx, Dependency Injection and Routing ------>>>>>>>
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/counter_controller.dart';
import 'controller/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX GetBuilder, Obx, Dependency Injection, Routing Example',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => PrimaryScreen(),),
        GetPage(name: '/details', page: () => DetailsScreen(),)
      ],
      home: HomeScreen(),
      //home: PrimaryScreen(),  // This line add only for check " Getx Routing "
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Create and initialize the controller using Get.put()
  final CounterController counterController = Get.put(CounterController());   // This is Dependency Injection

  @override
  Widget build(BuildContext context) {
    //print(counterController.counterGetBuilder);
    // print(counterController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade200,
        title: const Text('GetX GetBuilder Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            SizedBox(height: 20),

            // Using GetBuilder to listen to the controller and update the UI
            GetBuilder<CounterController>(
              builder: (controller) {
                return Text(
                  'GetBuilder Counter: ${counterController.counterGetBuilder}', // Display the current counter value
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 20),
            // Using Obx
            Obx(() => Text(
              'Obx Counter: ${counterController.counter}',
              style: TextStyle(fontSize: 20),
            )),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        backgroundColor: Colors.teal.shade200,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


// <<<<<<<------ This Below code only for " Getx Routing " ------>>>>>>>>
class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan.shade100,
        title: Text('Primary Screen'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/details');
          },
          child: Text('Go To Details'),),
      ),
    );
  }
}

// <<<<<<----- This Below code only for " Getx Routing " ----->>>>>>
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan.shade100,
        title: Text('Details Screen'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Go Back'),),
      ),
    );
  }
}

