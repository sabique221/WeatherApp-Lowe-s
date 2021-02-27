//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by sabique islam on 2/16/21.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var city: String?
    lazy var ViewModel : WeatherViewModelProtocol? = WeatherViewModel()
    var lists = [List]()
    
    init(city: String, ViewModel: WeatherViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.ViewModel = ViewModel
        self.city =  city
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.isHidden = true
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
        ViewModel?.getAllWeatherData(city: city!, forModel: WeatherModel.self) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let list):
                self.lists = list.list
                DispatchQueue.main.async {
                    self.table.reloadData()
                    self.table.isHidden = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.table.isHidden = true
                    AlertHelper.shared.showAlert(title: "Error", message: error.rawValue, overViewController: self)
                }
            }
            
        }
        self.navigationItem.title = city!.capitalized.replacingOccurrences(of: "+", with: " ")
        navigationController?.navigationBar.clearsContextBeforeDrawing = true
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.backgroundColor = UIColor.systemBlue
        navigationController?.viewRespectsSystemMinimumLayoutMargins = false
        
    }
    
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.feelsLike = "Feels Like: " + String(Int(lists[indexPath.row].main.feels_like.KelvinToFar())) + "ºF"
        vc.temp = String(Int(lists[indexPath.row].main.temp.KelvinToFar())) + "ºF"
        vc.main = lists[indexPath.row].weather[0].main.rawValue
        vc.des = lists[indexPath.row].weather[0].description.capitalized
    
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell
        cell?.modelUser = lists[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


