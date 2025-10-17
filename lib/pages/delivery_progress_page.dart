import 'package:app_tesing/components/my_receipt.dart';
import 'package:app_tesing/models/restaurant.dart';
import 'package:app_tesing/services/database/firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  // get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Deliver in Progress..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  // Custom Bottom Nav Bar - Message / Call delivery driver
  Widget _buildBottomNavBar(BuildContext content) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(content).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(content).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_rounded,
                  color: Theme.of(content).colorScheme.inversePrimary),
            ),
          ),
          SizedBox(
            width: 10,
          ),

          // Driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "build ",//TODO: add driver name
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(content).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(content).colorScheme.primary,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              // message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(content).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                  ),
                  color: Theme.of(content).colorScheme.primary,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(content).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
