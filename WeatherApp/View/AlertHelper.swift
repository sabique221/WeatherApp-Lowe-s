//
//  AlertHelper.swift
//  WeatherApp
//
//  Created by sabique islam on 2/17/21.
//

import Foundation
import UIKit

class AlertHelper {
    
    var vc: UIViewController
    
    init(vc: UIViewController) {
        self.vc = vc
    }
        
    func showAlert(title: String?, message: String?){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .default) {(action: UIAlertAction!) in
            self.vc.navigationController?.popToRootViewController(animated: true)
        }
        ac.addAction(action1)
        vc.present(ac, animated: true)
        
    }
    
}
