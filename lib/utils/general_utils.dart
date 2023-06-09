import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class GeneralUtils {
  //We can decorate all toast from here whenever require
  //We will decorate later
  /// The function displays a toast message using the Fluttertoast library in Dart.
  ///
  /// Args:
  ///   message (String): The message parameter is a string that represents the text message that will
  /// be displayed in the toast notification.
  static toast(String message) {
    Fluttertoast.showToast(msg: message);
  }

 /// This function changes the focus from the current focus node to the next focus node in a given
 /// context.
 /// 
 /// Args:
 ///   context (BuildContext): The BuildContext is a reference to the location of the widget in the
 /// widget tree. It is used to access the nearest ancestor of the widget that is of a specific type. In
 /// this case, it is used to access the FocusScope widget that contains the current and next focus
 /// nodes.
 ///   current (FocusNode): The current `FocusNode` that needs to be unfocused.
 ///   next (FocusNode): The next `FocusNode` that should receive focus after the current `FocusNode` is
 /// unfocused.
  static changeFocusNode(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  //We Will decorate later
  /// The function displays a message using a Flushbar widget at the top of the screen in a Flutter app.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext of the current widget tree.
  ///   message (String): The message to be displayed in the Flushbar.
  static flushbar(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 2),
        )..show(context));
  }
}
