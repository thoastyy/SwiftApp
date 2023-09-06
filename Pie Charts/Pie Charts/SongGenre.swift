//
//  PetData.swift
//  BookstoreStategist
//
//  Created by Karin Prater on 20.07.23.
//

import Foundation


struct SongGenre: Identifiable, Equatable{
    let year: Int
    
    // population is in million
    let population: Double
    
    var id: Int { year }
    
    static var catExamples: [SongGenre] {
        [SongGenre(year: 2022, population: 9)]
    }
    
    static var dogExamples: [SongGenre] {
        [SongGenre(year: 2022, population: 1)]
    }
}

struct MusicGenre: Identifiable {
    let value: Int
    let name: String
    
    var id: Int {
        value
    }
}

    let genreExamples: [MusicGenre] =
    [
        .init(value: 10, name: "Orange"),
        .init(value: 20, name: "Blue"),
        .init(value: 30, name: "Indigo"),
        .init(value: 40, name: "Purple"),
        .init(value: 50, name: "Cyan"),
        .init(value: 60, name: "Teal")
    ]
