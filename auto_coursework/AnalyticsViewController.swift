//
//  AnalyticsViewController.swift
//  auto_coursework
//
//  Created by Matvey Kravtsov on 03/10/2017.
//  Copyright © 2017 Alexander Ponomarev. All rights reserved.
//

import UIKit

class AnalyticsViewController: UIViewController {

    @IBOutlet weak var statisticsView: UIView!
    
    @IBOutlet weak var userValueLabel: UILabel!
    
    @IBOutlet weak var normalValueLabel: UILabel!
    
    @IBOutlet weak var carImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let viewLayer = statisticsView.layer
        viewLayer.cornerRadius = 8
        
        viewLayer.shadowColor = UIColor.black.cgColor
        viewLayer.shadowOpacity = 0.05
        viewLayer.shadowOffset = CGSize(width: 0, height: 0)
        viewLayer.shadowRadius = 9.0
        statisticsView.clipsToBounds = false

 */
        let topShadow = EdgeShadowLayer(forView: statisticsView, edge: .Top)
        let bottomShadow = EdgeShadowLayer(forView: statisticsView, edge: .Bottom)
        statisticsView.layer.addSublayer(topShadow)
        statisticsView.layer.addSublayer(bottomShadow)
        
        carImageView.downloadedFrom(link: DataSource.userCar.image)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userValueLabel.text = DataSource.consumption == nil ? "-" : String(format: "%.1f", DataSource.consumption!)
        
        let f = {
            if (DataSource.userCar.index != nil) {
                self.normalValueLabel.text = String(format: "%.1f", DataSource.userCar.index!.meanConsumption)
            }
        }
        
        f()
        DataSource.loadCarIndex(completion: f)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
