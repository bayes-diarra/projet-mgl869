import 'package:flutter/material.dart';
import 'Screens/common/accept_delivery.dart';
import 'Screens/common/available_deliveries.dart';
import 'Screens/common/get_product.dart';
import 'Screens/common/homepage.dart';
import 'Screens/common/loading.dart';
import 'Screens/common/send_delivery.dart';
import 'Screens/common/send_delivery_request.dart';
import 'Screens/deliver/deliverHome.dart';
import 'Screens/deliver/serve_delivery.dart';
import 'Screens/healthworker/healthworkerHome.dart';
import 'Screens/manufacturer/add_product.dart';
import 'Screens/manufacturer/manufacturerHome.dart';
import 'Screens/my_app.dart';
import 'Screens/patient/patientHome.dart';
import 'Screens/wholesaler/wholesalerHome.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/app',
  routes: {

    '/': (context) => Loading(),
    '/app': (context) => MyApp(),
    //'/welcome_screen': (context) => WelcomeScreen(),
    '/homepage': (context) => HomePage(),
    '/patient': (context) => PatientHome(),
    '/manufacturer': (context) => ManufacturerHome(),
    '/wholesaler': (context) => WholesalerHome(),
    '/healthworker': (context) => HealthworkerHome(),
    '/deliver': (context) => DeliverHome(),
    '/accept_delivery': (context) => AcceptDelivery(),
    '/add_product': (context) => AddProduct(),
    '/get_product': (context) => GetProduct(),
    '/available_deliveries': (context) => AvailableDeliveries(),
    '/send_delivery': (context) => SendDelivery(),
    '/send_delivery_request': (context) => SendDeliveyRequest(),
    '/serve_delivery': (context) => ServeDelivery(),
  },
));



