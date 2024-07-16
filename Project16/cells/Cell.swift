//
//  Cell.swift
//  Project16
//
//  Created by Niwat on 25/6/2567 BE.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
   
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
