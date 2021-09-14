import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/populate_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/views/components/audio_recorder_component.dart';
import 'package:semantic_kulkul/views/components/select_form_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/components/text_form_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_sound_component.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PopulateKulkulSoundView extends GetView<PopulateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Detail Kulkul',
            style: TextStyle(color: ColorHelper.blackColor)),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorHelper.blackColor, //change your color here
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
              child: Obx(
          () => Container(
            padding: EdgeInsets.only(
                top: ResponsiveFlutter.of(context).wp(5),
                left: ResponsiveFlutter.of(context).wp(5),
                right: ResponsiveFlutter.of(context).wp(5)),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Nama Suara (${(index + 1)})',
                        style: TextStyle(
                            color: ColorHelper.grayColor,
                            fontWeight: FontWeight.w600),
                      ),
                      ToggleSwitch(
                        initialLabelIndex:
                            controller.kulkul.value.sounds[index].lang == 'ban'
                                ? 1
                                : 0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: ColorHelper.grayColor,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: ['id', 'ban'],
                        onToggle: (int value) {
                          controller.handleToggleSoundNameLang(index, value);
                        },
                      ),
                    ],
                  ),
                  SeparatorComponent(
                    height: 2,
                  ),
                  TextFormComponent(
                    hintText: 'cont. A Tulud',
                    controller: controller.kulkul.value.sounds[index].name,
                  ),
                  SeparatorComponent(
                    height: 3,
                  ),
                  _renderActivity(context, index),
                  SeparatorComponent(
                    height: 3,
                  ),
                  _renderSound(context, index),
                  TextButton.icon(
                      onPressed: () {
                        controller.handleButtonRemoveSuara(index);
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      icon: Icon(Icons.close),
                      label: Text('Hapus Suara (${index + 1})'))
                ],
              ),
              itemCount: controller.kulkul.value.sounds.length,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.handleButtonAddSuara,
      ),
    );
  }

  Widget _renderActivity(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kegiatan Kulkul (${index + 1})',
              style: TextStyle(
                  color: ColorHelper.grayColor, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.blue),
              onPressed: () {
                controller.handleButtonAktivitas(index);
              },
              color: Colors.blue,
              iconSize: Heading.h1,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              controller.kulkul.value.sounds[index].activities.length,
              (indexAktivitas) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Kegiatan (${indexAktivitas + 1})',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          ToggleSwitch(
                            initialLabelIndex: controller
                                        .kulkul
                                        .value
                                        .sounds[index]
                                        .activities[indexAktivitas]
                                        .lang ==
                                    'ban'
                                ? 1
                                : 0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: ColorHelper.grayColor,
                            inactiveFgColor: Colors.white,
                            totalSwitches: 2,
                            labels: ['id', 'ban'],
                            onToggle: (int value) {
                              controller.handleTogglAktivitas(
                                  index, indexAktivitas, value);
                            },
                          ),
                        ],
                      ),
                      SeparatorComponent(
                        height: 2,
                      ),
                      TextFormComponent(
                        hintText: 'cont. Acara Pernikahan',
                        controller: controller.kulkul.value.sounds[index]
                            .activities[indexAktivitas].name,
                      ),
                      SeparatorComponent(
                        height: 2,
                      ),
                      SelectFormComponent(
                        value: controller.kulkul.value.sounds[index]
                            .activities[indexAktivitas].group,
                        onChange: (String value) {
                          controller.handleSelectAktivitas(
                              index, indexAktivitas, value);
                        },
                        data: controller.activities,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            controller.handleButtonRemoveAktivitas(
                                index, indexAktivitas);
                          },
                          icon: Icon(Icons.close),
                          label: Text('Hapus Kegiatan (${indexAktivitas + 1})'))
                    ],
                  )).toList(),
        )
      ],
    );
  }

  Widget _renderSound(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Suara (${index + 1})',
              style: TextStyle(
                  color: ColorHelper.grayColor, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.blue),
              onPressed: () {
                controller.handleButtonAddSuaraFile(index);
              },
              color: Colors.blue,
              iconSize: Heading.h1,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              controller.kulkul.value.sounds[index].file.length,
              (indexSuara) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (controller.kulkul.value.sounds[index].file[indexSuara] != null && controller.kulkul.value.sounds[index].file[indexSuara].path != '') ? KulkulSoundComponent(url: controller.kulkul.value.sounds[index].file[indexSuara].path, isLocal: true,) :
                      AudioRecorderComponent(onChange: (String value) {
                        controller.handleAudioSuaraFile(
                            index, indexSuara, value);
                      }),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.blue),
                        onPressed: () {
                          controller.handleButtonRemoveSuaraFile(
                              index, indexSuara);
                        },
                        color: Colors.blue,
                        iconSize: Heading.h1,
                      ),
                    ],
                  )).toList(),
        )
      ],
    );
  }
}
