import 'package:flutter/material.dart';

snack(String text) {
  return SnackBar(
    backgroundColor: Colors.amber,
    behavior: SnackBarBehavior.floating,
    content: Text(text),
  );
}

// Widget enter_otp(BuildContext context) {
//   return Dialog(
//     child: Column(
//       children: [
//         Text('Enter OTP'),
//         SizedBox(
//           height: 20.0,
//         ),
//         TextFormField(
//           onChanged: (value) {},
//           decoration:
//               InputDecoration(labelText: 'OTP', hintText: 'Enter received OTP'),
//         ),
//       ],
//     ),
//   );
// }

enterdialog(BuildContext context) {
  String code;
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text('Enter OTP'),
      content: TextFormField(
        validator: (value) => value.isEmpty ? 'Required': null,
        onChanged: (value) => code=value,
        decoration: InputDecoration(
          labelText: 'OTP', hintText: 'Enter received OTP',
        ),
      ),
      actions: [
        FlatButton(onPressed: (){
          Navigator.of(context).pop(code);
        }, child: Text(
          'Submit'
        ))
      ],
    );
  },);
}
