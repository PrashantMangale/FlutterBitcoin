import 'package:flutter/material.dart';
import 'package:flutter_bitcoin_assignment_prashant/common_widgets/SizedBoxWidget.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/AppStings.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/ColorExtension.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/CustomColors.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/ResponsiveUI.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  String strBitcoinValue = "500000";

  closePage() {
    Navigator.of(context).pop();
  }

  Widget pageContent() {
    return Container(
      width: ResponsiveUI.getWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: ResponsiveUI.getWidth(context),
                  height: 55,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    shape: BoxShape.rectangle,
                    color: CustomColors.colorGreyShade.toColor(),
                    border: Border.all(
                        color: CustomColors.colorHintText.toColor(),
                        width: 0.5),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        prefixIcon: const Image(
                            image: AssetImage('assets/images/ic_search.png')),
                        hintText: AppStrings.strSearchCrypto,
                        hintStyle: TextStyle(
                          color: CustomColors.colorHintText.toColor(),
                          fontSize: 13,
                        )),
                  ),
                ),
              ),
              SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 10),
              Container(
                height: 55,
                width: 85,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/ic_filter.png'),
                    ),
                    SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 10),
                    const Text(
                      AppStrings.strFilter,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBoxWidget.getSizeBox(SizedBoxType.heightOnly, 30),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.strCryptocurrency,
                style: TextStyle(
                    color: CustomColors.colorLabel.toColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 30),
              Text(
                AppStrings.strNft,
                style: TextStyle(
                    color: CustomColors.colorHintText.toColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 20),
          Container(
            height: 130,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: CustomColors.colorLightGreen.toColor(),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Image(
                            image: AssetImage('assets/images/ic_bitcoin.png'),
                            height: 50)),
                    Expanded(
                      child: Text(
                        '\$$strBitcoinValue',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const Positioned(
                  bottom: 0,
                  child: Image(
                      image: AssetImage('assets/images/ic_green_wave.png'),
                      height: 50),
                ),
              ],
            ),
          ),
          SizedBoxWidget.getSizeBox(SizedBoxType.heightOnly, 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 1,
                  child: Text(
                    AppStrings.strTopCryptocurrencies,
                    style: TextStyle(
                        color: CustomColors.colorLabel.toColor(),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
              Text(
                AppStrings.strViewAll,
                style: TextStyle(
                    color: CustomColors.colorHintText.toColor(),
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget bottomNavigationWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: const Text(
            AppStrings.strExchanges,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          actions: [
            const Image(
              image: AssetImage('assets/images/ic_notifications.png'),
              height: 18,
              width: 18,
            ),
            SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 10),
            const Image(
              image: AssetImage('assets/images/ic_settings.png'),
              height: 18,
              width: 18,
            ),
            SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 10),
          ],
        ),
        body: pageContent(),
        bottomNavigationBar: bottomNavigationWidget(),
      ),
      onWillPop: () => closePage(),
    );
  }
}
