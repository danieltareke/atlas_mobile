import 'package:flutter/material.dart';

class AtlasElevatedButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onSubmit;
  const AtlasElevatedButton(
      {Key? key, required this.buttonTitle, required this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 1.0,
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onSubmit,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(buttonTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ),
        ),
      ),
    );
  }
}
