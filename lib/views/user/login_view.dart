import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/components/text_form_component.dart';

class LoginView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorHelper.whiteColor,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: ColorHelper.blackColor, //change your color here
          ),
        ),
      backgroundColor: ColorHelper.whiteColor,
      body: SingleChildScrollView(
          child: Container(
            height: ResponsiveFlutter.of(context).hp(100) - kToolbarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).wp(5)),
                  padding: EdgeInsets.all(ResponsiveFlutter.of(context).wp(2)),
                  child: Form(
                      // key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Masuk',
                            style: TextStyle(
                                color: ColorHelper.blueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: Heading.h2),
                          ),
                          SeparatorComponent(
                            height: 7,
                          ),
                          Text(
                            'Username',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          TextFormComponent(
                            textInputAction: TextInputAction.next,
                            prefixIcon: Icon(Icons.person),
                            autocorrect: false,
                            hintText: 'Masukkan username',
                            onChanged: (String value) {
                              // controller.user.update((item) {
                              //   item.username = value;
                              // });
                            },
                            validator: (String value) {
                              if (value.isEmpty || value == null) {
                                return 'Username kosong';
                              }
                            },
                          ),
                          SeparatorComponent(
                            height: 4,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          TextFormComponent(
                            obscureText: true,
                            prefixIcon: Icon(Icons.lock),
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            autocorrect: false,
                            hintText: 'Masukkan password',
                            onChanged: (String value) {
                              // controller.user.update((item) {
                              //   item.password = value;
                              // });
                            },
                            validator: (String value) {
                              if (value.isEmpty || value == null) {
                                return 'Password kosong';
                              }
                            },
                          )
                        ],
                      )),
                ),
                SeparatorComponent(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ResponsiveFlutter.of(context).wp(7),
                      right: ResponsiveFlutter.of(context).wp(7),
                      bottom: ResponsiveFlutter.of(context).wp(5)),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: double.infinity,
                        height: ResponsiveFlutter.of(context).hp(6)),
                    child: ElevatedButton(
                        child: Text('Login'),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ResponsiveFlutter.of(context).wp(2)),
                                    side: BorderSide.none))),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          // controller.handleLogin();
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}