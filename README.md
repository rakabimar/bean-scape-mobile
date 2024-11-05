# bean-scape-mobile
Platform Based Programming (PBP) Course --- Tugas Individu --- Flutter
Rakabima Ghaniendra Rusdianto - 2306228472

## Bookmarks
- [Tugas 7](#tugas-7)

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
    ```
    final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.coffee, const Color(0xFF603F26)),
    ItemHomepage("Tambah Produk", Icons.add, const Color(0xFF6C4E31)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFFFDBB5)),
    ];
    ```
    - Implementing SnackBar for Each Button: Within each button widget (`ItemCard`), `InkWell` was applied to make the buttons clickable. When tapped (`onTap`), a `SnackBar` message is displayed using `ScaffoldMessenger`, with each button showing a different message according to its function:
    ```
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