import 'package:dateandtime/function/esewa.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String referenceId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Esewa Khalti Payment SDK testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
              Esewa esewa = Esewa();
              esewa.pay();
            }, child: Text('Pay by eSewa')
            
            ),

             ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
              onPressed: () {
                payWithKhalti();
            }, child: Text('Pay by Khalti')
            
            ),
            Text(referenceId)
            
          ],
        ),
      ),
    );
  }
payWithKhalti(){
  KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 10000, 
        productIdentity: "Mobile",
        productName: "Iphone 20"),
      preferences: [
        PaymentPreference.khalti
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel);
  }

   void onSuccess(PaymentSuccessModel success){
        showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text("Payment Successful"),
          actions: [
            SimpleDialogOption(child: const Text("Ok"),
            onPressed: () {
              setState(() {
                referenceId = success.idx;
              });
              Navigator.pop(context);
            },
            )
          ],
          );
        });
      }


  void onFailure(PaymentFailureModel failure){
    debugPrint(failure.toString());
    showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text("Payment Failed"),
          actions: [
            SimpleDialogOption(child: const Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
            )
          ],
          );
        });
  }

  void onCancel(){
    showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text("Payment Cancelled"),
          actions: [
            SimpleDialogOption(child: const Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
            )
          ],
          );
        });
  }
  }