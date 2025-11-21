//
//  DetailEventView.swift
//  magang
//

import SwiftUI
import Combine

struct DetailEventView: View {

    @ObservedObject var dataStore = DataStore.shared
    let event: Event

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 220)
                    .cornerRadius(10)
                    .overlay(Text("Gambar Event"))

                // Info Event
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.title)
                        .font(.title.bold())

                    Text(event.city)
                        .foregroundColor(.gray)
                    Text(event.date)
                        .foregroundColor(.gray)
                }

                // Favorite Button
                Button {
                    dataStore.toggleFavorite(event)
                } label: {
                    HStack {
                        Image(systemName: dataStore.isFavorite(event) ? "heart.fill" : "heart")
                        Text(dataStore.isFavorite(event) ? "Hapus dari Favorit" : "Tambah ke Favorit")
                    }
                    .foregroundColor(.pink)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink.opacity(0.15))
                    .cornerRadius(10)
                }

                // Checkout Button
                NavigationLink(destination: CheckoutView(event: event)) {
                    Text("Checkout Sekarang")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .navigationTitle("Detail Event")
    }
}
