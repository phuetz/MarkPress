import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class SingleInstance {
  static const int _port = 45454;
  static ServerSocket? _serverSocket;
  static final StreamController<String> _fileStreamController = StreamController<String>.broadcast();

  /// Returns a stream of file paths received from other instances.
  static Stream<String> get onFileReceived => _fileStreamController.stream;

  /// Initializes the single instance mechanism.
  /// Returns true if this is the main instance, false if it's a secondary instance (which should exit).
  /// If it's a secondary instance, it sends the [args] to the main instance before returning false.
  static Future<bool> initialize(List<String> args) async {
    // Only active on Windows for now (and Linux/macOS if needed, but focus is Windows)
    if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) {
      return true;
    }

    try {
      // Try to bind to the port. If successful, we are the main instance.
      _serverSocket = await ServerSocket.bind(InternetAddress.loopbackIPv4, _port);
      
      if (kDebugMode) {
        print('SingleInstance: Bound to port $_port. This is the main instance.');
      }

      _serverSocket!.listen((Socket socket) {
        socket.listen((List<int> data) {
          final message = utf8.decode(data);
          if (kDebugMode) {
            print('SingleInstance: Received message: $message');
          }
          if (message.isNotEmpty) {
            _fileStreamController.add(message);
          }
        });
      });

      return true;
    } on SocketException {
      // Port is busy, we are a secondary instance.
      if (kDebugMode) {
        print('SingleInstance: Port $_port is busy. Connecting to main instance...');
      }
      
      if (args.isNotEmpty) {
        try {
          final socket = await Socket.connect(InternetAddress.loopbackIPv4, _port);
          // Send the first argument (file path)
          // We could send all args, but for this app we expect one file path usually.
          // If multiple args support is needed, we'd serialize them.
          // For now, assuming args[0] is the file path.
          final filePath = args.first;
          socket.write(filePath);
          await socket.flush();
          await socket.close();
          if (kDebugMode) {
            print('SingleInstance: Sent $filePath to main instance.');
          }
        } catch (e) {
          if (kDebugMode) {
            print('SingleInstance: Failed to connect to main instance: $e');
          }
        }
      }
      
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('SingleInstance: Error initializing: $e');
      }
      // Fallback: If unknown error, allow run to prevent blocking the user
      return true;
    }
  }
  
  static void dispose() {
    _serverSocket?.close();
    _fileStreamController.close();
  }
}
