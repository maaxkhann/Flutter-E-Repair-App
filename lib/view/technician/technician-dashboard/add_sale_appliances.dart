import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view-model/technician/add_sale_appliances_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddSaleAppliances extends StatefulWidget {
  const AddSaleAppliances({super.key});

  @override
  State<AddSaleAppliances> createState() => _AddSaleAppliancesState();
}

class _AddSaleAppliancesState extends State<AddSaleAppliances> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddSaaleAppliancesViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kButtonColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Technician Dashboard',
            style: kHead2White,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Add Sale Appliance',
                    style: kHead2Black,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  'Appliance name',
                  style: kBody1Black,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: ConstantTextField(
                      controller: nameController,
                      hintText: 'Enter Appliance Name'),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  'Appliance Price',
                  style: kBody1Black,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: ConstantTextField(
                      controller: priceController,
                      hintText: 'Enter Appliance Price'),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Center(
                  child: Text(
                    'Upload Image',
                    style: kBody1Black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: GestureDetector(
                    onTap: () => provider.pickImage(),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        width: Get.width * 0.5,
                        height: Get.height * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: kBlack)),
                        child: provider.image != null
                            ? Image.file(
                                provider.image!,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text(
                                'Choose Image',
                                style: kBody1Black,
                              )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.18,
                ),
                ConstantButton(
                    buttonName: 'Submit',
                    onTap: () => provider.addAppliance(
                        context,
                        nameController.text.trim(),
                        priceController.text.trim()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
