//
//  CategoryService.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

struct CategoryService {
    
    private let categories = [
        Category(name: "Spacecraft", imageName: ""),
        Category(name: "Launchers", imageName: ""),
        Category(name: "Centres", imageName: "")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
}
