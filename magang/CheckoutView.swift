// CheckoutView.swift — Menampilkan ringkasan event, memilih jumlah tiket, dan lanjut ke metode pembayaran

import SwiftUI  // Framework UI deklaratif untuk Apple platforms

struct CheckoutView: View {  // View untuk proses checkout

    @ObservedObject var dataStore = DataStore.shared  // Referensi shared data store yang diamati untuk perubahan data
    let event: Event  // Event yang sedang di-checkout (judul, kota, tanggal, harga)

    @State private var quantity = 1  // Jumlah tiket yang dipilih user (state lokal)
    @Environment(\.presentationMode) var presentationMode  // Environment untuk mengontrol presentasi/navigasi (jika diperlukan untuk dismiss)

    var total: Int {  // Komputasi total harga berdasarkan harga event x jumlah
        event.price * quantity  // Mengalikan harga satuan dengan kuantitas
    }  // Akhir properti terhitung total

    var body: some View {  // Deskripsi hierarki UI
        ScrollView {  // Membuat konten dapat di-scroll jika melebihi layar
            VStack(spacing: 20) {  // Menyusun konten secara vertikal dengan jarak 20pt

                // IMAGE: placeholder untuk gambar event
                Rectangle()  // Placeholder bentuk persegi panjang untuk gambar
                    .fill(Color.gray.opacity(0.2))  // Warna abu-abu muda transparan sebagai latar
                    .frame(height: 200)  // Tinggi gambar 200pt
                    .cornerRadius(12)  // Sudut membulat 12pt
                    .overlay(Text("Gambar Event").foregroundColor(.gray))  // Teks overlay sebagai penanda placeholder

                // EVENT INFO: detail dasar event
                VStack(alignment: .leading, spacing: 10) {  // Stack vertikal rata kiri, jarak 10pt
                    Text(event.title)  // Judul event
                        .font(.title.bold())  // Gaya font judul tebal

                    Label(event.city, systemImage: "mappin.and.ellipse")  // Kota event dengan ikon lokasi
                    Label(event.date, systemImage: "calendar")  // Tanggal event dengan ikon kalender
                    Label("Rp \(event.price)", systemImage: "ticket")  // Harga per tiket dengan ikon tiket
                }
                .frame(maxWidth: .infinity, alignment: .leading)  // Lebar penuh, konten rata kiri
                .padding()  // Padding dalam kartu info
                .background(Color.white)  // Latar putih untuk kartu
                .cornerRadius(12)  // Sudut membulat kartu 12pt
                .shadow(radius: 4)  // Bayangan lembut untuk elevasi

                // QTY SELECTOR: pemilih jumlah tiket
                HStack {  // Susun label dan stepper secara horizontal
                    Text("Jumlah Tiket")  // Label judul pemilih jumlah
                        .font(.headline)  // Gaya headline untuk penekanan

                    Spacer()  // Mendorong stepper ke kanan

                    Stepper(value: $quantity, in: 1...10) {  // Stepper untuk mengubah kuantitas antara 1 hingga 10
                        Text("\(quantity)")  // Menampilkan nilai kuantitas saat ini
                    }
                }
                .padding(.horizontal)  // Padding kiri-kanan untuk baris pemilih jumlah

                Divider()  // Garis pemisah bagian

                // TOTAL PRICE: ringkasan total pembayaran
                HStack {  // Susun label dan nilai total secara horizontal
                    Text("Total Pembayaran")  // Label untuk total
                        .font(.headline)  // Gaya headline
                    Spacer()  // Mendorong nilai total ke kanan
                    Text("Rp \(total)")  // Menampilkan total harga terhitung
                        .font(.title3.bold())  // Gaya font menonjol untuk nilai total
                }
                .padding(.horizontal)  // Padding kiri-kanan untuk baris total

                // ACTION: navigasi ke pemilihan metode pembayaran
                NavigationLink(destination: PaymentMethodView(event: event, quantity: quantity)) {  // Link navigasi ke PaymentMethodView membawa event & quantity
                    Text("Bayar Sekarang")  // Label tombol bayar
                        .foregroundColor(.white)  // Warna teks putih untuk kontras
                        .frame(maxWidth: .infinity)  // Tombol melebar selebar mungkin
                        .padding()  // Padding internal tombol
                        .background(Color.pink)  // Latar tombol warna pink
                        .cornerRadius(12)  // Sudut membulat tombol 12pt
                }
                .padding(.horizontal)  // Padding kiri-kanan area tombol

            }  // Akhir konten utama
            .padding(.horizontal)  // Padding kiri-kanan keseluruhan konten
            .padding(.top, 10)  // Jarak atas kecil untuk pemisahan
            .padding()  // Padding luar untuk ScrollView content
        }  // Akhir ScrollView
        .navigationTitle("Checkout")  // Judul navigasi di bar atas
    }  // Akhir body
}  // Akhir struct CheckoutView

