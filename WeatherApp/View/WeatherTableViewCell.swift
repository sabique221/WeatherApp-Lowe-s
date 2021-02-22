//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by sabique islam on 2/17/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var modelUser: List? {
        didSet{
            cellConfiguration()
        }
    }
    @IBOutlet weak var weatherlbl: UILabel!
    @IBOutlet weak var templbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = UIColor.white
    }
    
    func cellConfiguration() {
        templbl.text = "Temp: " + "\(Int(modelUser!.main.temp.KelvinToFar()))" + "ºF"
        weatherlbl.text = "\(modelUser!.weather[0].main.rawValue)"
    }
    
}
