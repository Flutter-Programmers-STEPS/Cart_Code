import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _cameraInitialized = false;
  XFile? _pictureFile;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    bool hasCameraPermission = await checkCameraPermission();
    if (hasCameraPermission) {
      List<CameraDescription> cameras = await availableCameras();
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _cameraInitialized = true;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Camera permission not granted'),
        ),
      );
    }
  }

  Future<bool> checkCameraPermission() async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.status;
    if (!cameraPermissionStatus.isGranted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.camera].request();
      return permissionStatus[Permission.camera]!.isGranted;
    } else {
      return true;
    }
  }

  void takePicture() async {
    try {
      XFile picture = await _controller!.takePicture();
      setState(() {
        _pictureFile = picture;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Picture taken successfully'),
        ),
      );
      savePictureToGallery(picture.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error taking picture: $e'),
        ),
      );
    }
  }

  Future<void> savePictureToGallery(String imagePath) async {
    try {
      final appDir = await getExternalStorageDirectory();
      final fileName = DateTime.now().toString() + '.jpg';
      final savedImage =
          await File(imagePath).copy('${appDir!.path}/$fileName');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Picture saved to gallery '),
        ),
      );
      print(savedImage);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving picture to gallery: $e'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      body: _cameraInitialized
          ? Stack(
              children: [
                CameraPreview(_controller!),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.camera),
                          onPressed: takePicture,
                          color: Colors.white,
                          iconSize: 32,
                        ),
                      ),
                      SizedBox(width: 16),
                      _pictureFile != null
                          ? Image.file(
                              File(_pictureFile!.path),
                              height: 64,
                              width: 64,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
