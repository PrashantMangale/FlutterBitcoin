import 'package:flutter/material.dart';
import 'package:flutter_bitcoin_assignment_prashant/common_widgets/sized_box_widget.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/ColorExtension.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/CustomColors.dart';
import 'package:flutter_bitcoin_assignment_prashant/models/top_crypto_currencies_model/top_crypto_currencies.dart';
import 'package:flutter_bitcoin_assignment_prashant/network/ApiHandler.dart';

import '../constants/ResponsiveUI.dart';

class CryptoSingleItem extends StatefulWidget {
  final CryptoCurrency? cryptoCurrency;

  const CryptoSingleItem({super.key, this.cryptoCurrency});

  @override
  State<StatefulWidget> createState() => _CryptoItem();
}

class _CryptoItem extends State<CryptoSingleItem> {
  CryptoCurrency? cryptoCurrency;
  int cryptoId = -1;
  String strLogoUrl = "";
  double price = 0;
  double percentDrop = 0;

  bool isLogoLoading = false;

  setLogoLoading(bool status) {
    if (mounted) {
      setState(() {
        isLogoLoading = status;
      });
    }
  }

  callGetCryptoCurrencyLogoAPI() {
    setLogoLoading(true);
    ApiHandler.callGetCryptoDataByIdAPI(cryptoId).then((value) {
      setLogoLoading(false);
      var json = ApiHandler.getDecodedResponse(value.body);
      if (json != null) {
        var data = json["data"];
        if (data != null) {
          String logo = data["$cryptoId"]["logo"] ?? "";
          // print(logo);
          if (mounted) {
            setState(() {
              strLogoUrl = logo;
            });
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        cryptoCurrency = widget.cryptoCurrency;
        // print(cryptoCurrency!.toJson());
        cryptoId = cryptoCurrency!.id ?? -1;
        price = cryptoCurrency!.quote!.uSD!.price ?? 0;
        percentDrop =
            cryptoCurrency!.quote!.uSD!.percentChange24h!.roundToDouble();
      });
      if (cryptoId != -1) {
        callGetCryptoCurrencyLogoAPI();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUI.getWidth(context),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: CustomColors.colorGreyShade.toColor(), width: 1))),
      height: 60,
      // color: Colors.lightBlue,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(strLogoUrl))),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cryptoCurrency!.symbol!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 20),
                    cryptoCurrency!.quote!.uSD!.volumeChange24h == null
                        ? SizedBoxWidget.getShrink()
                        : (cryptoCurrency!.quote!.uSD!.volumeChange24h! < 0)
                            ? const Image(
                                image:
                                    AssetImage('assets/images/ic_red_down.png'))
                            : const Image(
                                image: AssetImage(
                                    'assets/images/ic_green_up.png')),
                    Expanded(
                        child: Text(
                      '\$${price.round()} USD',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      cryptoCurrency!.name!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: CustomColors.colorLightGrey.toColor(),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    Text(
                      percentDrop > 0 ? '+$percentDrop%' : '$percentDrop%',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color:
                            (cryptoCurrency!.quote!.uSD!.volumeChange24h! < 0)
                                ? CustomColors.colorRed.toColor()
                                : CustomColors.colorGreen.toColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ]),
    );
  }
}
