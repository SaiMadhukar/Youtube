//
//  VideoPlayer.swift
//  CompleteMenu's
//
//  Created by sai madhukar on 12/02/17.
//  Copyright © 2017 sai madhukar. All rights reserved.
//

import UIKit

class VideoPlayer: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restorationIdentifier = "VideoPlayer"
        
            view.backgroundColor = UIColor.blue

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
