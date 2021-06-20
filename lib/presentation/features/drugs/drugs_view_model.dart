import 'package:iherb/data/models/drug_model.dart';
import 'package:stacked/stacked.dart';

class DrugsViewModel extends BaseViewModel {
  List<DrugModel> drugs = [
    DrugModel(
      count: 1,
      date: '09:00',
      mg: 5,
      when: 'После еды',
      type: DrugType.d,
    ),
    DrugModel(
      count: 1,
      date: '09:00',
      mg: 5,
      when: 'До еды',
      type: DrugType.b,
    ),
    DrugModel(
      count: 1,
      date: '09:00',
      mg: 5,
      when: 'Во время еды',
      type: DrugType.c,
    ),
  ];
}
