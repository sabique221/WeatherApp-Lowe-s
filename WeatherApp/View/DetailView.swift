//
//  DetailView.swift
//  WeatherApp
//
//  Created by sabique islam on 2/17/21.
//

import UIKit

@IBDesignable
final class DetailView: UIView {
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var feelsLikeLbl: UILabel!
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "DetailView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureView(temp: String, feelsLike: String, main: String, description: String) {
        self.tempLbl.text = temp
        self.feelsLikeLbl.text = feelsLike
        self.mainLbl.text = main
        self.DescriptionLbl.text = description
    }

}
