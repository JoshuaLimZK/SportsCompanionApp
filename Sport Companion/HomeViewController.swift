//
//  HomeViewController.swift
//  Sport Companion
//
//  Created by Joshua Lim on 20/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var deviceButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var upImage: UIImageView!
    @IBOutlet weak var downImage: UIImageView!
    
    var upImageNumber = Int.random(in: 1...2)
    var downImageNumber = Int.random(in: 1...2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deviceButton.layer.cornerRadius = 10
        settingsButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        upImageNumber = Int.random(in: 1...2)
        downImageNumber = Int.random(in: 1...2)
        
        print("Up Image is \(upImageNumber)")
        print("Up Image is \(downImageNumber)")

        
        upImage.image = UIImage(named: "\(upImageNumber)2")
        downImage.image = UIImage(named: "\(downImageNumber)1")

    }

    override func viewDidAppear(_ animated: Bool) {

        
        var hasAlreadyLaunched :Bool!
        
        
        hasAlreadyLaunched = UserDefaults.standard.bool(forKey: "hasAlreadyLaunched")//check first launched
        if (hasAlreadyLaunched) {
            
            hasAlreadyLaunched = true
            
            print("second+")
            
            
        } else {
            
            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
            print("First")
            seguePerform()
        }
        
    }
    
    func seguePerform() {
        performSegue(withIdentifier: "firstLogin", sender: nil)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "devices", sender: nil)
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        performSegue(withIdentifier: "settings", sender: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "settings" {
            let tabBarViewController = segue.destination as! TabBarViewController
            tabBarViewController.start = 2
        }
        
        if segue.identifier == "devices" {
            let tabBarViewController = segue.destination as! TabBarViewController
            tabBarViewController.start = 1
        }
        
    }
    

}
