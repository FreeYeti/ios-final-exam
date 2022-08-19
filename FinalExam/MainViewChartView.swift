//
//  MainViewChartView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/18.
//

import UIKit
import Charts

class MainViewChartView: UIView, ChartViewDelegate {

    /*
     Not sure is this the best way to load barChart into main view controller?
     I don't find information about hot to add chart to view controller smoothly,
     so create this container first, then put the chart into this container.
     */
    
    var barChart = BarChartView()
    
    override func layoutSubviews() {
        self.clipsToBounds = false
        self.clipsToBounds = false
        
        // for border and background
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = hexStringToUIColor(hex: CONFIG_HIGHLIGHT_COLOR).cgColor
        self.layer.masksToBounds = true
        
        // for shadow
        self.layer.shadowColor = hexStringToUIColor(hex: CONFIG_HIGHLIGHT_COLOR).cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 3)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        
        barChart.delegate = self
        self.chartViewSubview()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "BarChartView", bundle: nil)
    }
    
    // pass data into the chart
    public func config(){
        
    }
    
    func chartViewSubview(){
        // create chart frame
        barChart.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        // position of chart
        // ...
        // barChart.center = self.center // don't know why this error
        
        // add to main view
        self.addSubview(barChart)
        
        // bind data
        let set = BarChartDataSet(entries: [
            BarChartDataEntry(x: 1, y: 1),
            BarChartDataEntry(x: 2, y: 2),
            BarChartDataEntry(x: 3, y: 3),
            BarChartDataEntry(x: 4, y: 4)
        ])
        
        set.colors = ChartColorTemplates.liberty()
        
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }
}
