//
//  PagesCollection.swift
//  CompleteMenu's
//
//  Created by sai madhukar on 03/02/17.
//  Copyright © 2017 sai madhukar. All rights reserved.
//

import UIKit

class PagesCollection: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var colors = [UIColor]()
    var separator : UIView?
    var line : UIView?
    var menuBar : MenuBar?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        register(VideosCollectionViewCell.self, forCellWithReuseIdentifier: "pages")
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "default")
        backgroundColor = UIColor.red
        delegate = self
        dataSource = self
        colors = [.green,.brown,.orange,.purple]
        showsHorizontalScrollIndicator = true
        isPagingEnabled = true
        isScrollEnabled = true
        clipsToBounds = true
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("Scroll view minx = \(scrollView.bounds.minX)  maxX = \(scrollView.bounds.maxX)")
        
        print(scrollView.center.x)
         line?.frame = CGRect(x: scrollView.bounds.minX / 4 , y: 0, width: self.bounds.width / 4, height: 5)
        print("line frame \(String(describing: line?.frame))")
        let pos :Int? = Int(scrollView.bounds.minX / self.bounds.width)
        if pos! >= 0 && pos! < 3 {
         menuBar?.torch(i: pos!)
        }
        
        
        
    }
    
    
    public func goTo(index: IndexPath)
    {
        print("Going to page \(index.row)")
        
        UIView.animate(withDuration: 3, animations: {
        
             self.scrollToItem(at: index, at: [], animated: true)
        })
      
        
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
     
        switch indexPath.row
        {
            
        case 0:
            
            let page0 = dequeueReusableCell(withReuseIdentifier: "pages", for: indexPath) as! VideosCollectionViewCell
            page0.pagenumber = indexPath.row
            page0.create()
            page0.backgroundColor = .clear
            
            return page0
            
        default:
            
            let page = dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)
            page.backgroundColor = .white
            return page
        }
        
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("bounds of page = width = \(self.bounds.width) height = \(self.bounds.height)")
        return CGSize(width: self.bounds.width, height: self.bounds.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("page at \(indexPath.row) is selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
   
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    

}
