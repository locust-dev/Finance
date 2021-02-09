//
//  MainTableCell.swift
//  Finance
//
//  Created by Илья Тюрин on 08.02.2021.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
}
