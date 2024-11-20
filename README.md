# bean-scape-mobile
Platform Based Programming (PBP) Course --- Tugas Individu --- Flutter
Rakabima Ghaniendra Rusdianto - 2306228472

## Bookmarks
- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)
- [Tugas 9](#tugas-9)

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

## Tugas 9 <a id="tugas-9"></a>
1. **Why Do We Need to Create a Model for Retrieving or Sending JSON Data? Will an Error Occur If We Don't Create a Model First?**

   - **Purpose of Models in JSON Data Handling:**
     - **Structured Data Representation:** Models provide a structured way to represent data within the application. They define the schema of the data, including field types and relationships, which aligns with the data received from or sent to the server.
     - **Ease of Data Parsing and Serialization:** With models, you can easily parse JSON data into Dart objects and serialize Dart objects back into JSON. This simplifies data manipulation and ensures consistency in how data is handled.
     - **Type Safety and Code Maintenance:** Models enforce type safety, reducing runtime errors due to type mismatches. They make the code more readable and maintainable by providing clear data structures.

   - **Consequences of Not Using Models:**
     - **Increased Complexity:** Without models, you would have to manually parse JSON data using dynamic types, which can lead to complex and error-prone code.
     - **Runtime Errors:** The absence of models increases the risk of runtime errors due to incorrect assumptions about the data structure or types.
     - **Maintenance Challenges:** Code becomes harder to maintain and debug without predefined structures, especially as the application grows in complexity.
     - **No Immediate Compilation Error:** While the application may not produce a compilation error without models, it can fail at runtime due to data handling issues.

2. **Function of the http Library Implemented in This Task**

   - **HTTP Communication:**
     - The `http` library in Flutter is used to perform network requests to communicate with web servers over HTTP/S protocols.
     - It allows the application to send various types of requests such as GET, POST, PUT, DELETE, etc.

   - **Data Retrieval and Submission:**
     - **Retrieving Data:** Use `http.get()` to fetch data from a server, which is essential for displaying dynamic content retrieved from APIs.
     - **Submitting Data:** Use `http.post()` and other methods to send data to the server, such as user inputs or form submissions.

   - **Asynchronous Operations:**
     - The library supports asynchronous programming using `Future` and `async/await`, ensuring the UI remains responsive while waiting for network operations to complete.

   - **Handling Responses:**
     - It provides mechanisms to handle HTTP responses, including status codes and response bodies.
     - Supports decoding of JSON responses using `jsonDecode()` for further processing within the app.

   - **Error Handling:**
     - Facilitates error handling for network-related issues like timeouts, connection errors, or invalid responses.

3. **Function of CookieRequest and Why Its Instance Needs to Be Shared Across All Components in the Flutter Application**

   - **Function of CookieRequest:**
     - **Session Management:** `CookieRequest` is responsible for maintaining session cookies between the Flutter app and the backend server. This is crucial for keeping the user authenticated across multiple requests.
     - **Stateful Requests:** It attaches cookies to each HTTP request, ensuring that the server can recognize and associate requests with the correct user session.
     - **Simplified API Calls:** Provides a convenient way to perform authenticated API calls without manually handling cookies and headers for each request.

   - **Why Share the Instance Across All Components:**
     - **Consistency:** Sharing a single instance ensures that all parts of the app use the same session data, maintaining a consistent authentication state throughout the app.
     - **Ease of Access:** By making `CookieRequest` accessible to all components (e.g., via the `Provider` package), any widget can perform authenticated requests without reinitializing or passing the instance manually.
     - **State Management:** It centralizes the management of authentication state, making it easier to update or invalidate the session when the user logs out.
     - **Security:** Helps prevent discrepancies or security issues that could arise from having multiple instances with different session states.

4. **Mechanism of Data Transmission from Input Until It Is Displayed on Flutter**

   - **User Input:**
     - The user interacts with input widgets (e.g., `TextField`, `DropdownButton`) to provide data.
     - Input data is captured and stored in variables or controllers within the app.

   - **Data Submission:**
     - Upon form submission or a specific action, the app packages the input data into a suitable format (usually JSON).
     - An HTTP request (e.g., POST) is sent to the server using `http` or `CookieRequest`, including the input data in the request body.

   - **Server Processing:**
     - The server receives the request and processes the data.
     - This may involve validating the data, performing calculations, interacting with a database, or triggering other server-side logic.
     - The server then prepares a response, often including data to be sent back to the client.

   - **Response Handling:**
     - The app receives the server's response, which may be in JSON format.
     - The response data is parsed and converted into Dart objects using models.

   - **Data Display:**
     - The app updates its state with the new data.
     - Widgets are rebuilt to reflect the updated data, often using `setState()` in stateful widgets or through state management solutions.
     - The user sees the updated information displayed on the screen.

   - **Example Flow:**
     1. User fills out a form to add a new product.
     2. User presses the "Save" button.
     3. App sends a POST request with the product data to the server.
     4. Server saves the product and returns a success message or the created product data.
     5. App receives the response and updates the product list.
     6. The new product appears in the product list displayed to the user.

5. **Authentication Mechanism from Login, Register, to Logout**

   - **Login Process:**
     - **User Input:**
       - User enters credentials (username and password) into input fields.
     - **Request to Server:**
       - App sends a POST request to the login endpoint with the credentials.
     - **Server Authentication:**
       - Server verifies credentials against the user database.
       - If valid, the server creates a session and returns a session cookie.
     - **Session Handling:**
       - `CookieRequest` stores the session cookie.
       - All subsequent requests include the cookie, authenticating the user.
     - **Navigating to Protected Areas:**
       - App navigates the user to the main menu or dashboard, indicating a successful login.

   - **Register Process:**
     - **User Input:**
       - User provides registration details (e.g., username, email, password) in the app.
     - **Request to Server:**
       - App sends a POST request to the registration endpoint with user details.
     - **Server Processing:**
       - Server creates a new user account after validating the input data.
     - **Confirmation:**
       - Server responds with a success message or the new user's data.
     - **Post-Registration Action:**
       - App may automatically log the user in or redirect them to the login screen.

   - **Logout Process:**
     - **User Action:**
       - User selects the logout option in the app.
     - **Request to Server:**
       - App sends a GET or POST request to the logout endpoint.
     - **Server Processing:**
       - Server invalidates the user's session, deleting the session cookie.
     - **Session Clearing:**
       - `CookieRequest` clears stored cookies and session data.
     - **Navigating to Login Screen:**
       - App redirects the user to the login screen or shows a confirmation message.

   - **Session Management with CookieRequest:**
     - **Maintaining Authentication State:**
       - `CookieRequest` handles storing and attaching cookies to requests, preserving the authentication state.
     - **Consistency Across App:**
       - Shared `CookieRequest` instance ensures all parts of the app recognize the user's authentication status.
     - **Automatic Cookie Handling:**
       - Simplifies the process of making authenticated requests without manual cookie management.

   - **Error Handling and Feedback:**
     - **Login Errors:**
       - If authentication fails, the server returns an error message.
       - App displays an error dialog or message to the user.
     - **Registration Errors:**
       - Server validates input data and returns errors for issues like duplicate usernames.
       - App informs the user to correct the input.
     - **Logout Confirmation:**
       - App may show a message confirming successful logout.

   - **Security Considerations:**
     - **Secure Storage:**
       - Session cookies and sensitive data are handled securely within the app.
     - **Protected Routes:**
       - App restricts access to certain screens or functionalities unless the user is authenticated.
     - **Data Encryption:**
       - Use HTTPS to encrypt data transmitted between the app and server.

6. **Implementing Checklists**
  1. **Implementing Account Registration Feature in the Flutter Project**

      - **Backend Django:** Utilize a registration endpoint that accepts username and password data, performs necessary validations, and creates a new user account. For example:
        ```
        @csrf_exempt
        def register(request):
            if request.method == 'POST':
                data = json.loads(request.body)
                username = data['username']
                password1 = data['password1']
                password2 = data['password2']

                # Check if the passwords match
                if password1 != password2:
                    return JsonResponse({
                        "status": False,
                        "message": "Passwords do not match."
                    }, status=400)
                
                # Check if the username is already taken
                if User.objects.filter(username=username).exists():
                    return JsonResponse({
                        "status": False,
                        "message": "Username already exists."
                    }, status=400)
                
                # Create the new user
                user = User.objects.create_user(username=username, password=password1)
                user.save()
                
                return JsonResponse({
                    "username": user.username,
                    "status": 'success',
                    "message": "User created successfully!"
                }, status=200)
            
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Invalid request method."
                }, status=400)
        ```
      
      - **Frontend Flutter:** Develop a `register.dart` page that collects username and password inputs from the user. This page then sends the collected data to the Django backend using `pbp_django_auth` for account creation.

  2. **Creating Login Page in the Flutter Project**

      - **Backend Django:** Set up a login endpoint that receives username and password credentials, authenticates the user, and manages the user session.
      
      - **Frontend Flutter:** Create a `login.dart` page featuring a form for users to input their username and password. Upon submission, the app sends these credentials to the backend for authentication using `pbp_django_auth`. If authentication is successful, the user is redirected to the home page.

  3. **Integrating Django Authentication System with Flutter Project**

      - **Using `pbp_django_auth` in the Flutter Project:**
        - Incorporate a Provider for `CookieRequest` in the main widget of the application to manage authentication states. For example:
          ```
          class MyApp extends StatelessWidget {
          const MyApp({super.key});

          @override
          Widget build(BuildContext context) {
            return Provider(
              create: (_) => CookieRequest(),
              child: MaterialApp(
                home: LoginPage(),
              ),
            );
          }
        }
          ```

  4. **Creating Custom Models According to Django Application Project**

      - **Generating Dart Models:**
        - Use Quicktype to generate Dart models from JSON data.
        - Execute the JSON endpoint on Django to retrieve the necessary data.
        - Copy the JSON data and visit the Quicktype website.
        - Paste the JSON data and select Dart as the target language.
        - Create a `models` directory in the Flutter project and save the generated model in a file named `product_entry.dart`.

  5. **Creating a Page That Contains a List of All Items from the JSON Endpoint**

      - **Displaying Data in Flutter:**
        - Fetch JSON data from the Django endpoint and display the list of items in Flutter using `FutureBuilder` and `ListView.builder`.
        - Example code:
          ```
          Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
          final response = await request.get('http://127.0.0.1:8000/user_products_json/');
          ```

  6. **Displaying Name, Price, and Description of Each Item**

      - **Using `ListView.builder`:**
        - Implement `ListView.builder` to iterate through the list of products and display each item's name, price, and description within the UI.

  7. **Creating Detail Page for Each Item**

      - **Developing Detail View:**
        - Create a `product_detail.dart` page within the `screens` directory.
        - Implement navigation from `ProductEntryPage` in `list_productentry.dart` to `ProductDetailPage` in `product_detail.dart`, passing the selected product's ID as a parameter.

  8. **Displaying All Attributes on the Detail Page**

      - **Fetching and Displaying Detailed Data:**
        - Use `FutureBuilder` in `product_detail.dart` to retrieve detailed information about the selected product based on its ID.
        - Display all attributes of the product on the detail page, such as name, price, description, category, and bitterness, using appropriate widgets and layouts.

  9. **Filtering on the Item List Page to Only Display Products Associated with the Logged-In User**

      - **Backend Django:** Create a Django view `user_products_json` that retrieves products linked to the authenticated user. For example:
        ```
        # Function untuk filter json sesuai dengan user logged in
        @login_required
        def user_products_json(request):
            products = Product.objects.filter(user=request.user)
            data = [
                {
                    'model': 'app.productentry',
                    'pk': product.pk,
                    'fields': {
                        'user': product.user.id,
                        'name': product.name,
                        'price': product.price,
                        'description': product.description,
                        'category': product.category,
                        'bitterness': product.bitterness,
                    }
                }
                for product in products
            ]
            return JsonResponse(data, safe=False)
        ```

      - **Frontend Flutter:** Modify the `ProductListPage` to filter the fetched products by comparing the `user` field of each product with the logged-in user's ID. This ensures that only products associated with the current user are displayed in the list.