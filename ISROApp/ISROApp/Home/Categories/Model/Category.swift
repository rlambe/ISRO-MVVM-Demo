//
//  Category.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

struct Category {
    private(set) var name: String
    private(set) var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
