//
//  GenericTableViewDataSource.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 27/12/2021.
//

import UIKit

class GenericTableViewDataSource <CELL: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    // MARK: - Variables
    private let cellIdentifier: String!
    private let items: [T]!
    var configureCell: (CELL,T) -> () = {_, _ in }
    
    // MARK: - Initializer
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL,T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    // MARK: - UITableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        configureCell(cell, items[indexPath.row])
        return cell
    }
    
}
