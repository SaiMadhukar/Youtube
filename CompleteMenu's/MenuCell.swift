//
//  MenuCell.swift
//  Youtube
//
//  Created by sai madhukar on 22/12/16.
//  Copyright © 2016 sai madhukar. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    internal var Img = [UIImage]()
    
    
    let ImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        return iv
    }()
    
    
    
    
    
    override var isHighlighted: Bool{
        didSet{
            ImageView.tintColor = isHighlighted ? UIColor.white : UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
        
    }
    
    override var isSelected: Bool{
        didSet{
               ImageView.tintColor = isSelected ? UIColor.white : UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        mainCell()
        addSubview(ImageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : ImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[v0(30)]-3-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : ImageView]))
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func mainCell()
    {
        let menu = menuImages()
        backgroundColor = UIColor.red
        Img = menu.getImages()
        
    }
    


}
