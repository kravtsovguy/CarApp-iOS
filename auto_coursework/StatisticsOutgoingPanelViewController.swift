//
//  StatisticsOutgoingPanelViewController.swift
//  auto_coursework
//
//  Created by Александр Пономарев on 05.05.17.
//  Copyright © 2017 Alexander Ponomarev. All rights reserved.
//

import UIKit

class StatisticsOutgoingPanelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var carNameLabel: UILabel!
    
    @IBOutlet weak var carDetailsLabel: UILabel!
    
    @IBOutlet weak var statisticsView: UIView!
    
    @IBOutlet weak var userValueLabel: UILabel!
    
    @IBOutlet weak var normalValueLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        let viewLayer = view.layer
        viewLayer.cornerRadius = 8
        
        viewLayer.shadowColor = UIColor.black.cgColor
        viewLayer.shadowOpacity = 0.05
        viewLayer.shadowOffset = CGSize(width: 0, height: 0)
        viewLayer.shadowRadius = 9.0
        view.clipsToBounds = false
        /*
        let topShadow = EdgeShadowLayer(forView: statisticsView, edge: .Top)
        let bottomShadow = EdgeShadowLayer(forView: statisticsView, edge: .Bottom)
        statisticsView.layer.addSublayer(topShadow)
        statisticsView.layer.addSublayer(bottomShadow)
        */
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carNameLabel.text = DataSource.userCar.getName()
        carDetailsLabel.text = DataSource.userCar.descr
        
        /*
        userValueLabel.text = DataSource.consumption == nil ? "-" : String(format: "%.1f", DataSource.consumption!)
        
        let f = {
            if (DataSource.userCar.index != nil) {
                self.normalValueLabel.text = String(format: "%.1f", DataSource.userCar.index!.meanConsumption)
            }
        }
        
        f()
        DataSource.loadCarIndex(completion: f)
        */
        tableView.reloadData()
    }
    
    @IBAction func analyticsTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "analytics")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return DataSource.userCar.measurements.count + 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "totalCell") as! TotalCell
            cell.setCell(array: DataSource.userCar.measurements)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "consumptionCell") as! ConsumptionCell
        cell.setCell(m: DataSource.userCar.measurements[tableView.numberOfRows(inSection: indexPath.section) - indexPath.row - 1])
        return cell
    }
    
    
}
