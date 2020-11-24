import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {

  final Function(File) onImageSelected;
  ImageSourceModal(this.onImageSelected);

  @override
  Widget build(BuildContext context) {

  

    if (Platform.isAndroid)
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              child: Text("Câmera"),
              onPressed: getFromCamera,
            ),
            FlatButton(
              child: Text("Galeria"),
              onPressed: getFromGallery,
            ),
          ],
        ),
      );
    else
      return CupertinoActionSheet(
        title: const Text("Selecionar foto para o anúncio"),
        message: const Text("Escolha a origem da foto"),
        cancelButton:  CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancelar", style: TextStyle(color: Colors.red),),
          ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: Text("Câmera"),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: Text("Galeria"),
          )
        ],
      );
  }

  Future<void> getFromCamera() async {
    final pickedFile= await ImagePicker().getImage(source: ImageSource.camera);
    if(pickedFile == null) return;
    final image = File(pickedFile.path);
    imageSelected(image);

  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if(pickedFile == null) return;
    final image = File(pickedFile.path);
    imageSelected(image);

  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Editar Imagem',
        cancelButtonTitle: 'Cancelar',
        doneButtonTitle: 'Concluir',
      ),

    );
    if(croppedFile != null)
      onImageSelected(croppedFile);
    
  }
  

}
