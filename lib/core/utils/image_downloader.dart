// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class ImageDownloader {
//   /// Downloads an image from assets to local storage
//   /// Returns the path where the image is saved
//   static Future<String> downloadFromAsset({
//     required String assetPath,
//     String? customFileName,
//   }) async {
//     try {
//       // Get the application documents directory
//       final Directory appDocDir = await getApplicationDocumentsDirectory();
      
//       // Generate file name from asset path if custom name not provided
//       final String fileName = customFileName ?? basename(assetPath);
      
//       // Create the full save path
//       final String savePath = join(appDocDir.path, fileName);
      
//       // Check if file already exists
//       if (await File(savePath).exists()) {
//         print('File already exists at: $savePath');
//         return savePath;
//       }
      
//       // Load the asset as bytes
//       final ByteData data = await rootBundle.load(assetPath);
//       final List<int> bytes = data.buffer.asUint8List();
      
//       // Write the file
//       final File file = File(savePath);
//       await file.writeAsBytes(bytes);
      
//       print('File saved successfully at: $savePath');
//       return savePath;
//     } catch (e) {
//       print('Error downloading image: $e');
//       throw Exception('Failed to download image: $e');
//     }
//   }
  
//   /// TODO: Implementation for downloading from network
//   /// This will be implemented later using http package
//   static Future<String> downloadFromNetwork({
//     required String url,
//     String? customFileName,
//   }) async {
//     // Placeholder for network download implementation
//     throw UnimplementedError('Network download not yet implemented');
//   }
// }