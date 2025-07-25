import 'package:mbxflutter/utils/all_utils.dart';

class MbxOnboardingModel {
  int onboardingId = 0;
  String image = '';
  String title = '';
  String description = '';

  MbxOnboardingModel();

  MbxOnboardingModel.fromJason(Jason jason) {
    onboardingId = jason['onboarding_id'].intValue;
    image = jason['image'].stringValue;
    title = jason['title'].stringValue;
    description = jason['description'].stringValue;
  }

  MbxOnboardingModel.fromMap(Map<String, dynamic> map) {
    onboardingId = map.getInt('onboarding_id');
    image = map.getString('image');
    title = map.getString('title');
    description = map.getString('description');
  }

  Map<String, dynamic> toMap() {
    return {
      'onboarding_id': onboardingId,
      'image': image,
      'title': title,
      'description': description,
    };
  }
}
