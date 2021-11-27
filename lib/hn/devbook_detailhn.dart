// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/book_index_model.dart';
import 'package:gtw/utility/my_constant.dart';

class DevbookDetailHn extends StatefulWidget {
  final BookIndexModel bookIndexModels;
  // final String url;
  // final String name;
  const DevbookDetailHn({Key? key, required this.bookIndexModels})
      : super(key: key);
  // const DevbookDetailHn(
  //     {Key? key,
  //     required this.bookIndexModels,
  //     required this.url,
  //     required this.name})
  //     : super(key: key);

  @override
  _DevbookDetailHnState createState() => _DevbookDetailHnState();
}

class _DevbookDetailHnState extends State<DevbookDetailHn> {
  BookIndexModel? bookIndexModels;
  bool loading = true;
  // late PDFDocument pdfDocument;

  @override
  void initState() {
    super.initState();
    bookIndexModels = widget
        .bookIndexModels; ///// *******  อันเดียวกันกับข้างบนสุด  ********************////
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(bookIndexModels!.BOOK_NAME),
      ),
      // body: loading ? Center(child: CircularProgressIndicator(),): PDFViewer(document: pdfDocument),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    // child: Container(
                    //   height: 300,
                    //   child: Card(
                    //     child: PDFViewer(document: pdfDocument),
                    //   ),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'ปี พ.ศ.  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            bookIndexModels!.BOOK_YEAR_ID,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'เลขรับ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            bookIndexModels!.BOOK_NUM_IN,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'วันที่  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            bookIndexModels!.BOOK_DATE,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'เลขที่หนังสือ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            bookIndexModels!.BOOK_NUMBER,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'ประเภทหนังสือ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            bookIndexModels!.BOOK_TYPE_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'ชื่อเรื่อง  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            bookIndexModels!.BOOK_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blueAccent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          'รายละเอียด  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            bookIndexModels!.BOOK_DETAIL,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 3, bottom: 3),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10.0),
                //       border: Border.all(
                //         width: 2.0,
                //         color: Colors.blueAccent,
                //       ),
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Colors.black26,
                //           offset: Offset(0, 2),
                //           blurRadius: 6.0,
                //         ),
                //       ],
                //     ),
                //     child: Card(
                //       child: ListTile(
                //         leading: Text(
                //           'สถานะ  ',
                //           style: MyConstant().h3back(),
                //         ),
                //         title: Padding(
                //           padding: const EdgeInsets.only(left: 5),
                //           child: Text(
                //             bookIndexModels!.SEND_STATUS,
                //             style: MyConstant().h3dark(),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2, primary: Colors.green),
                          onPressed: () {
                            // EditGleave();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'เห็นชอบ',
                              style: MyConstant().h2White(),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.redAccent,
                        ),
                        onPressed: () {
                          // CancelGleave();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ไม่เห็นชอบ',
                            style: MyConstant().h2White(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
