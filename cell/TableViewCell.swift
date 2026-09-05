//
//  TableViewCell.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 30/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewDescription: UILabel!
    @IBOutlet weak var tableViewRating: UILabel!
    @IBOutlet weak var tableViewTitle: UILabel!
    @IBOutlet weak var TAbleImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
