import 'package:flutter/material.dart';
import 'package:MedChain/model/Delivery.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/screens/common/accept_delivery.dart';
import 'package:MedChain/services/DeliveryService.dart';

class AvailableDeliveries extends StatefulWidget {
  final User user;
  AvailableDeliveries({Key key, this.user}) : super(key: key);
  @override
  _AvailableDeliveriesState createState() => _AvailableDeliveriesState();
}

class _AvailableDeliveriesState extends State<AvailableDeliveries> {
  DeliveryService service = DeliveryService();
  //List<Delivery> deliveries = await service.queryDeliveryRequest(widget.user);
  Future<List<Delivery>> getDeliveries() async {
    return await service.queryDeliveryRequest(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Deliveries'),
      ),
      body: Container(
        child: FutureBuilder(
            future: getDeliveries(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(snapshot.data[index].deliveryId);
                      return Card(
                          child: ListTile(
                        title: Text(
                            "DeliveryId: " + snapshot.data[index].deliveryId),
                        subtitle: Text("Date of delivery: " +
                            snapshot.data[index].dateOfDelivery),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => AcceptDelivery(
                                          user: widget.user,
                                          delivery: snapshot.data[index],
                                        )));
                          },
                        ),
                      ));
                    });
              }
            }),
      ),
    );
  }
}
