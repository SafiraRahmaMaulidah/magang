////
////  PaymentSuccessView.swift
////  magang
////
////  Created by MacBook Pro M1 on 20/11/25.
////
//
//import SwiftUI
//
//struct PaymentSuccessView: View {
//
//    let transaction: TransactionModel
//
//    var body: some View {
//        VStack(spacing: 25) {
//
//            // Icon sukses
//            Image(systemName: "checkmark.circle.fill")
//                .font(.system(size: 90))
//                .foregroundColor(.green)
//
//            Text("Pembayaran Berhasil!")
//                .font(.title.bold())
//
//            VStack(alignment: .leading, spacing: 12) {
//                Text("Event: \(transaction.event.title)")
//                Text("Kota: \(transaction.event.city)")
//                Text("Tanggal Event: \(transaction.event.date)")
//                Text("Jumlah Tiket: \(transaction.quantity)")
//                Text("Total Pembayaran: Rp \(transaction.totalPrice)")
//
//                Divider()
//
//                Text("Kode Booking")
//                    .font(.headline)
//                Text(transaction.id)
//                    .font(.title3.bold())
//                    .foregroundColor(.pink)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//
//            Spacer()
//
//            // Tombol kembali
//            NavigationLink(destination: MainTabView()) {
//                Text("Kembali ke Beranda")
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.pink)
//                    .cornerRadius(12)
//            }
//            .padding(.horizontal)
//        }
//        .padding(.top, 40)
//        .navigationBarBackButtonHidden(true) // tidak boleh balik ke pembayaran
//    }
//}
//
//  PaymentSuccessView.swift
//  magang
//

import SwiftUI

struct PaymentSuccessView: View {
    @Environment(\.dismiss) var dismiss          // untuk menutup halaman
    let transaction: TransactionModel

    var body: some View {
        VStack(spacing: 25) {// tambahin if else if pending paid canceled, refund

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 90))
                .foregroundColor(.green)

            Text("Pembayaran Berhasil!")
                .font(.title.bold())

            VStack(alignment: .leading, spacing: 12) {
                Text("Event: \(transaction.event.title)")
                Text("Kota: \(transaction.event.city)")
                Text("Tanggal Event: \(transaction.event.date)")
                Text("Jumlah Tiket: \(transaction.quantity)")
                Text("Total Pembayaran: Rp \(transaction.totalPrice)")

                Divider()

                Text("Kode Booking")
                    .font(.headline)
                Text(transaction.id)
                    .font(.title3.bold())
                    .foregroundColor(.pink)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            Spacer()

            // Tombol kembali
            Button {
                dismiss()
                dismiss()   // tutup semua halaman pembayaran sampai kembali ke home
            } label: {
                Text("Kembali ke Beranda")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
        .padding(.top, 40)
        .navigationBarBackButtonHidden(true)
    }
}
