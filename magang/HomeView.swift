//
//  HomeView.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//

import SwiftUI
import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedCity = ""
    @Published var events: [Event] = []

    let allIndonesianCities: [String] = [
        "Jakarta", "Bogor", "Depok", "Tangerang", "Bekasi",
        "Bandung", "Cimahi", "Cirebon", "Tasikmalaya", "Garut",
        "Semarang", "Salatiga", "Solo", "Magelang", "Tegal",
        "Yogyakarta",
        "Surabaya", "Malang", "Kediri", "Blitar", "Mojokerto", "Pasuruan", "Probolinggo", "Banyuwangi",
        "Denpasar", "Badung", "Gianyar", "Tabanan",
        "Medan", "Binjai", "Pematangsiantar", "Tebing Tinggi",
        "Palembang", "Lubuklinggau", "Prabumulih",
        "Padang", "Bukittinggi", "Payakumbuh",
        "Pekanbaru", "Dumai",
        "Batam", "Tanjung Pinang",
        "Bandar Lampung", "Metro",
        "Pontianak", "Singkawang",
        "Banjarmasin", "Banjarbaru",
        "Samarinda", "Balikpapan", "Bontang",
        "Manado", "Bitung", "Tomohon",
        "Makassar", "Parepare", "Palopo",
        "Kendari", "Baubau",
        "Gorontalo",
        "Ambon", "Tual",
        "Ternate", "Tidore",
        "Mataram", "Bima",
        "Kupang",
        "Jayapura", "Sorong"
    ]

    init() {
        loadDummyEvents()
    }

    func loadDummyEvents() {
        events = [
            Event(id: "1", title: "Konser Tulus", city: "Jakarta", date: "25 Nov 2025", price: 250000, imageURL: ""),
            Event(id: "2", title: "Festival Musik", city: "Bandung", date: "28 Nov 2025", price: 150000, imageURL: ""),
            Event(id: "3", title: "Pameran Anime", city: "Surabaya", date: "10 Des 2025", price: 50000, imageURL: "")
        ]
    }

    // 👇 FILTER OTOMATIS
    var filteredEvents: [Event] {
        events.filter { event in

            // 1. Filter berdasarkan search text
            let matchSearch = searchText.isEmpty ||
                              event.title.lowercased().contains(searchText.lowercased())

            // 2. Filter kota
            let matchCity = selectedCity.isEmpty ||
                            event.city == selectedCity

            return matchSearch && matchCity
        }
    }
}


struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {

                    // Search Bar
                    TextField("Cari event...", text: $viewModel.searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    // Pilih Kota
                    Picker("Pilih Kota", selection: $viewModel.selectedCity) {
                        Text("Semua Kota").tag("")
                        ForEach(viewModel.allIndonesianCities, id: \.self) { city in
                            Text(city).tag(city)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)

                    // Event Terdekat
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Event Terdekat")
                            .font(.headline)
                            .padding(.leading)

                      ForEach(viewModel.filteredEvents) { event in
                          NavigationLink(destination: DetailEventView(event: event)) {
                              EventCard(event: event)
                          }
                      }


                        }
                    }
                }
            }
            .navigationTitle("Home")
        }
    }

