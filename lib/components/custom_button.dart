import 'package:flutter/services.dart';
import 'package:socialmedia/utils/indexes.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color textColor, loadingColor;
  final borderColor;
  final fontSize;
  final fontWeight;
  final fontStyle;
  bool isLoading;
  final isLoadingText;
  EdgeInsets padding;

  // bool isGoogleSignup;
  // bool isLinkedInSignup;

  CustomButton({
     Key? key,
    this.padding = const EdgeInsets.symmetric(horizontal: 3.0),
    this.text = "Continue",
    this.fontSize = 13.0,
    this.fontWeight = FontWeight.w600,
    this.fontStyle = FontStyle.normal,
    required this.onTap,
    this.color = Colors.green,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.borderColor = Colors.white,
    this.isLoadingText,
    required this.loadingColor,
    // bool isGoogleSignup = false,
    // bool isLinkedInSignup = true,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTapDown: (_) => HapticFeedback.vibrate(),
      onTap: () {
        widget.onTap();
        setState(() {
          if (widget.isLoading != false) {
            widget.isLoading = true;
          } else {
            widget.isLoading = false;
          }
        });
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: widget.isLoading ? widget.color.withOpacity(.5) : widget.color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  widget.isLoading
                      ? widget.isLoadingText ?? "Loading..."
                      : widget.text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist',
                    ),

              ),
            ),
            widget.isLoading
                ? Container(
              margin: const EdgeInsets.only(left: 12),
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                valueColor: AlwaysStoppedAnimation(
                    widget.loadingColor),
              ),
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class CustomButton2 extends StatefulWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color textColor, loadingColor;
  final borderColor;
  final fontSize;
  final fontWeight;
  final fontStyle;
  bool isLoading;
  final isLoadingText;
  EdgeInsets padding;

  // bool isGoogleSignup;
  // bool isLinkedInSignup;

  CustomButton2({
    Key? key,
    this.padding = const EdgeInsets.symmetric(horizontal: 3.0),
    this.text = "Continue",
    this.fontSize = 13.0,
    this.fontWeight = FontWeight.w600,
    this.fontStyle = FontStyle.normal,
    required this.onTap,
    this.color = Colors.green,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.borderColor = Colors.white,
    this.isLoadingText,
    required this.loadingColor,
    // bool isGoogleSignup = false,
    // bool isLinkedInSignup = true,
  }) : super(key: key);

  @override
  _CustomButtonState2 createState() => _CustomButtonState2();
}

class _CustomButtonState2 extends State<CustomButton2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTapDown: (_) => HapticFeedback.vibrate(),
      onTap: () {
        widget.onTap();
        setState(() {
          if (widget.isLoading != false) {
            widget.isLoading = true;
          } else {
            widget.isLoading = false;
          }
        });
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: widget.isLoading ? widget.color.withOpacity(.5) : widget.color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: widget.borderColor ?? Colors.red,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.isLoading
                    ? widget.isLoadingText ?? "Loading..."
                    : widget.text,
                  textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Urbanist',
                ),

              ),
            ),
            widget.isLoading
                ? Container(
              margin: const EdgeInsets.only(left: 12),
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                valueColor: AlwaysStoppedAnimation(
                    widget.loadingColor),
              ),
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}