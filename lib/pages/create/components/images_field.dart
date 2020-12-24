import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxmobx/controllers/create_controller.dart';
import 'package:olxmobx/pages/create/components/image_dialog.dart';
import 'package:olxmobx/pages/create/components/image_source_modal.dart';

class ImagesField extends StatelessWidget {
  final CreateController createController;
  ImagesField(this.createController);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      //Fechando o modal
      Navigator.of(context).pop();
      createController.images.add(image);
    }

    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: createController.images.length < 5
                    ? createController.images.length + 1
                    : 5,
                itemBuilder: (_, index) {
                  if (index == createController.images.length)
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          if (Platform.isAndroid) {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => ImageSourceModal(onImageSelected),
                            );
                          } else {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_) => ImageSourceModal(onImageSelected),
                            );
                          }
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, size: 35, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    );
                  else
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => ImageDialog(
                              image: createController.images[index],
                              onDelete: () => createController.images.removeAt(index),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(createController.images[index]),
                        ),
                      ),
                    );
                },
              );
            },
          ),
        ),
        Observer(
          builder: (_) {
          if(createController.imagesError != null) 
            return Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.red),
                ),
              ),
              child: Text(createController.imagesError, style: TextStyle(color: Colors.red, fontSize: 12),),
            );
          else 
            return Container();
          }
        ),
      ],
    );
  }
}
