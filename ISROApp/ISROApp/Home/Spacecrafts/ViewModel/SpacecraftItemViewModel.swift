//
//  SpacecraftItemViewModel.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

class SpacecraftItemViewModel {
    
    private let spacecraft: Spacecraft!
    
    var spacecraftId: String {
        return "Id: \(spacecraft.id)"
    }
    
    var spacecraftName: String {
        return "Name: \(spacecraft.name)"
    }
    
    init(spacecraft: Spacecraft) {
        self.spacecraft = spacecraft
    }
}
