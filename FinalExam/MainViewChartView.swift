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
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var barChart = BarChartView()
    
    override func layoutSubviews() {
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
