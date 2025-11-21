import SwiftUI

struct PaymentMethodView: View {
    @ObservedObject var dataStore = DataStore.shared
    let event: Event
    let quantity: Int
    
    @State private var selectedMethod = ""
    @State private var goToSuccess = false
    @State private var newTransaction: TransactionModel?

    @Environment(\.presentationMode) var presentationMode
    
    var total: Int {
        event.price * quantity
    }
    
    let methods = [
        ("bca", "BCA Virtual Account"),
        ("bni", "BNI Virtual Account"),
        ("gopay", "GoPay"),
        ("shopeepay", "ShopeePay")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Event info
                    Text(event.title)
                        .font(.title.bold())
                    
                    Label(event.city, systemImage: "mappin.and.ellipse")
                    Label(event.date, systemImage: "calendar")
                    Label("Rp \(event.price)", systemImage: "ticket")
                    
                    // PAYMENT SELECTION
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Pilih Metode Pembayaran")
                            .font(.headline)
                        
                        ForEach(methods, id: \.0) { method in
                            Button {
                                selectedMethod = method.0
                            } label: {
                                HStack {
                                    Text(method.1)
                                    Spacer()
                                    if selectedMethod == method.0 {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Total
                    HStack {
                        Text("Total Pembayaran")
                        Spacer()
                        Text("Rp \(total)")
                            .bold()
                    }
                    .padding(.horizontal)
                    .font(.title3)
                    
                     //BUTTON BAYAR
                  Button {
                      guard !selectedMethod.isEmpty else { return }
                      dataStore.checkout(event, qty: quantity)
                      newTransaction = dataStore.transactions.last   // simpan transaksi terakhir
                      goToSuccess = true
                  } label: {
                      Text("Bayar Sekarang")
                          .foregroundColor(.white)
                          .frame(maxWidth: .infinity)
                          .padding()
                          .background(Color.pink)
                          .cornerRadius(12)
                  }

                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationTitle("Metode Pembayaran")
            .navigationDestination(isPresented: $goToSuccess) {
                if let trx = newTransaction {
                    PaymentSuccessView(transaction: trx)
                }
            }

        }
    }
}
