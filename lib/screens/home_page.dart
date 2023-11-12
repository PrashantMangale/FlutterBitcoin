import 'package:flutter/material.dart';
import 'package:flutter_bitcoin_assignment_prashant/common_widgets/bottom_nav_item.dart';
import 'package:flutter_bitcoin_assignment_prashant/common_widgets/crypto_single_item.dart';
import 'package:flutter_bitcoin_assignment_prashant/common_widgets/sized_box_widget.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/AppStings.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/ColorExtension.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/CustomColors.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/ResponsiveUI.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/msg_controller.dart';
import 'package:flutter_bitcoin_assignment_prashant/models/top_crypto_currencies_model/top_crypto_currencies.dart';
import 'package:flutter_bitcoin_assignment_prashant/network/ApiHandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  List<String> listFilterApiKeys = ["", "price", "volume_24h"];
  List<String> listFilters = [AppStrings.strFilter, "Price", "Volume24h"];
  List<CryptoCurrency> listCryptoCurrency = [];
  int totalUsd = 0;
  int currentBottomNavSelected = 1;

  String strBitcoinValue = "500000";
  String selectedFilter = "";
  int selectedFilterPos = 0;

  bool isDataLoading = false;

  closePage() {
    Navigator.of(context).pop();
  }

  setDataLoading(bool status) {
    if (mounted) {
      setState(() {
        isDataLoading = status;
      });
    }
  }

  setBottomNavItemSelected(int pos) {
    if (mounted) {
      setState(() {
        currentBottomNavSelected = pos;
      });
    }
  }

  resetFilter() {
    if (mounted) {
      setState(() {
        selectedFilterPos = 0;
        selectedFilter = listFilters[selectedFilterPos];
      });
    }
  }

  filterWidget() {
    return PopupMenuButton(
      child: Container(
        height: 55,
        width: 90,
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
            Text(
              selectedFilter,
              softWrap: true,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
      onSelected: (value) {
        if (mounted) {
          setState(() {
            selectedFilter = listFilters[value];
            selectedFilterPos = value;
          });
          callGetCryptoCurrencyAPI();
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 1,
            child: Text('Price',
                style: TextStyle(color: Colors.black, fontSize: 13)),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('Volume 24H',
                style: TextStyle(color: Colors.black, fontSize: 13)),
          ),
        ];
      },
    );
  }

  Widget pageContent() {
    return Container(
      width: ResponsiveUI.getWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
              filterWidget(),
            ],
          ),
          SizedBoxWidget.getSizeBox(SizedBoxType.heightOnly, 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
            height: 150,
            width: ResponsiveUI.getWidth(context),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: CustomColors.colorGreyShade.toColor(),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBoxWidget.getSizeBox(SizedBoxType.heightOnly, 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/images/ic_bitcoin.png'),
                          // height: 50,
                        )),
                    SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 100),
                    Expanded(
                      child: Text(
                        '\$$totalUsd USD',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Image(
                    image: const AssetImage('assets/images/ic_green_wave.png'),
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                    width: ResponsiveUI.getWidth(context),
                    height: 60),
              ],
            ),
          ),
          SizedBoxWidget.getSizeBox(SizedBoxType.heightOnly, 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBoxWidget.getSizeBox(SizedBoxType.heightOnly, 10),
          isDataLoading
              ? const Center(child: CircularProgressIndicator())
              : listCryptoCurrency.isEmpty
                  ? const Center(
                      child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 20),
                    ))
                  : cryptoCurrencyListWidget()
        ],
      ),
    );
  }

  Widget cryptoCurrencyListWidget() {
    // return SizedBoxWidget.getShrink();
    return ListView.builder(
      itemCount: listCryptoCurrency.length,
      primary: false,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        CryptoCurrency cryptoCurrency = listCryptoCurrency[index];
        return CryptoSingleItem(cryptoCurrency: cryptoCurrency);
      },
    );
  }

  Widget bottomNavigationWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon:
                  BottomNavItem(iconName: 'assets/images/ic_bottom_eshop.png'),
              label: AppStrings.strBottomNavEShop,
              tooltip: AppStrings.strBottomNavEShop),
          BottomNavigationBarItem(
              icon: BottomNavItem(
                  iconName: 'assets/images/ic_bottom_exchange.png'),
              label: AppStrings.strExchanges,
              tooltip: AppStrings.strExchanges),
          BottomNavigationBarItem(
              icon: BottomNavItem(
                  iconName: 'assets/images/ic_bottom_exchange.png'),
              label: ""),
          BottomNavigationBarItem(
              icon: BottomNavItem(
                  iconName: 'assets/images/ic_bottom_launchpads.png'),
              label: AppStrings.strBottomNavLaunchPad,
              tooltip: AppStrings.strBottomNavLaunchPad),
          BottomNavigationBarItem(
              icon:
                  BottomNavItem(iconName: 'assets/images/ic_bottom_wallet.png'),
              label: AppStrings.strBottomNavWallet,
              tooltip: AppStrings.strBottomNavWallet),
        ],
        onTap: (value) {
          setBottomNavItemSelected(value);
        },
        currentIndex: currentBottomNavSelected,
        elevation: 10,
        selectedFontSize: 10,
        selectedLabelStyle: const TextStyle(fontSize: 13, color: Colors.white),
        unselectedLabelStyle: TextStyle(
            fontSize: 12,
            color: CustomColors.colorBottomNavDeSelected.toColor()),
        selectedItemColor: Colors.white,
        unselectedItemColor: CustomColors.colorBottomNavDeSelected.toColor(),
      ),
    );
  }

  callGetCryptoCurrencyAPI() {
    try {
      if ((selectedFilter.toLowerCase() == AppStrings.strFilter)) {
        resetFilter();
      }
      String filter = listFilterApiKeys[selectedFilterPos - 1];
      setDataLoading(true);
      ApiHandler.callGetTopCryptoCurrencyAPI(filter).then((value) {
        setDataLoading(false);
        var json = ApiHandler.getDecodedResponse(value.body);
        print(json);
        if (json != null) {
          TopCryptoCurrencies topCryptoCurrencies =
              TopCryptoCurrencies.fromJson(json);
          if (topCryptoCurrencies.status != null &&
              topCryptoCurrencies.data != null &&
              topCryptoCurrencies.status!.errorCode == 0) {
            if (mounted) {
              setState(() {
                listCryptoCurrency = topCryptoCurrencies.data ?? [];
                totalUsd = 0;
                for (CryptoCurrency currency in listCryptoCurrency) {
                  totalUsd += currency.quote!.uSD!.price!.round();
                }
              });
              // MsgController.showMessage('Size: ${listCryptoCurrency.length}');
            }
            // print('Size: ${listCryptoCurrency.length}');
          } else {
            MsgController.showMessage(
                topCryptoCurrencies.status!.errorMessage ??
                    AppStrings.strMsgSomethingWrong);
          }
        }
      });
    } catch (e) {
      setDataLoading(false);
    }
  }

  @override
  void initState() {
    super.initState();
    resetFilter();
    callGetCryptoCurrencyAPI();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white60,
          centerTitle: false,
          title: const Text(
            AppStrings.strExchanges,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          actions: [
            const Image(
              image: AssetImage('assets/images/ic_notifications.png'),
              semanticLabel: AppStrings.strNotifications,
              // height: 18,
              // width: 18,
            ),
            SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 10),
            const Image(
              image: AssetImage('assets/images/ic_settings.png'),
              semanticLabel: AppStrings.strNotifications,
              // height: 18,
              // width: 18,
            ),
            SizedBoxWidget.getSizeBox(SizedBoxType.widthOnly, 10),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Future.delayed(Duration.zero, () {
              resetFilter();
              callGetCryptoCurrencyAPI();
            });
          },
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              primary: true,
              physics: const AlwaysScrollableScrollPhysics(),
              child: pageContent(),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: ResponsiveUI.getWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              bottomNavigationWidget(),
              const Positioned(
                bottom: 0,
                top: -25,
                width: 200,
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/ic_bottom_globe.png')),
              )
            ],
          ),
        ),
      ),
      onWillPop: () => closePage(),
    );
  }
}
