import SwiftUI
import Foundation
import Combine

// MARK: - VIEW MODEL
class TransactionHistoryViewModel: ObservableObject {
    @Published var transactions: [TransactionModel] = []

    init() {
        loadDummyData()
    }

    func loadDummyData() {
        let dummyEvent = Event(
            id: "e0",
            title: "Dummy Event",
            city: "Jakarta",   // <-- city
            date: "20 Nov 2025",
            price: 100000,
            imageURL: ""
        )

        transactions = [
            TransactionModel(
                id: "TRX001",
                event: dummyEvent,
                quantity: 1,
                totalPrice: 250000,
                date: Date(),
                status: .paid
            ),
            TransactionModel(
                id: "TRX002",
                event: dummyEvent,
                quantity: 2,
                totalPrice: 150000,
                date: Date(),
                status: .pending
            ),
            TransactionModel(
                id: "TRX003",
                event: dummyEvent,
                quantity: 1,
                totalPrice: 50000,
                date: Date(),
                status: .paid
            )
        ]
    }
}


// MARK: - VIEW
struct TransactionHistoryView: View {
  @ObservedObject var dataStore = DataStore.shared

 
    var body: some View {
        NavigationView {
          List(dataStore.transactions) { trx in

                HStack {
                    VStack(alignment: .leading, spacing: 6) {

                        Text(trx.event.title)
                            .font(.headline)

                        Text(trx.formattedDate)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("Total: Rp \(trx.totalPrice)")
                            .font(.subheadline)
                    }

                    Spacer()

                    Text(trx.status.rawValue.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(trx.status == .pending ? Color.orange.opacity(0.2) : Color.green.opacity(0.2))
                        .foregroundColor(trx.status == .pending ? .orange : .green)
                        .cornerRadius(8)
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("Riwayat Transaksi")
        }
    }
}
