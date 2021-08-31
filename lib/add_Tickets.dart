import 'package:flutter/material.dart';
import 'styling/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class addTickets extends StatefulWidget {
  addTickets({Key? key}) : super(key: key);

  @override
  _addTicketsState createState() => _addTicketsState();
}

class _addTicketsState extends State<addTickets> {
  static const color = AppColors();

  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = true;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths!.first.extension);
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          splashColor: color.white,
        ),
        backgroundColor: color.mainBlue,
        title: Text(
          " Add Tickets",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _openFileExplorer(),
            icon: Icon(Icons.attach_file),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        hintText: "Level",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        hintText: "Telephone-No",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        hintText: "Type",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        hintText: "Description",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Builder(
                                  builder: (BuildContext context) =>
                                      _loadingPath
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child:
                                                  const CircularProgressIndicator(),
                                            )
                                          : _directoryPath != null
                                              ? ListTile(
                                                  title: const Text(
                                                      'Directory path'),
                                                  subtitle:
                                                      Text(_directoryPath!),
                                                )
                                              : _paths != null
                                                  ? Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 30.0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.50,
                                                      child: Scrollbar(
                                                          child: ListView
                                                              .separated(
                                                        shrinkWrap: true,
                                                        itemCount: _paths !=
                                                                    null &&
                                                                _paths!
                                                                    .isNotEmpty
                                                            ? _paths!.length
                                                            : 1,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          final bool
                                                              isMultiPath =
                                                              _paths != null &&
                                                                  _paths!
                                                                      .isNotEmpty;
                                                          final String name = 'File $index: ' +
                                                              (isMultiPath
                                                                  ? _paths!
                                                                          .map((e) => e
                                                                              .name)
                                                                          .toList()[
                                                                      index]
                                                                  : _fileName ??
                                                                      '...');
                                                          final path = _paths!
                                                              .map(
                                                                  (e) => e.path)
                                                              .toList()[index]
                                                              .toString();

                                                          return ListTile(
                                                            title: Text(
                                                              name,
                                                            ),
                                                            subtitle:
                                                                Text(path),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                                        context,
                                                                    int index) =>
                                                                const Divider(),
                                                      )),
                                                    )
                                                  : const SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Container(
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(color.mainBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: color.mainBlue),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            backgroundColor: color.mainBlue,
                            color: color.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
