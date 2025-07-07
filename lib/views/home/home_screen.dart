import '../../utils/exports/app_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stripe Payments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              CustomTextField(
                controller: amountController,
                hintText: 'Amount',
                keyboardType: TextInputType.number,
                bordercolor: Colors.black,
                obscureText: false,
                focusedBorderColor: Colors.blue,
                onChanged: (val) {
                  homeProvider.setAmount(val);
                  print("Amount input: ${amountController.text}");
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: currencyController,
                hintText: 'Currency (e.g. usd)',
                obscureText: false,
                onChanged: (val) {
                  homeProvider.setCurrency(val);
                  print("Currency input: ${currencyController.text}");
                },
                bordercolor: Colors.blue,
                borderRadius: 20,
              ),
              const SizedBox(height: 24),
              CustomActionButton(
                buttonText: 'Pay',
                onTap: () => homeProvider.pay(context),
                isEnabled: true,
                isLoading: false,
                height: 45,
                width: 150,
                backgroundColor: Colors.blue,
                buttonTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
