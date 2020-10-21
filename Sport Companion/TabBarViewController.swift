//
//  TabBarViewController.swift
//  Sport Companion
//
//  Created by Joshua Lim on 20/10/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    var start = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedIndex = start
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
