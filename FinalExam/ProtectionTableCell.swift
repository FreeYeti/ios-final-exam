//
//  ProtectionTableCell.swift
//  FinalExam
//
//  Created by Jack on 2022/8/19.
//

import UIKit

class ProtectionTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func config(title: String, img: UIImage, desc: String){
        titleLabel.text = title
        descImage.image = img
        descLabel.text = desc
    }
}
