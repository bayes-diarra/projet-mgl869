import 'package:flutter/material.dart';
import 'package:scp/screens/Welcome/welcome_screen.dart';
import 'package:scp/screens/scan/scan_screen.dart';

import 'screens/login/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/scan/components/generate.dart';
import 'screens/scan/components/scan.dart';
import 'screens/common/accept_delivery.dart';
import 'screens/common/available_deliveries.dart';
import 'screens/common/get_product.dart';
import 'screens/common/homepage.dart';
import 'screens/common/send_delivery.dart';
import 'screens/common/send_delivery_request.dart';
import 'screens/deliver/deliverHome.dart';
import 'screens/deliver/serve_delivery.dart';
import 'screens/healthworker/healthworkerHome.dart';
import 'screens/manufacturer/add_product.dart';
import 'screens/manufacturer/manufacturerHome.dart';

import 'screens/patient/patientHome.dart';
import 'screens/wholesaler/wholesalerHome.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    //'/': (context) => Loading(),
    '/': (context) => WelcomeScreen(),
    //'/': (context) => MyApp(),
    '/signUp': (context) => SignUpScreen(),
    '/logIn': (context) => LoginScreen(),
    '/generate':(context) => GeneratePage(),
    '/scan':(context) => ScanPage(),
    '/scanPage': (context)=> ScanScreen(),
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
    '/send_delivery_request': (context) => SendDeliveryRequest(),
    '/serve_delivery': (context) => ServeDelivery(),
  },
));



