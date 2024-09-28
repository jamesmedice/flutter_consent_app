import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_text.dart';
import '../widgets/qr_code.dart';
import '../constants/app_colors.dart';
import '../l18n.dart';

class QRCodeConsent extends StatefulWidget {
  final SharedPreferences _prefs;
  final String scannedData;

  QRCodeConsent(this._prefs, this.scannedData);

  @override
  _QRCodeConsentState createState() => _QRCodeConsentState();
}

class _QRCodeConsentState extends State<QRCodeConsent> {
 
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.drawerHeaderBackground,
              ),
              child: CustomText(
                text: labels?.translate('app.name') ?? 'Consent',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
          ),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: QRCode(
                    qrSize: 150,
                    qrData: widget.scannedData,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
