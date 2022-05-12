import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../data/api_calls.dart';
import '../data/custom_dialog.dart';
import '../data/db.dart';
import '../data/image_data.dart';
import '../data/numbers.dart';
import '../data/strings.dart';
import '../data/textstyles.dart';
import '../data/widgets.dart';
import 'list_page.dart';

enum PhotoSource { file, network }

class IssueFormSection extends StatefulWidget {
  final User? user;
  final LocationData? location;
  const IssueFormSection({required this.user, this.location, Key? key}) : super(key: key);

  @override
  _IssueFormSectionState createState() => _IssueFormSectionState();
}

class _IssueFormSectionState extends State<IssueFormSection> {
  late User? _user;
  late DeviceDatabase database;
  TextEditingController description = TextEditingController();
  IssuesCompanion _issue = const IssuesCompanion();
  final List<File> _photos = [];
  final List<String> _photosUrls = [];
  final List<PhotoSource> _photosSources = [];
  final List<GalleryItem> _galleryItems = [];
  bool submitPressed = false;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    int issueId = Random.secure().nextInt(1 << 32);
    if (_user != null) {
      _issue = _issue.copyWith(
        userServerId: drift.Value(_user!.id),
        internalIssueId: drift.Value(issueId),
      );
    }
    description.addListener(_descriptionListener);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    database = Provider.of<DeviceDatabase>(context);
  }

  _descriptionListener() {
    _issue = _issue.copyWith(
      description: drift.Value(description.text),
    );
  }

  _buildAddPhoto() {
    return InkWell(
      onTap: () => _onAddPhotoClicked(context),
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 100,
        width: 100,
        color: Colours.kDarkGray,
        child: const Center(
          child: Icon(
            MaterialIcons.add_to_photos,
            color: Colours.kLightGray,
          ),
        ),
      ),
    );
  }

  _onAddPhotoClicked(context) async {
    late ph.Permission permission;

    if (Platform.isIOS) {
      permission = ph.Permission.photos;
    } else {
      permission = ph.Permission.storage;
    }

    ph.PermissionStatus permissionStatus = await permission.status;

    if (permissionStatus == ph.PermissionStatus.restricted) {
      _showOpenAppSettingsDialog(context);

      permissionStatus = await permission.status;

      if (permissionStatus != ph.PermissionStatus.granted) {
        //Only continue if permission granted
        return;
      }
    }

    if (permissionStatus == ph.PermissionStatus.permanentlyDenied) {
      _showOpenAppSettingsDialog(context);

      permissionStatus = await permission.status;

      if (permissionStatus != ph.PermissionStatus.granted) {
        //Only continue if permission granted
        return;
      }
    }

    // if (permissionStatus == ph.PermissionStatus.undetermined) {
    //   permissionStatus = await permission.request();
    //
    //   if (permissionStatus != ph.PermissionStatus.granted) {
    //     //Only continue if permission granted
    //     return;
    //   }
    // }

    if (permissionStatus == ph.PermissionStatus.denied) {
      if (Platform.isIOS) {
        _showOpenAppSettingsDialog(context);
      } else {
        permissionStatus = await permission.request();
      }

      if (permissionStatus != ph.PermissionStatus.granted) {
        //Only continue if permission granted
        return;
      }
    }

    if (permissionStatus == ph.PermissionStatus.granted) {
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (image != null) {
        String fileExtension = path.extension(image.path);

        _galleryItems.add(
          GalleryItem(
            id: const Uuid().v1(),
            resource: image.path,
            isSvg: fileExtension.toLowerCase() == ".svg",
          ),
        );

        setState(() {
          _photos.add(File(image.path));
          _photosSources.add(PhotoSource.file);
        });
      }
    }
  }

  _showOpenAppSettingsDialog(context) {
    return CustomDialog.show(
      context,
      'Permission needed',
      'Photos permission is needed to select photos',
      'Open settings',
      ph.openAppSettings,
    );
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context)
                  .push(
                PageRouteBuilder(
                  pageBuilder: (_, a1, a2) => const ListPage(),
                ),
              )
                  .then((value) {
                if (value != null) {
                  setState(() {
                    _issue = _issue.copyWith(
                      categoryLvl1: drift.Value(value!.id),
                    );
                  });
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.lblCategoryLvl1,
                    style: CustomTextStyles.formTextField(Colors.black.value),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${_issue.categoryLvl1.value ?? Strings.hntSelect}',
                          style: CustomTextStyles.formTextField(
                            Colors.black.value,
                          ),
                        ),
                      ),
                      Icon(
                        MaterialCommunityIcons.chevron_down_circle,
                        size: 30,
                        color: Color(Colors.black.value),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          FormWidgets.divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        Strings.lblDescription,
                        style: TextStyle(fontSize: 30),
                      ),
                      FormWidgets.nameTextField(
                        Colors.black,
                        controller: description,
                        hintText: 'Tell us what the issue is...',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FormWidgets.divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        Strings.lblImages,
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _photos.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildAddPhoto();
                }
                File image = _photos[index - 1];
                PhotoSource source = _photosSources[index - 1];
                return Stack(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        color: Colours.kLightGray,
                        child: source == PhotoSource.file
                            ? Image.file(image)
                            : Image.network(_photosUrls[index - 1]),
                      ),
                      onTap: () {
                        Api().submitImage(image);
                      },
                    ),
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            _photos.removeAt(index - 1);
                            _photosSources.removeAt(index - 1);
                            _galleryItems.removeAt(index - 1);
                            setState(() {});
                          },
                          child: const Icon(
                            MaterialCommunityIcons.delete,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          FormWidgets.textButtonTB(
            Strings.btnSubmit,
            Colors.white,
            Colors.green,
            onClick: () async {
              if (submitPressed) {
                return;
              }
              setState(() {
                submitPressed = true;
              });
              List<String> imgKeys = [];
              for (File image in _photos) {
                final imgKey = await Api().submitImage(image);
                if (imgKey != null) {
                  imgKeys.add(imgKey);
                }
              }
              final _submittedIssue = await Api().submitIssue(
                _issue.copyWith(
                  images: drift.Value(imgKeys.join(',')),
                ),
              );

              if (_submittedIssue != null) {
                await database.addIssue(_submittedIssue);

                for (File image in _photos) {
                  await database.addImage(
                    PhotosCompanion.insert(
                      data: image.path,
                      internalIssueId: _submittedIssue.internalIssueId.value,
                    ),
                  );
                }
              }
            },
          ),
          FormWidgets.textButtonTB(
            Strings.btnCancel,
            Colors.white,
            Colors.orange,
            onClick: () => {
              if (Navigator.of(context).canPop()) Navigator.of(context).pop(),
            },
          ),
        ],
      );
}
