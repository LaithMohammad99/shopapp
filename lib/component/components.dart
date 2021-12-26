import 'package:flutter/material.dart';

void navigatTo(context, widgt) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widgt,
      ),);

void navigatToAndDelete(context, widgt) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) => widgt,
    ), (route) => false);

Widget defaultFormField({
  @required String? label,
  @required IconData? preIcon,
  @required TextEditingController? controller,
  @required TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  @required Function? validate,
  IconData? suFix,
  bool ?obText ,
  Function? suffpreesd,

}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(preIcon),
        suffixIcon: IconButton(
          icon: Icon(suFix),
          onPressed: () {
            suffpreesd;
          },
        ),
        //suffixIcon: Icon(Icons.edit)
      ),
      keyboardType: type,
      onFieldSubmitted: (value) {
        onSubmit;
      },
      onChanged: (value) {
        onChange;
      },
      validator: (value) {
        return validate!(value);
      },
      obscureText: obText!,
    );

Widget defaultButton(
    {
      double width = double.infinity,
      Color background = Colors.blue,
      bool isUpperCase = true,
      double radius = 15.0,
      @required Function? function,
      @required String? text,
    }) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      width: width,
      height: 40,
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
