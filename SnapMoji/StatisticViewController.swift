//
//  StatisticViewController.swift
//  SnapMoji - Team 10
//
//  Description of StatisticsViewController:
//  Retrieves data on past tests stored onto Firebase and displays the data onto
//  various charts based on difficulty and test type.
//
//
//  Worked on by:   Josh Baltar
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  2.0 - Charts pod installed
//  3.0 - Displays statistics onto chart for all difficulties
//
//  Known bugs:
//  Currently no known bugs
//
//  Created by zza92 on 11/22/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import Charts

//these arrays are used for storing the test scores for the varying difficulties
var testScoreEasyArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var testScoreMediumArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var testScoreHardArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var testScoreDescriptionArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

class StatisticViewController: UIViewController {
    
    //outlets to control the chart titles and the chart itself
    @IBOutlet weak var statsChart: LineChartView!
    @IBOutlet weak var statsChartLabel: UILabel!
    
    //function to execute when any of the stats buttons are pressed
    @IBAction func statsButtonTapped(_ sender: UIButton) {
        if sender.tag > 0 { //tag used as the identifier for each button
            let count = 15
            let difficulty = sender.tag
            //count = the amount of data points, difficulty = difficulty of test results to view
            setChartValues(count, difficulty: difficulty)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //easy chart initially loaded
        setChartValues(difficulty: 1)
    }
    
    //function to change the chart values depenging on the difficulty pressed
    //function creates the chart and defines the values in the chart
    func setChartValues(_ count: Int = 15, difficulty: Int) {
        
        let values = (0..<count).map { (i) -> ChartDataEntry in
            //using a double for the score
            var val = Double(testScoreEasyArray[i])
            if difficulty == 1 {
                val = Double(testScoreEasyArray[i])
            } else if difficulty == 2 {
                val = Double(testScoreMediumArray[i])
            } else if difficulty == 3 {
                val = Double(testScoreHardArray[i])
            } else if difficulty == 4 {
                val = Double(testScoreDescriptionArray[i])
            }
            
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        
        //define values and label for the chart
        var set1 = LineChartDataSet(values: values, label: "DataSet 1")
        
        //change title depending on the title
        if difficulty == 1{
            set1 = LineChartDataSet(values: values, label: "Easy")
            statsChartLabel.text = "Test Results - Easy"
        } else if difficulty == 2{
            set1 = LineChartDataSet(values: values, label: "Medium")
            statsChartLabel.text = "Test Results - Medium"
        } else if difficulty == 3{
            set1 = LineChartDataSet(values: values, label: "Hard")
            statsChartLabel.text = "Test Results - Hard"
        } else if difficulty == 4{
            set1 = LineChartDataSet(values: values, label: "Descriptions")
            statsChartLabel.text = "Test Results - Descriptions"
        }
        
        let data = LineChartData(dataSet: set1)
        
        self.statsChart.data = data
    }
    
}
