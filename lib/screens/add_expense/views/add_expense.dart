import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/delete_catagoty/delete_catagory_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/views/category_creation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  // DateTime selectDate = DateTime.now();
  late Expense expense;
  bool isLoading = false;

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    expense = Expense.empty;
    expense.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return BlocListener<CreateExpenseBloc, CreateExpenseState>(// the first  state provider using it as litiner  listner
      listener: (context, state) {
        if(state is CreateExpenseSuccess) {
          Navigator.pop(context, expense);// go back to add expense  screen if we have set the state to 
        } else if(state is CreateExpenseLoading) {
          setState(() {
            isLoading = true;
          });
        }
        
      },
      child: GestureDetector(// the create catagories content 

        onTap: () => FocusScope.of(context).unfocus(),// if we have touched  out side the screen  
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(// for ging back    
            backgroundColor: Theme.of(context).colorScheme.background,
          ), 
          body: 

          BlocBuilder<GetCategoriesBloc, GetCategoriesState>(// second  state management provider 
            builder: (context, state) {
              
              if (state is GetCategoriesSuccess) { //if the state is on getting catagoris state
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(                         // title of the page
                        "Add Expenses",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      SizedBox(// for addin the amount of or expense 
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: expenseController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              FontAwesomeIcons.dollarSign,
                              size: 16,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30), 
                              borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      TextFormField(//the text fo3eld to add the catagories 
                        controller: categoryController,
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        onTap: () {// call the delte catagories function 
                          // deleteCategory(context);

                        },//no fucntin if we click beacouse it is read only  
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: expense.category == Category.empty ? Colors.white : Color(expense.category.color),
                          prefixIcon: expense.category == Category.empty//adding the icon
                            ? const Icon(
                                FontAwesomeIcons.list,
                                size: 16,
                                color: Colors.grey,
                              )
                            : Image.asset(
                                'assets/${expense.category.icon}.png',
                                scale: 2,
                              ),
                          suffixIcon: IconButton(// the plus button
                            onPressed: () async {
                              var newCategory = await getCategoryCreation(context);
                              setState(() {
                                state.categories.insert(0, newCategory);// adding new catagories to cagories stack 
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.plus,
                              size: 16,
                              color: Colors.grey,
                            )
                          ),
                          hintText: 'Category',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)), borderSide: BorderSide.none),
                        ),
                      ),

                      Container(// the list of catagories
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        child: Padding(//listing the exoenses 
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: state.categories.length,


                            itemBuilder: (context, int i) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      expense.category = state.categories[i];
                                      categoryController.text = expense.category.name;
                                    });
                                  },
                                  onLongPress: () {
                                     showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('do you want to delete this catagory'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                                 context.read<DeleteCatagoryBloc>().add(DeleteCatagory(state.categories[i]));
                                             

                                              Navigator.pop(ctx);
                                                
                                              
                                            },
                                            child: const Text('OK'),
                                          )
                                        ],
                                      );
                                    }
                                  );
                               
                                
                                  },

                                  leading: Image.asset(
                                    'assets/${state.categories[i].icon}.png',
                                    scale: 2,
                                  ),
                                  title: Text(state.categories[i].name),
                                  tileColor: Color(state.categories[i].color),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              );
                            }
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // date picker
                      TextFormField(
                        controller: dateController,//udating value of date
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(context: context, initialDate: expense.date, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));

                          if (newDate != null) {
                            setState(() {
                              dateController.text = DateFormat('dd/MM/yyyy').format(newDate);
                              // selectDate = newDate;
                              expense.date = newDate;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            FontAwesomeIcons.clock,
                            size: 16,
                            color: Colors.grey,
                          ),
                          hintText: 'Date',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      // the save button 
                      SizedBox(
                        width: double.infinity,
                        height: kToolbarHeight,
                        child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  expense.amount = int.parse(expenseController.text);
                                });
                               if (expense.amount>0 && expense.category!= Category.empty){
                                  
                                  context.read<CreateExpenseBloc>().add(CreateExpense(expense));
                              }else{
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text('Category name must be at least 5 characters long and icon must be selected'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(ctx);
                                            },
                                            child: const Text('OK'),
                                          )
                                        ],
                                      );
                                    }
                                  );
                                }
                              },
                              style: TextButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 22, color: Colors.white),
                              )
                            ),
                      )
                    ],
                  ),
                );
              } 
              else { //in case therie is connection we show prograss indicater 
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
