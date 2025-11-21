//
//  DataStore.swift
//  magang
//

import Foundation
import Combine

final class DataStore: ObservableObject {
    static let shared = DataStore()
  // hehe
    @Published var events: [Event] = []
    @Published var favorites: [Event] = []
    @Published var transactions: [TransactionModel] = []

    private init() {
        loadSampleData()
    }

    // MARK: - DUMMY DATA
    func loadSampleData() {
        events = [
            Event(id: "1", title: "Konser Tulus", city: "Jakarta", date: "25 Nov 2025", price: 250000, imageURL: ""),
            Event(id: "2", title: "Festival Musik Bandung", city: "Bandung", date: "28 Nov 2025", price: 150000, imageURL: ""),
            Event(id: "3", title: "Pameran Anime", city: "Surabaya", date: "10 Des 2025", price: 50000, imageURL: "")
        ]
    }

    // MARK: - FAVORITE
    func toggleFavorite(_ event: Event) {
        if favorites.contains(where: { $0.id == event.id }) {
            favorites.removeAll { $0.id == event.id }
        } else {
            favorites.append(event)
        }
    }

    func isFavorite(_ event: Event) -> Bool {
        favorites.contains(where: { $0.id == event.id })
    }

    // MARK: - CHECKOUT
  func checkout(_ event: Event, qty: Int = 1) {
      let trx = TransactionModel(
          id: UUID().uuidString,
          event: event,
          quantity: qty,
          totalPrice: Int (event.price * qty),
          date: Date(),
          status: .paid
      )

      transactions.append(trx)

      // 🔥 Hanya hapus event yang di-checkout
      favorites.removeAll { $0.id == event.id }
  }

}
