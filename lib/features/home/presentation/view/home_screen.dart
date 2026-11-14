import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/widgets/producted_item_widget.dart';
import 'package:shopping_app/features/home/data/models/catrgories_list_model.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_imp.dart';
import 'package:shopping_app/features/home/presentation/view_model/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = HomeCubit(HomeRepoImp(HomeDataSourceImp()))..getAllCategories();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 100),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: cubit..getAllCategories(),
              builder: (context, state) {
                if (state is HCError) {
                  return Text(state.message);
                }
                if (state is HCSuccess) {
                  return SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryItmWidger(
                        category: state.categoriesList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 6),
                      itemCount: state.categoriesList.length,
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HPError) {
                  return Text(state.message);
                }
                if (state is HPSuccess) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 30,
                        childAspectRatio: 163 / 288,
                      ),
                      itemBuilder: (context, index) => ProductedItemCard(
                        title: "Product",
                        discount: 10,
                        price: 8.99,
                        rating: 4,
                        image: "https://static.vecteezy.com/system/resources/thumbnails/072/193/074/small_2x/professionalgraphy-gear-laid-out-neatly-on-a-dark-surface-featuring-camera-body-lenses-and-tripod-photo.jpg",
                        onTap: () {},
                        favoriteOnTap: Icon(Icons.favorite),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItmWidger extends StatelessWidget {
  const CategoryItmWidger({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.blackDark),
      ),
      child: Text(
        category.name ?? "",
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
