//
//  ViewController.swift
//  CompleteMenu's
//
//  Created by sai madhukar on 03/02/17.
//  Copyright © 2017 sai madhukar. All rights reserved.
//

import UIKit

class HomeController: UIViewController ,UIScrollViewDelegate{
    
    var leftSide : slideView!
    var restButton : UIButton!
    
    
    lazy var pages : PagesCollection = {
        
       var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var page = PagesCollection(frame: .zero, collectionViewLayout: layout)
        page.menuBar = self.menuBar
        return page
        
    }()

    
    var separatorView:UIView = {
        
        var s = UIView()
        s.backgroundColor = UIColor.red
        return s
        
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = UIColor.red
        
        Menusetup()

        menuBarSetup()
       // menuBarButtonsSetup()
        
    }
    
    
    
    var line: UIView!
    
   
    func Menusetup(){
        
        let label = UILabel()
        label.text = "Youtube"
        label.backgroundColor = UIColor.red
        label.font = UIFont(name: "AvenirNext-Bold", size: 17)
        label.textColor = UIColor.white
        
        let customView = UIView(frame: CGRect(x: self.view.bounds.width - 32, y: 0, width: 120, height: 40))
        customView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateMenuIn)))
        customView.isUserInteractionEnabled = true
        customView.addSubview(label)
        customView.backgroundColor = UIColor.clear
        label.frame = customView.bounds
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
        leftSide = slideView(frame: CGRect(x: -self.view.bounds.width, y: 0, width: self.view.bounds.width * 0.6 , height: self.view.bounds.height))
        restButton = UIButton(frame: .zero)
        leftSide.restButton = restButton
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    
   
    
    let menuBar: MenuBar = {
        let mv = MenuBar()
        mv.backgroundColor = UIColor.red
        return mv
    }()
    
    
    func menuBarSetup()
    {
        view.addSubview(menuBar)
        view.addSubview(separatorView)
        pages.backgroundColor = .white
        view.addSubview(pages)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : menuBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : separatorView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : pages]))
        
        
       
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0(35)]", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : menuBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0(5)]", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : separatorView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : pages]))
        
        
        
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.page = pages
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        pages.translatesAutoresizingMaskIntoConstraints  = false
        line = UIView()
        separatorView.addSubview(line)
        line.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width / 4, height: 10)
        line.backgroundColor = UIColor.white
        separatorView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        
        pages.topAnchor.constraint(equalTo: separatorView.bottomAnchor).isActive = true
       
        pages.line = self.line
        
        
        print("separator view height \(separatorView.bounds.height)  width = \(separatorView.bounds.width)")
    
    }
    
    
    
    private func menuBarButtonsSetup()
    {
        
        
        //search Button
        let searchButton = UIButton()
        searchButton.addTarget(self, action: #selector(self.searchButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let searchImage = #imageLiteral(resourceName: "search").withRenderingMode(.alwaysTemplate)
        searchButton.setBackgroundImage(searchImage, for: .normal)
        searchButton.frame = CGRect(x: view.bounds.width - 60, y: 0, width: 25, height: 25)
        let searchBtn = UIBarButtonItem(customView: searchButton)
        searchButton.tintColor = UIColor.white
        print("search button created")
        
        //more Button
        let moreButton = UIButton()
        moreButton.addTarget(self, action: #selector(self.moreButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let moreImage = #imageLiteral(resourceName: "1482962115_More_Functions_Menu_Vertical_Dots_Hidden").withRenderingMode(.alwaysTemplate)
        
        moreButton.setBackgroundImage(moreImage, for: .normal)
        moreButton.frame = CGRect(x: view.bounds.width - 25, y: 0, width: 25, height: 25)
        let moreBtn = UIBarButtonItem(customView: moreButton)
        moreButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreBtn,searchBtn]
        
    }

    @objc private func searchButtonPressed(_ sender: UIBarButtonItem)
    {
        
        animateMenuOut()
        print("Search Button Pressed")
        
    }
    
    @objc private func moreButtonPressed(_ sender: UIBarButtonItem)
    {
      //  animateMenuOut()
        print("More Button pressed")
        let _ = moreView(data: ["Chromo Cast","Watch Later","Setting"])
        
        
       
    }

    
    
    @objc func animateMenuIn()
    {
        
       // print("menu must appear now")
        restButton.addTarget(self, action: #selector(animateMenuOut), for: UIControlEvents.touchUpInside)
        restButton.backgroundColor = UIColor.black
        restButton.alpha = 0
        restButton.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(restButton)
        view.addSubview(leftSide)
        leftSide.page = pages
        UIView.animate(withDuration: 0.5, animations: {
            
            self.restButton.frame = CGRect(x: 0 , y: 0, width: self.view.bounds.width , height: self.view.bounds.height)
            self.leftSide.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.6, height: self.view.bounds.height)
            self.restButton.alpha = 0.5
            
        })
        
        
    }
    @objc func animateMenuOut()
    {
        restButton.alpha = 1
       // UIView.animate(withDuration: 0.5, animations: {
            
            self.leftSide.frame = CGRect(x: -self.view.bounds.width, y: 0, width: self.view.bounds.width * 0.6, height: self.view.bounds.height)
        leftSide.removeFromSuperview()
        restButton.removeFromSuperview()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

