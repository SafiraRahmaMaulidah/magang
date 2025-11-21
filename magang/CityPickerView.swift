//
//  CityPickerView.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//


import SwiftUI

struct CityPickerView: View {
//    @ObservedObject var vm: HomeViewModel
  @StateObject var vm = HomeViewModel()

    var body: some View {
        NavigationView {
//            List(vm.cities, id: \.self) { city in
//                Button {
//                    vm.selectCity(city)
//                } label: {
//                    HStack {
//                        Text(city)
//                        Spacer()
//                        if vm.selectedCity == city {
//                            Image(systemName: "checkmark").foregroundColor(.pink)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Pilih Kota")
        }
    }
}


//#Preview {
//    CityPickerView()
//}
