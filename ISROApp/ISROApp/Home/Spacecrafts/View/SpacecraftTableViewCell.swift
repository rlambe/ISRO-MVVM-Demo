//
//  SpacecraftTableViewCell.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import UIKit

class SpacecraftTableViewCell: UITableViewCell {
    
    @IBOutlet weak var spacecraftIdLabel: UILabel!
    @IBOutlet weak var spacecraftNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        spacecraftIdLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        spacecraftNameLabel.font = UIFont.systemFont(ofSize: 18)
        spacecraftNameLabel.numberOfLines = 0
        spacecraftNameLabel.textColor = .systemGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension SpacecraftTableViewCell {
    func bind(viewModel: SpacecraftItemViewModel) {
        spacecraftIdLabel.text = viewModel.spacecraftId
        spacecraftNameLabel.text = viewModel.spacecraftName
    }
}
