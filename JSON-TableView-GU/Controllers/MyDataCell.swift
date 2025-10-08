//
//  MyDataCell.swift
//  JSON-TableView-GU
//
//  Created by Jaimin Raval on 30/09/25.
//

import UIKit

class MyDataCell: UITableViewCell {

    @IBOutlet weak var setupLbl: UILabel!
    @IBOutlet weak var punchLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
