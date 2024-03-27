import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/src/core/constant/color.dart';
import 'package:task/src/core/services/api_service.dart';
import 'package:task/src/ui/screens/home/home_viewmode.dart';
import 'package:task/src/utils/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(ApiService()),
      child: Consumer<HomeProvider>(builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: baseColor,
              title: manropeText(
                  text: 'Comments', color: kwhiteColor, fontSize: 20),
            ),
            body: SafeArea(
                child: model.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: model.list.length,
                        itemBuilder: (context, index) {
                          final data = model.list[index];
                          return Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  manropeText(
                                    text: data.name ?? '',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      manropeText(
                                        text: data.email ?? '',
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            model.deleteComment(index);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: baseColor,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  manropeText(
                                    text: data.body ?? '',
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )));
      }),
    );
  }
}
