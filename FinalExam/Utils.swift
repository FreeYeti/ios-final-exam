//
//  Utils.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import Foundation
import UIKit

// ref: https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

// apply style for the cells, use rounded corner and shadow
func styleCollectionViewCell(_ cell: UICollectionViewCell) -> UICollectionViewCell {
    cell.clipsToBounds = false
    cell.contentView.clipsToBounds = false
    
    // for border and background
    cell.contentView.layer.cornerRadius = 10.0
    cell.contentView.layer.borderWidth = 1.0
    cell.contentView.layer.backgroundColor = hexStringToUIColor(hex: CONFIG_SECONDARY_BGCOLOR).cgColor
    cell.contentView.layer.borderColor = hexStringToUIColor(hex: CONFIG_HIGHLIGHT_COLOR).cgColor
    cell.contentView.layer.masksToBounds = true
    
    // for shadow
    cell.layer.shadowColor = hexStringToUIColor(hex: CONFIG_HIGHLIGHT_COLOR).cgColor
    cell.layer.shadowOffset = CGSize(width: 2, height: 3)
    cell.layer.shadowRadius = 5.0
    cell.layer.shadowOpacity = 1
    cell.layer.masksToBounds = false
    cell.layer.shadowPath = UIBezierPath(rect: cell.layer.bounds).cgPath
    return cell
}

// load local json file
// ref: https://stackoverflow.com/questions/64703105/parsing-data-from-local-json-file-swift
func loadJson(filename fileName: String) -> [CovidData]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([CovidData].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

// decode the covid data
func decodeCovidData(covidData: [CovidData]) -> Void {
    for item in covidData {
        print(item.totalConfirmed)
    }
}
