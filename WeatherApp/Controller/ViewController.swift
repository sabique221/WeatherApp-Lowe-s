//
//  ViewController.swift
//  WeatherApp
//
//  Created by sabique islam on 2/16/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var cityLabel: UITextField!
    
    @IBAction func SearchButton(_ sender: Any) {
            let searchCity = self.cityLabel.text?.lowercased().replacingOccurrences(of: " ", with: "+").replacingOccurrences(of: ".", with: "")
        let viewController: WeatherViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        viewController.city = searchCity
        viewController.ViewModel = WeatherViewModel()
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.hidesBarsWhenKeyboardAppears = true
        navigationController?.navigationBar.backgroundColor = UIColor.systemBlue
        navigationItem.title = "City Lookup"
        navigationController?.viewRespectsSystemMinimumLayoutMargins = true
    }
}

