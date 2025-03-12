import 'package:flutter/material.dart';
import 'package:journey_to_figueira/pages/base.dart';
import 'package:journey_to_figueira/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Uri _url = Uri.parse(
    'https://www.termsfeed.com/live/5c53fe36-b8f3-4ea1-893b-2cdbb83cdffa',
  );

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: buildTextAppbar(context, "Settings"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeight(context, 0.02),
                  buildContainerSettings(
                    context,
                    "Terms of services",
                    Icon(Icons.account_balance_rounded),
                  ),
                  buildHeight(context, 0.02),
                  buildContainerSettings(
                    context,
                    "Developer website",
                    Icon(Icons.account_balance_rounded),
                  ),
                  buildHeight(context, 0.02),
                  buildContainerSettings(
                    context,
                    "Terms of use ",
                    Icon(Icons.account_balance_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContainerSettings(BuildContext context, String text, Icon icon) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        width: double.infinity,
        height: height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kBlack,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontFamily: "Actor",
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Icon(icon.icon, color: kGold, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
