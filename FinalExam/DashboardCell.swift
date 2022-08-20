//
//  DashboardCell.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import UIKit

class DashboardCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    static let identifier = "DashboardCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func config(title: String, value: String){
        titleLabel.textColor = CONFIG_TEXT_COLOR
        valueLabel.textColor = CONFIG_TEXT_COLOR
        titleLabel.text = title
        valueLabel.text = value
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "DashboardCell", bundle: nil)
    }

}
