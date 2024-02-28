import 'package:estate_flutter_app/feature/constant/color/estate_color.dart';
import 'package:estate_flutter_app/feature/constant/string/estate_string.dart';
import 'package:estate_flutter_app/feature/core/service/app_service.dart';
import 'package:estate_flutter_app/feature/widget/custom_screen.dart';
import 'package:estate_flutter_app/feature/widget/esetate_listing_property_card.dart';
import 'package:estate_flutter_app/feature/widget/estate_contact_card.dart';
import 'package:estate_flutter_app/feature/widget/estate_outlined_button.dart';
import 'package:estate_flutter_app/feature/widget/estate_property_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EstateColor estateColor = EstateColor();
  AppService appService = AppService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EstateOutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomScreen()));
                },
                text: EstateString.appTitleText),
            EstatePropertyCard(
              detailButton: EstateOutlinedButton(
                iconData: Icons.home_outlined,
                onPressed: () {
                  appService.logoutUser(context, '/login');
                },
                text: EstateString.appTitleText,
              ),
            ),
            const EstateListingPropertyCard(),
            const EstateContactCard(),
          ],
        ),
      ),
    );
  }
}
