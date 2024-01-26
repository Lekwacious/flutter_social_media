import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia/components/space_widget.dart';
import 'package:socialmedia/utils/indexes.dart';

import '../controller/auth_controller/signup_controller.dart';
import 'app_colors.dart';








class FormTextField1 extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) validator;
  final bool isPassWordField;
  final String hintText;
  final Color errorBorder;
  final Color focusErrorBorder;
  final TextEditingController controller;
  final bool addMargin;
  final Color fillcolor;
  final errortxtclr;
  final String? errortxt;
  final int? maxLength;
  final readOnly;
  final bool isEdu;
  final Function(String) onChange;
  // final dynamic Function() onChangeForColor;
  final String image;


  const FormTextField1({super.key,
    this.labelText = "",
    required this.textInputAction,
    this.addMargin = true,
    this.textInputType = TextInputType.name,
    this.hintText = "",
    this.isPassWordField = false,
    this.textCapitalization = TextCapitalization.words,
    required this.validator,
    required this.controller,
    this.errorBorder = Colors.red,
    this.focusErrorBorder = Colors.red,
    this.fillcolor = Colors.grey,
    this.errortxtclr = Colors.red,
    this.readOnly = false,
    this.isEdu = false,
    this.errortxt,
    required this.image,
    required this.onChange,
    // required this.onChangeForColor,
    this.maxLength,
  });

  @override
  _FormTextFieldState1 createState() => _FormTextFieldState1();
}

class _FormTextFieldState1 extends State<FormTextField1> {
  bool _obscureText = true;

  FocusNode _focusNode = FocusNode();

  // Adds initialization and disposal to _focusNode
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the password visibility
  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var passwordVisibilityToggle = GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 48,
        height: 44,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        margin: const EdgeInsets.only(left: 14.0),
        child: Center(
          child: GestureDetector(
            onTap: _toggle,
            child: FaIcon(
              _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 14,
              color: appInactive2Color,
            ),
          ),
        ),
      ),
    );
var controller = Get.put(SignupController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset(widget.image,
        // width: 39,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: TextFormField(
            //readOnly: widget.readOnly,
            focusNode: _focusNode,
            onTap: _requestFocus,
            cursorWidth: 1.8,
            cursorHeight: 18,
            cursorColor: Colors.black,
            controller: widget.controller,
            textCapitalization: widget.textCapitalization,
            keyboardAppearance: Brightness.light,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            onChanged: widget.onChange,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              hintText: widget.hintText,
              errorText: widget.errortxt,
                alignLabelWithHint: true,
              counter: const SizedBox(height: 19,),
              iconColor: appInactive2Color,
                focusColor: appInactive2Color,
                hintStyle: const TextStyle(
                  color: appInactive2Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  fontFamily: 'Urbanist',
                ),
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    widget.controller.text = value;
                    controller.enableButtonColor();
                  },
                  itemBuilder: (BuildContext context) {
                    List<String> items = ["Male", "Female"];
                    return items
                        .map<PopupMenuItem<String>>((String value) {
                      return new PopupMenuItem(
                          child: new Text(value, style: TextStyle(fontFamily: 'Urbanist',),), value: value, );
                    }).toList();
                  },
                ),


            ),

            autofocus: false,
            obscureText: widget.isPassWordField ? _obscureText : false,
          ),
        ),
      ],
    );
  }
}



class FormTextField extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) validator;
  final bool isPassWordField;
  final String hintText;
  final Color errorBorder;
  final Color focusErrorBorder;
  final TextEditingController controller;
  final bool addMargin;
  final Color fillcolor;
  final errortxtclr;
  final String? errortxt;
  final int? maxLength;
  final readOnly;
  final bool isEdu;
  final Function(String) onChange;
  // final dynamic Function() onChangeForColor;
  final String image;


  const FormTextField({super.key,
    this.labelText = "",
    required this.textInputAction,
    this.addMargin = true,
    this.textInputType = TextInputType.name,
    this.hintText = "",
    this.isPassWordField = false,
    this.textCapitalization = TextCapitalization.words,
    required this.validator,
    required this.controller,
    this.errorBorder = Colors.red,
    this.focusErrorBorder = Colors.red,
    this.fillcolor = Colors.grey,
    this.errortxtclr = Colors.red,
    this.readOnly = false,
    this.isEdu = false,
    this.errortxt,
    required this.image,
    required this.onChange,
    // required this.onChangeForColor,
    this.maxLength,
  });

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _obscureText = true;

  FocusNode _focusNode = FocusNode();

  // Adds initialization and disposal to _focusNode
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the password visibility
  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var passwordVisibilityToggle = GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 48,
        height: 44,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        margin: const EdgeInsets.only(left: 14.0),
        child: Center(
          child: GestureDetector(
            onTap: _toggle,
            child: FaIcon(
              _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 14,
              color: appInactive2Color,
            ),
          ),
        ),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.image,
          // width: 39,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: TextFormField(
            //readOnly: widget.readOnly,
            focusNode: _focusNode,
            onTap: _requestFocus,
            cursorWidth: 1.8,
            cursorHeight: 18,
            cursorColor: Colors.black,
            controller: widget.controller,
            textCapitalization: widget.textCapitalization,
            keyboardAppearance: Brightness.light,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            onChanged: widget.onChange,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
                hintText: widget.hintText,
                errorText: widget.errortxt,
                alignLabelWithHint: true,
                counter: const SizedBox(height: 19,),
                iconColor: appInactive2Color,
                focusColor: appInactive2Color,
                hintStyle: const TextStyle(
                    color: appInactive2Color,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  fontFamily: 'Urbanist',
                ),
                suffixIcon: widget.isPassWordField
                    ? passwordVisibilityToggle
                    : widget.isEdu
                    ? const Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 18,
                ): null


            ),
            // decoration: InputDecoration(
            //   errorText: widget.errortxt,
            //   counter: const SizedBox(),
            //   //alignLabelWithHint: true,
            //   contentPadding: const EdgeInsets.only(left: 12, right: 12),
            //   // border: const OutlineInputBorder(
            //   //   borderSide: BorderSide(
            //   //     width: .1,
            //   //   ),
            //   // ),
            //   // hintStyle: TextStyle(
            //   focusedErrorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide: BorderSide(color: widget.focusErrorBorder, width: 1.5),
            //   ),
            //   errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide: BorderSide(color: widget.errorBorder, width: 1.5),
            //   ),
            //   errorStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w400),
            //   enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide:  const BorderSide(color: Colors.grey, width: 1.5),
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide:  const BorderSide(color: Colors.grey, width: 1.5),
            //   ),
            //   hintText: widget.hintText,
            //   //labelText: widget.labelText,
            //   // labelStyle: TextStyle(
            //   //floatingLabelBehavior: FloatingLabelBehavior.never,
            //   // fillColor: Colors.red,
            //   suffixIcon: widget.isPassWordField
            //       ? passwordVisibilityToggle
            //       : widget.isEdu
            //       ? const Icon(
            //     Icons.arrow_drop_down_outlined,
            //     size: 18,
            //   )
            //       : null,
            // ),
            autofocus: false,
            obscureText: widget.isPassWordField ? _obscureText : false,
          ),
        ),
      ],
    );
  }
}


//for phone number input
class FormTextField2 extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) validator;
  final bool isPassWordField;
  final String hintText;
  final Color errorBorder;
  final Color focusErrorBorder;
  final TextEditingController controller;
  final bool addMargin;
  final Color fillcolor;
  final errortxtclr;
  final String? errortxt;
  final int? maxLength;
  final readOnly;
  final bool isEdu;
  final Function(String) onChange;
  final String headerText;
  final Widget prefixIcon;

  const FormTextField2({super.key,
    this.labelText = "",
    required this.textInputAction,
    this.addMargin = true,
    this.textInputType = TextInputType.name,
    this.hintText = "",
    this.isPassWordField = false,
    this.textCapitalization = TextCapitalization.words,
    required this.validator,
    required this.controller,
    this.errorBorder = Colors.red,
    this.focusErrorBorder = Colors.red,
    this.fillcolor = Colors.grey,
    this.errortxtclr = Colors.red,
    this.readOnly = false,
    this.isEdu = false,
    this.errortxt,
    required this.headerText,
    required this.onChange,
    this.maxLength,
    required this.prefixIcon,
  });

  @override
  _FormTextField2State createState() => _FormTextField2State();
}

class _FormTextField2State extends State<FormTextField2> {
  bool _obscureText = true;

  FocusNode _focusNode = FocusNode();

  // Adds initialization and disposal to _focusNode
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the password visibility
  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var passwordVisibilityToggle = GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 48,
        height: 44,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        margin: const EdgeInsets.only(left: 14.0),
        child: Center(
          child: GestureDetector(
            onTap: _toggle,
            child: FaIcon(
              _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const VSpace(6),
        TextFormField(
          //readOnly: widget.readOnly,
          focusNode: _focusNode,
          onTap: _requestFocus,
          cursorWidth: 1.8,
          cursorHeight: 18,
          cursorColor: Colors.grey,
          controller: widget.controller,
          textCapitalization: widget.textCapitalization,
          keyboardAppearance: Brightness.light,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          onChanged: widget.onChange,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            errorText: widget.errortxt,
            counter: const SizedBox(),
            //alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(left: 12, right: 12),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: .1,
              ),
            ),
            // hintStyle: TextStyle(
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: widget.focusErrorBorder, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: widget.errorBorder, width: 1.5),
            ),
            errorStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:  const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:  const BorderSide(color: Colors.grey, width: 1.5),
            ),
            hintText: widget.hintText,
            //labelText: widget.labelText,
            // labelStyle: TextStyle(
            //floatingLabelBehavior: FloatingLabelBehavior.never,
            // fillColor: Colors.red,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassWordField
                ? passwordVisibilityToggle
                : widget.isEdu
                ? const Icon(
              Icons.arrow_drop_down_outlined,
              size: 18,
            )
                : null,
          ),
          autofocus: false,
          obscureText: widget.isPassWordField ? _obscureText : false,
        ),
      ],
    );
  }
}