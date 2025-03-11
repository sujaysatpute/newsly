import 'package:flutter/widgets.dart';
import 'package:newsly/models/category_model.dart';

List<CategoryModel> getCategories(){
   // List<CategoryModel> category = new List<CategoryModel>();
   List<CategoryModel> category = [];

   CategoryModel categoryModel= new CategoryModel();


  // 1
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1c3NpbmVzc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel =new CategoryModel() ;

   //2
   // categoryModel = new categoryModel();
   categoryModel.categoryName = "Entertainment";
   categoryModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
    category.add(categoryModel);

   //3
   categoryModel = new CategoryModel();
   categoryModel.categoryName = "General";
   categoryModel.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
    category.add(categoryModel);

   //4
   categoryModel = new CategoryModel();
   categoryModel.categoryName = "Health";
   categoryModel.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
    category.add(categoryModel);

   //5
   categoryModel = new CategoryModel();
   categoryModel.categoryName = "Science";
   categoryModel.imageUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
    category.add(categoryModel);

   //5
   categoryModel = new CategoryModel();
   categoryModel.categoryName = "Sports";
   categoryModel.imageUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
    category.add(categoryModel);

   //5
   categoryModel = new CategoryModel();
   categoryModel.categoryName = "Technology";
   categoryModel.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
    category.add(categoryModel);


  return category;

}

