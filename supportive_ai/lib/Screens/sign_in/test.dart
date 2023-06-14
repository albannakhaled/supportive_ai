// class _SignInState extends State<SignIn> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false; // Add a boolean flag to track loading state

//   Future<void> login(
//       String username, String password, BuildContext context) async {
//     final url = Uri.parse('http://127.0.0.1:8000/login/');

//     setState(() {
//       _isLoading = true; // Set loading flag to true when starting the login process
//     });

//     final response = await http.post(
//       url,
//       body: {'username': username, 'password': password},
//     );

//     setState(() {
//       _isLoading = false; // Set loading flag to false after receiving the response
//     });

//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);
//       final String token = responseData['token'];

//       // Login successful, you can store the authentication token here
//       print('Logged in successfully! Token: $token');

//       // Navigate to the home page
//       Navigator.pushNamed(context, 'home');
//     } else {
//       // Login failed, display an error message to the user
//       print('Login failed. Status code: ${response.statusCode}');
//     }
//   }

//   void _handleLogin(BuildContext context) {
//     final username = _usernameController.text;
//     final password = _passwordController.text;

//     login(username, password, context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight =
//         context.height - appbarHeight - MediaQuery.of(context).padding.top;
//     final screenWidth = context.width;
//     return Scaffold(
//       // ...

//       body: SafeArea(
//         child: Container(
//           // ...

//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: screenHeight * 0.1, horizontal: screenWidth * 0.1),
//               child: SafeArea(
//                 child: Center(
//                   child: Container(
//                     // ...

//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // ...

//                         // sign in button
//                         SizedBox(height: screenHeight * 0.05),
//                         SizedBox(
//                           height: screenHeight * 0.07,
//                           child: _isLoading // Display circular progress if loading
//                               ? CircularProgressIndicator() // Show circular progress
//                               : MyButton(
//                                   onPressed: () => _handleLogin(context),
//                                   text: "Sign In",
//                                 ),
//                         ),

//                         // ...
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
