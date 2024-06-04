import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class AddDocController extends GetxController {
  check() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // ignore: unused_local_variable
      File file = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }

  static const String uploadUrl = 'YOUR_UPLOAD_ENDPOINT_URL';

  Future<String?> uploadDocument() async {
    try {
      final filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (filePickerResult != null) {
        final fileBytes =
            File(filePickerResult.files.single.path!).readAsBytesSync();
        final String fileName = filePickerResult.files.single.name;
        print('sssssss$fileBytes');

        final response = await http.post(
          Uri.parse(uploadUrl),
          headers: {
            'Content-Type': 'multipart/form-data',
            // Add any other headers if needed
          },
          body: {
            'file': base64Encode(fileBytes),
            'name': fileName,
            // Add any other fields if required
          },
        );

        if (response.statusCode == 200) {
          // Successful upload
          return json.decode(response.body)[
              'url']; // Assuming the server responds with the URL of the uploaded document
        } else {
          // Handle error
          return null;
        }
      } else {
        // User canceled document selection
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print('Upload Error: $e');
      return null;
    }
  }

  Future<void> uploadDocument2() async {
    final url = await uploadDocument();
    if (url != null) {
      // Handle successful upload
      print('Document uploaded successfully. URL: $url');
    } else {
      // Handle failed upload or user cancellation
      print('Document upload failed.');
    }
  }
}
