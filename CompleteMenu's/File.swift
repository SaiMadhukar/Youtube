//
//  File.swift
//  Youtube
//
//  Created by sai madhukar on 21/12/16.
//  Copyright © 2016 sai madhukar. All rights reserved.
//

import Foundation
import UIKit






internal class menuImages {
    
    private var Images = [UIImage]()
    
    init() {
        Images = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "trending"),#imageLiteral(resourceName: "subscriptions"),#imageLiteral(resourceName: "account")]
    }
    
    internal func getImages() -> [UIImage]{
        return Images
    }
    
    internal func checkIndex(index: Int) -> String  {
        
        switch(index)
        {
        case 0:
            return "home"
        case 1:
            return "trending"
        case 2:
            return "subsriptions"
        case 3:
            return "account"
        default: print("Error in setting MenuViewController Index")
        return ""
        }
        
    }
    
    
}
