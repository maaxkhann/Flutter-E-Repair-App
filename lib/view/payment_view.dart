import 'package:credit_card_form/credit_card_form.dart';
import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/feedback_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  CreditCardController cardController = CreditCardController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Pay Now',
          style: kHead1Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CreditCardForm(
              controller: cardController,
              theme: CreditCardLightTheme(),
              onChanged: (CreditCardResult result) {
                print(result.cardNumber);
                print(result.cardHolderName);
                print(result.expirationMonth);
                print(result.expirationYear);
                print(result.cardType);
                print(result.cvc);
              },
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            ConstantButton(
                buttonName: 'Pay Now',
                onTap: () => Get.off(() => const FeedBackView()))
          ],
        ),
      ),
    ));
  }
}
