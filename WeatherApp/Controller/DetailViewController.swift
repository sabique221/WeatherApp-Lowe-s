//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by sabique islam on 2/17/21.
//

import UIKit

class DetailViewController: UIViewController {
    var temp: String? = "0"
    var feelsLike: String? = ""
    var main: String? = ""
    var des: String? = ""
    var city: String? = ""
    
    @IBOutlet weak var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.backBarButtonItem?.title = city!.capitalized
        navigationController?.navigationBar.clearsContextBeforeDrawing = true
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.backgroundColor = UIColor.systemBlue
        navigationController?.viewRespectsSystemMinimumLayoutMargins = false
        self.detailView.configureView(temp: temp!, feelsLike: feelsLike!, main: main!, description: des!)
    }
  
    
}
