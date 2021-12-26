//
//  Spacecraft.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

struct SpaceCraftResponse: Codable {
    let spacecrafts: [Spacecraft]
}

struct Spacecraft: Codable {
    let id: Int
    let name: String
}
