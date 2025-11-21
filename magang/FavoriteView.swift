//
//  FavoriteView.swift
//  magang
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var dataStore = DataStore.shared

    var body: some View {
        NavigationView {

            VStack {
                // Empty State
                if dataStore.favorites.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)

                        Text("Belum ada favorit")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 80)

                // List Favorite
                } else {
                    List {
                        ForEach(dataStore.favorites) { event in

                            NavigationLink(destination: DetailEventView(event: event)) {

                                HStack {

                                    // Placeholder image
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                        .overlay(Text("Img"))

                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(event.title)
                                            .font(.headline)

                                        Text(event.city)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }

                                    Spacer()

                                    Button {
                                        dataStore.checkout(event)
                                    } label: {
                                        Text("Checkout")
                                            .foregroundColor(.pink)
                                            .font(.caption)
                                            .padding(6)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(Color.pink, lineWidth: 1)
                                            )
                                    }
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorit")
        }
    }
}
