import '../utils/all_utils.dart';

class MbxOnboardingModel {
  int onboarding_id = 0;
  String image = '';
  String title = '';
  String description = '';

  MbxOnboardingModel();

  MbxOnboardingModel.fromJason(Jason jason) {
    onboarding_id = jason['onboarding_id'].intValue;
    image = jason['image'].stringValue;
    title = jason['title'].stringValue;
    description = jason['description'].stringValue;
  }

  MbxOnboardingModel.fromMap(Map<String, dynamic> map) {
    onboarding_id = map.getInt('onboarding_id');
    image = map.getString('image');
    title = map.getString('title');
    description = map.getString('description');
  }

  Map<String, dynamic> toMap() {
    return {
      'onboarding_id': onboarding_id,
      'image': image,
      'title': title,
      'description': description,
    };
  }
}
