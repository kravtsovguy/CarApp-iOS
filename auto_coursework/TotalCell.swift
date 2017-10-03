//
//  TotalCell.swift
//  auto_coursework
//
//  Created by Matvey Kravtsov on 02/10/2017.
//  Copyright © 2017 Alexander Ponomarev. All rights reserved.
//

import UIKit

class TotalCell: UITableViewCell {

    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    func setCell(array: [Measurement]) {
        
        dateLabel.text = ""
        costLabel.text = "Нет данных"
        
        if array.count > 0 {
            let dateFormatterFrom = DateFormatter()
            dateFormatterFrom.dateFormat = "01.MM.yyyy"
            
            let dateFormatterTo = DateFormatter()
            dateFormatterTo.dateFormat = "dd.MM.yyyy"
            
            dateLabel.text = dateFormatterFrom.string(from: array.last!.date) + " - " + dateFormatterTo.string(from: array.last!.date)
            
            let calendar = Calendar.current
            let month = calendar.component(.month, from: array.last!.date)
            
            var cost = 0.0
            for m in array {
                if (month == calendar.component(.month, from: m.date)) {
                    cost += m.cost * m.fuel
                }
            }
            costLabel.text = "Потрачено за месяц \(Int(cost)) руб"
        }
    }

}
