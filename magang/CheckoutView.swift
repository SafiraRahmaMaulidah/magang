//
//  CheckoutView.swift
//  magang
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var dataStore = DataStore.shared
    let event: Event

    @State private var quantity = 1
    @Environment(\.presentationMode) var presentationMode

    var total: Int {
        event.price * quantity
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // IMAGE
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .cornerRadius(12)
                    .overlay(Text("Gambar Event").foregroundColor(.gray))

                // EVENT INFO
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.title)
                        .font(.title.bold())

                    Label(event.city, systemImage: "mappin.and.ellipse")
                    Label(event.date, systemImage: "calendar")
                    Label("Rp \(event.price)", systemImage: "ticket")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 4)

                // QTY SELECTOR
                HStack {
                    Text("Jumlah Tiket")
                        .font(.headline)

                    Spacer()

                    Stepper(value: $quantity, in: 1...10) {
                        Text("\(quantity)")
                    }
                }
                .padding(.horizontal)

                Divider()

              // Total Price
              HStack {
                  Text("Total Pembayaran")
                      .font(.headline)
                  Spacer()
                  Text("Rp \(total)")
                      .font(.title3.bold())
              }
              .padding(.horizontal)

              // Pindah ke Payment Method
              NavigationLink(destination: PaymentMethodView(event: event, quantity: quantity)) {
                  Text("Bayar Sekarang")
                      .foregroundColor(.white)
                      .frame(maxWidth: .infinity)
                      .padding()
                      .background(Color.pink)
                      .cornerRadius(12)
              }
              .padding(.horizontal)
              .padding(.top, 20)

                .padding(.horizontal)
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle("Checkout")
    }
}
