# bean-scape-mobile
Platform Based Programming (PBP) Course --- Tugas Individu --- Flutter
Rakabima Ghaniendra Rusdianto - 2306228472

## Bookmarks
- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)

## Tugas 7 <a id="tugas-7"></a>
1. **Stateless Widget and Stateful Widget**

    - A `Stateless Widget` is a widget that does not store or manage any internal state. It is built once and does not change unless it is rebuilt by its parent widget. Examples include Text and Icon.

    - A `Stateful Widget` is a widget that can store and manage an internal state that may change over the widget's lifecycle. This widget has a separate State object to handle changes. Examples include Checkbox and TextField.

    - Key Differences:

        * Stateful widgets can change during runtime, while stateless widgets remain the same.
        * Stateful widgets use the setState() method to update the UI when the state changes.
        * Stateless widgets are lightweight and best suited for static data or fixed layouts that don’t change after being built.

2. **Widgets Used in This Project and Their Functions**
    - `MaterialApp`: The main widget that provides basic themes and navigation structure for a Flutter app.
    - `Scaffold`: Supplies the basic visual layout for the app, such as an AppBar and a body.
    - `AppBar`: Displays an application bar at the top of the screen with a title.
    - `Padding`: Adds padding around a child widget.
    - `Column`: Organizes child widgets vertically.
    - `SizedBox`: Adds empty space of a fixed size between widgets.
    - `ElevatedButton.icon`: Creates a button with both an icon and text.
    - `SnackBar`: Shows temporary messages at the bottom of the screen.
    - `Icon & Text`: Displays icons and text, typically within a button or layout.

3. **Function of `setState()` and Affected Variables**
    - The `setState()` function in a stateful widget lets Flutter know that the widget’s state has changed and the UI needs to be refreshed. When `setState()` is called, the `build()` method is re-executed to update the UI with the latest state.

    - Affected Variables:
        * Any variables declared within the State object representing the widget’s state.
        * Properties that determine the appearance or behavior of the widget based on the value of those variables.

4. **Difference between const and final**
    - **const**: Used to define a constant value that is known at compile-time. The value must be initialized during declaration and cannot be changed thereafter.
    - **final**: Used for variables that are assigned a value only once and cannot be altered afterward. Unlike const, the value can be determined at runtime, not only at compile-time.

5. **Explanation of Implementation Steps**
    - Creating a New Flutter Project: Start by running the command `flutter create <APP_NAME>` to create a new project, then navigate into the project directory using `cd <APP_NAME>`.
    - Creating Three Buttons with Icons and Text: Three buttons were created using `ItemHomepage`, each with a unique name, icon, and color:
    ```dart
    final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.coffee, const Color(0xFF603F26)),
    ItemHomepage("Tambah Produk", Icons.add, const Color(0xFF6C4E31)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFFFDBB5)),
    ];
    ```
    - Implementing SnackBar for Each Button: Within each button widget (`ItemCard`), `InkWell` was applied to make the buttons clickable. When tapped (`onTap`), a `SnackBar` message is displayed using `ScaffoldMessenger`, with each button showing a different message according to its function:
    ```dart
    child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        ...
    ```

    - Running the Application: After completing the implementation, run the application using the `flutter run` command.

## Tugas 8 <a id="tugas-8"></a>
1. **Purpose and Benefits of `const` in Flutter**
    - The `const` keyword in Flutter indicates that a widget or value is immutable and will not change during runtime. Using `const` helps optimize performance by allowing Flutter to reuse the same object in memory instead of creating new instances.
    - Benefits:
        * Performance: Widgets marked with `const` are only built once and reused, reducing rebuilds during hot reloads or updates.
        * Code Clarity: Clearly indicates immutability, making the code easier to reason about.
        * Memory Efficiency: Avoids multiple identical instances of widgets or values.
    - When to Use:
        * Use `const` for widgets or values that are static and do not depend on runtime values, such as:
        ```dart
        const Text('Hello World');
        ```
        * In constructors where the properties are marked as final and do not change:
        ```dart
        const Icon(Icons.star);
        ```
    - When Not to Use:
        * Do not use `const` if the widget depends on dynamic or runtime variables, such as user inputs or state updates.
2. **Comparison Between Column and Row**
    - Column:
        * Arranges widgets vertically (from top to bottom).
        * Can align children using properties like crossAxisAlignment and mainAxisAlignment.
        * Suitable for vertical lists or stacking elements.
        * Example: (`menu.dart`)
        ```dart
        ...
        child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to beanScape',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
        ...
        ```
    - Row:
        * Arranges widgets horizontally (from left to right).
        * Useful for creating horizontal layouts like buttons in a toolbar.
        * Example: (`menu.dart`)
        ```dart
        ...
        // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
        ...
        ```
3. **Form Input Elements in the Code**
    - Used Elements:
        * **`TextFormField`**: For inputs like name, price, description, amount, and bitterness.
        * **`DropdownButtonFormField`**: For selecting a category.
        * **`ElevatedButton`**: For the save action.
    - Unused Elements:
        * Widgets like `Switch`, `Checkbox`, or `RadioButton` are not used in the current form but can be helpful in specific use cases. For instance, Switch could be used to toggle between options like "In Stock" or "Out of Stock".

4. Managing Themes in Flutter
    - To ensure consistency in the app's look and feel, themes are managed using the `ThemeData` class. This allows you to define global styles for text, colors, buttons, etc.
    - Implementation: (`main.dart`)
    ```dart
    ...
    MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.brown,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
            textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.black),
            ),
        ),
    );
    ...
    ```
    - Theme in the Code:
        * The code implements theme colors for `AppBar` and buttons using `Theme.of(context).colorScheme.primary`.

5. **Handling Navigation in Flutter with Push, Pop, and PushReplacement**

   - **`Navigator.push`**:
     - Adds a new route (page) to the navigation stack.
     - The new page is displayed on top of the current page.
     - **Example**:
       ```dart
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => ProductEntryFormPage()),
       );
       ```
     - Use this when navigating to a new screen while keeping the current screen in the stack (e.g., opening a details page).

   - **`Navigator.pop`**:
     - Removes the current route (page) from the navigation stack and returns to the previous route.
     - Typically used when navigating back.
     - **Example**:
       ```dart
       Navigator.pop(context);
       ```
     - Use this to close a page and return to the one underneath (e.g., closing a form page to return to the home page).

   - **`Navigator.pushReplacement`**:
     - Replaces the current route with a new one, removing the current route from the stack.
     - No option to return to the previous route as it is removed.
     - **Example**:
       ```dart
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => HomePage()),
       );
       ```
     - Use this when the user shouldn't return to the previous page (e.g., replacing a login screen with the home page after successful authentication).