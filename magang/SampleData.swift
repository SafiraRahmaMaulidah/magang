//
//  SampleData.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//


import Foundation

enum SampleData {
    static let sampleEvents: [Event] = [
        Event(
            id: "e1",
            title: "Live Music Festival",
            city: "Jakarta",
            date: "20 Des 2025",
            price: 250_000,
            imageURL: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=1200"
        ),
        Event(
            id: "e2",
            title: "Tech Expo 2025",
            city: "Bandung",
            date: "12 Nov 2025",
            price: 150_000,
            imageURL: "https://images.unsplash.com/photo-1551836022-d5d88e9218df?w=1200"
        ),
        Event(
            id: "e3",
            title: "Marathon Run",
            city: "Bali",
            date: "01 Jan 2026",
            price: 100_000,
            imageURL: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200"
        ),
        Event(
            id: "e4",
            title: "Food Festival",
            city: "Surabaya",
            date: "08 Feb 2026",
            price: 75_000,
            imageURL: "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=1200"
        )
    ]
}
