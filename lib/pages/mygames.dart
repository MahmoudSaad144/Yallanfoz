import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/components/showcustomdialog.dart';

class Mygames extends StatefulWidget {
  const Mygames({Key? key}) : super(key: key);

  @override
  _MygamesPageState createState() => _MygamesPageState();
}

class _MygamesPageState extends State<Mygames> {
  // بيانات الباقات
  final List<Map<String, dynamic>> mygames = [
    {
      'id': 1,
      'name': 'Friends',
      'first_team': 'red',
      'second_team': 'green',
      'last_answer': 'green',
      'first_team_score': 0,
      'second_team_score': 0,
      'first_team_two': 0,
      'first_team_phone': 0,
      'first_team_hole': 0,
      'second_team_two': 0,
      'second_team_phone': 0,
      'second_team_hole': 0,
      'answered_questions': [1, 6, 15, 13],
      'games': [
        {
          'name': 'ركز شوية',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'سيارات',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'ملاعب ',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'خمن اللاعب',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'عواصم',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'فن',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      'id': 2,
      'name': 'تحدي الاسرة',
      'first_team': 'red',
      'second_team': 'green',
      'last_answer': 'green',
      'first_team_score': 0,
      'second_team_score': 0,
      'first_team_two': 0,
      'first_team_phone': 0,
      'first_team_hole': 0,
      'second_team_two': 0,
      'second_team_phone': 0,
      'second_team_hole': 0,
      'answered_questions': [1, 6, 15, 13],
      'games': [
        {
          'name': 'ركز شوية',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'سيارات',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'ملاعب ',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'خمن اللاعب',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'عواصم',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'فن',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      'id': 3,
      'name': 'Friends2',
      'first_team': 'red',
      'second_team': 'green',
      'last_answer': 'green',
      'first_team_score': 0,
      'second_team_score': 0,
      'first_team_two': 0,
      'first_team_phone': 0,
      'first_team_hole': 0,
      'second_team_two': 0,
      'second_team_phone': 0,
      'second_team_hole': 0,
      'answered_questions': [1, 6, 15, 13],
      'games': [
        {
          'name': 'ركز شوية',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'سيارات',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'ملاعب ',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'خمن اللاعب',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'عواصم',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
        {
          'name': 'فن',
          'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
          'questions': [
            {
              '200': [
                {
                  'id': 1,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,

                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },
                  'points': 200,
                },
                {
                  'id': 2,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': 'https://www.youtube.com/watch?v=ZmzY_7-ROXY',
                  },
                  'points': 200,
                },
              ],
            },
            {
              '400': [
                {
                  'id': 3,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo': null,
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo': null,
                    'video': null,
                  },
                  'points': 400,
                },
                {
                  'id': 4,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 400,
                },
              ],
            },
            {
              '600': [
                {
                  'id': 5,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
                {
                  'id': 6,
                  'question':
                      'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                  'photo':
                      'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                  'video': null,
                  'answer': {
                    'answer': ' ابو تريكه ',
                    'photo':
                        'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                    'video': null,
                  },

                  'points': 600,
                },
              ],
            },
          ],
        },
      ],
    },
  ];

  TextEditingController search = TextEditingController();
  Timer? _debounce;
  int? _selected;
  @override
  void dispose() {
    _debounce?.cancel();
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppbarComponent(),
      body: Stack(
        children: [
          // 1) المحتوى القابل للتمرير
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),

                width: double.infinity,
                child: Column(
                  children: [
                    // الهيدر بعرض الشاشة كاملة
                    Container(
                      width: width,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          bottomRight: Radius.circular(150),
                        ),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "اختار من العابك",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              color: Color(0xFFFFECB3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            " لعبة جماعية تفاعلية نختبر فيها معرفتكم و ثقافتكم ",
                            style: TextStyle(
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width * .8,
                            child: Text(
                              " لإنشاء لعبة جديدة اضغط على (انشاء لعبة جديدة )",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: width * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 5),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Wrap(
                          spacing: 80,
                          runSpacing: 8,
                          children: [
                            Container(
                              width: width * 0.34,
                              child: TextFormField(
                                controller: search,
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce!.cancel();

                                  _debounce = Timer(
                                    const Duration(milliseconds: 800),
                                    () {
                                      // هنا بيبدأ البحث بعد ما يوقف كتابة لمدة 500ms
                                      setState(() {
                                        print("ابحث عن: $value");
                                        // هنا حط استدعاء البحث من السيرفر مثلاً
                                      });
                                    },
                                  );
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: " ابحث باسم اللعبة ",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                        255,
                                        208,
                                        114,
                                        151,
                                      ), // لون البوردر العادي
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0xFFFFECB3,
                                      ), // لون البوردر وقت الفوكس
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              width: width * 0.34,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Get.toNamed("/games");
                                },
                                icon: const Icon(Icons.add, size: 18),
                                label: const Text('انشاء لعبة جديدة'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[700],
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    // الـGrid نفسه
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: width * 0.25,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 5,
                                mainAxisExtent: height * 0.45,
                              ),
                          itemCount: mygames.length,
                          itemBuilder: (ctx, i) {
                            final isSelected = _selected == i ? true : false;
                            final List<Map<String, dynamic>> game =
                                mygames[i]['games'];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    _selected = null;
                                  } else {
                                    _selected = i;
                                  }
                                });
                                Get.dialog(
                                  ShowDialogMyGame(context, _selected),
                                );
                              },
                              child: Card(
                                elevation: isSelected ? 12 : 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: height * 0.07),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    width * 0.09,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                                mainAxisExtent: height * 0.15,
                                              ),
                                          itemCount: game.length,
                                          itemBuilder: (ctx, index) {
                                            return Column(
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: ClipRRect(
                                                    child: Image.network(
                                                      game[index]['photo'],
                                                      fit: BoxFit.cover,
                                                      width: width * 0.1,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                        184,
                                                        195,
                                                        109,
                                                        111,
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      game[index]['name'],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.012,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                184,
                                                238,
                                                134,
                                                137,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(9),
                                                bottomRight: Radius.circular(9),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              mygames[i]['name'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.018,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                        width: width * 0.2,
                                        height: height * 0.08,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(9),
                                            topRight: Radius.circular(9),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(
                                                255,
                                                223,
                                                192,
                                                129,
                                              ), // بيج فاتح جداً
                                              Color.fromARGB(
                                                255,
                                                226,
                                                138,
                                                174,
                                              ), // بينك شفاف
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          " عدد مرات اللعب : 5 ",
                                          style: TextStyle(
                                            fontSize: width * 0.016,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
