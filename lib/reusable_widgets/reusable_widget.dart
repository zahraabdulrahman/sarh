import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:xyz/utils/pixel_sizes.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.grey.withOpacity(0.9)),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: -5),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA7E8BD))),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    // onChanged: (value) {
    // if (confirmationController != null) {
    //   print("Confirm you password");
    //   // Check if password and confirmation match
    //   if (isPasswordType && value != confirmationController.text) {
    //     print("The passowrd does not match");
    //     // Set error if passwords do not match
    //     confirmationController.clear(); // Clear confirmation field
    //     confirmationController.text =
    //         value; // Set text again to trigger error message
    //   }
    // }
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 250,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(255, 6, 52, 0);
            }
            return const Color(0xFFA7E8BD);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      //   child: Text(
      //     title,
      //     style: const TextStyle(
      //         color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      //   ),
      // ),
    ),
  );
}

void showDatePickerOnTextField(
    BuildContext context, TextEditingController dateInput) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    dateInput.text = formattedDate;
  } else {
    print("Date is not selected");
  }
}

Container settingUIButton (BuildContext context, String title, IconData icon, Function onTap) {
  return Container(
     child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.green,
          size: 20.0,
        ),
        label: Text(title,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.9)
        ),),
        onPressed: () {
          onTap();
        },
     )
  );
}

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if(file != null){
    return await file.readAsBytes();
  }
  print('No Images Selected');
}

Column cardsBar() {
  return Column(
    children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 337,
              decoration: const BoxDecoration(
                  color: Colors.grey
              ),

            )]
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  // Handle button press
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(73, 50),// Specify the desired width and height
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(8), // Specify the desired padding
                    )
                ),
                icon: const Icon(Icons.volume_up),
                label : const Text("")
            ),
            const SizedBox(height: 90, width: 40),
          ]),],
  );
}