//
//  MenuTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/7/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tabBarController?.navigationItem.title = "Menu"
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case 2:
            print("My Goals")
        goToMyGoals()
            
        case 3:
            print("Matrix")
            goMatrix()
            
        case 4:
            print("Share")
            shareAppInfo(textShare: "My share text")
            
        case 5:
            openEmailApp(email: "kuralaybiehler@gmail.com")
            
        default:
            break
        }
    }
    

    func goToMyGoals() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let goToVC = sb.instantiateViewController(withIdentifier: "myGoals") as? MyGoalsViewController {
            navigationController?.pushViewController(goToVC, animated: true)
            
        }
    }
    
    func goMatrix() {
        let matrix1 = UIStoryboard(name: "Main", bundle: nil)
        if let goMat = matrix1.instantiateViewController(withIdentifier: "matrix") as? MatrixViewController {
            navigationController?.pushViewController(goMat, animated: true)
            
        }
    }
    
    // MARK: - Share text
    func shareAppInfo(textShare: String) {
        let actView = UIActivityViewController(activityItems: [textShare], applicationActivities: [])
        present(actView, animated: true)
    }
    }
    

    func openEmailApp(email: String) {
        
        if let url = URL(string: "mailto: \(email)") {
            UIApplication.shared.open(url)

        
    
}


}
    



