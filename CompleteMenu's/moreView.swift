//
//  moreView.swift
//  Youtube
//
//  Created by sai madhukar on 19/01/17.
//  Copyright © 2017 sai madhukar. All rights reserved.
//

import UIKit

class moreView: NSObject,UITableViewDataSource,UITableViewDelegate{

    
    lazy var tableView: UITableView = {
        
        var tv = UITableView()
        tv.backgroundColor = UIColor.blue
        
        return tv
        
    }()
    var blackView = UIView(frame: .zero)
    var data = ["Settings","Account","Offline","Sign Out"]
    
    
    func handle()
    {
        
        print(data)
        if let win = UIApplication.shared.keyWindow {
            
            blackView = UIView(frame: win.frame)
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.6)
            
            print("handle is called")
            win.addSubview(self.blackView)
           
            blackView.isUserInteractionEnabled = true
            
            tableView.delegate = self
            tableView.dataSource = self
            win.addSubview(tableView)
            let height :CGFloat = CGFloat(data.count + 1) * 25.0
            print(height)
            tableView.frame = CGRect(x: 0, y: win.bounds.height - height, width: win.bounds.width, height: height)
            tableView.backgroundColor = UIColor.red
            tableView.separatorStyle = .singleLine
            
            
            
        }
        
    }
    
    func dismiss()
    {
        print("This object wants to dismiss")
        blackView.removeFromSuperview()
       
        
        
    }
    
    var count = 0
    init(data : [String])
    {
        super.init()
        print("MoreView is Created with \(data.count) number of cells")
      //  self.data = data
        count = data.count
        handle()
        print(count)
        
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell")
        cell?.textLabel?.text = data[indexPath.row]
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.tintColor = UIColor.white
        cell?.textLabel?.font = UIFont(name: "AvenirNext", size: 20)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss()
    }
    
    
    
}
