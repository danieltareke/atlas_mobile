import 'package:flutter/material.dart';

class UserAgreementButton extends StatelessWidget {
  final String msg;
  const UserAgreementButton({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Click ' +
                msg +
                ' to indicate that you have read and agreed to the below policy',
            style: TextStyle(
              height: 1.5,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Terms of service and privacy policy'),
          )
        ],
      ),
    );
  }
}
