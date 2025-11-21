import Foundation

enum TransactionStatus: String, Codable {
    case pending
    case paid
    case canceled
}

struct TransactionModel: Identifiable, Codable {
    var id: String
    var event: Event
    var quantity: Int
    var totalPrice: Int
    var date: Date
    var status: TransactionStatus
}

// MARK: - FORMATTED DATE
extension TransactionModel {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
}

struct Event: Identifiable, Codable {
    var id: String
    var title: String
    var city: String     // <-- pakai city
    var date: String
    var price: Int
    var imageURL: String
}
