//
//  slideView.swift
//  Youtube
//
//  Created by sai madhukar on 19/01/17.
//  Copyright © 2017 sai madhukar. All rights reserved.
//

import UIKit

class slideView: UIView,UITableViewDelegate,UITableViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var page : PagesCollection?
    lazy var tableView : UITableView = {
        
       var tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.frame = .zero
        return tv
        
    }()
    var restButton: UIButton?
    private var array = [String]()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        array = ["Home","Trending","Subscription","Account"]
    
        backgroundColor = UIColor.red
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableMenu")
        print("step 2")
        tableView.frame = bounds
        tableView.autoresizesSubviews = true
        addSubview(tableView)
        tableView.backgroundColor = UIColor.red
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
       
    }
    
    lazy var closeButton = UIButton()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableMenu")
        cell?.textLabel?.text = array[indexPath.row]
        cell?.textLabel?.font = UIFont(name: "AvenirNext-Bold", size: 22)
        cell?.textLabel?.textColor = UIColor.white
        cell?.backgroundColor = UIColor.red
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        removeFromSuperview()
        restButton?.removeFromSuperview()
        page?.goTo(index: indexPath)
        print("\(indexPath.row)is selected")
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
