abstract class Model<T> {
  T copy();

  T fromJson(json);

  Map<String, dynamic> toJson();
}
