//
//  BotTableViewCell.swift
//  BOTBURG
//
//  Created by Arturo Jamaica on 2021/05/09.
//

import UIKit
import Charts

class BotTableViewCell: UITableViewCell {

    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var shadowView: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let data = dataWithCount(7, range: 100)
                    data.setValueFont(UIFont(name: "HelveticaNeue", size: 7)!)
        
        setupChart(self.lineChartView, data: data,color: .clear)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupChart(_ chart: LineChartView, data: LineChartData, color: UIColor) {
            
            chart.backgroundColor = color
            
            chart.chartDescription.enabled = false
            
            chart.dragEnabled = true
            chart.setScaleEnabled(true)
            chart.pinchZoomEnabled = false
            chart.setViewPortOffsets(left: 10, top: 0, right: 10, bottom: 0)
            
            chart.legend.enabled = false
            
            chart.leftAxis.enabled = false
            chart.leftAxis.spaceTop = 0.4
            chart.leftAxis.spaceBottom = 0.4
            chart.rightAxis.enabled = false
            chart.xAxis.enabled = false
            
            chart.data = data
            
            chart.animate(xAxisDuration: 2.5)
        }
    
    func dataWithCount(_ count: Int, range: UInt32) -> LineChartData {
         let yVals = (0..<count).map { i -> ChartDataEntry in
             let val = Double(arc4random_uniform(range)) + 3
             return ChartDataEntry(x: Double(i), y: val)
         }
         
         let set1 = LineChartDataSet(entries: yVals, label: "DataSet 1")
         
         set1.lineWidth = 1.75
         set1.circleRadius = 5.0
         set1.circleHoleRadius = 2.5
         set1.setColor(.white)
         set1.setCircleColor(.white)
         set1.highlightColor = .white
         set1.drawValuesEnabled = false
         
         return LineChartData(dataSet: set1)
     }
}

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    private func setupShadow() {
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.1
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
