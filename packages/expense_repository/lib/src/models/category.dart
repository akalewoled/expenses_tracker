import '../entities/entities.dart';

class Category {
  String categoryId;
  String name;
  int totalExpenses;
  String icon; 
  int color;
    
  Category({ 
    //constructors 
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });
//to intilaze our class to nothhing
static final empty = Category(
    categoryId: '', 
    name: '', 
    totalExpenses: 0, 
    icon: '', 
    color: 0
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }


  // to change our values to fire base by changing them to entity 

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }
}