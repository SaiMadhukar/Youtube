//
//  VideosCollectionViewCell.swift
//  CompleteMenu's
//
//  Created by sai madhukar on 04/02/17.
//  Copyright © 2017 sai madhukar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideosCollectionViewCell: UICollectionViewCell ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate{

    private var MainTitle = "I Love This Games ∙●‣ BlackBox"
    private var Comment = "BlackBox ∙•‣ 1,32,435 views ∙•‣ 2 years"
    

     var pagenumber = 0
    var videosCollection: UICollectionView = {
    
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return vc
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func create(){
        
        if(pagenumber != 3)
        {
            videosCollection.register(YoutubeCell.self, forCellWithReuseIdentifier: "videos")
            addSubview(videosCollection)
            videosCollection.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
            videosCollection.backgroundColor = .clear
            print("pagenumber = \(pagenumber)")
            
            videosCollection.delegate = self
            videosCollection.dataSource = self
            videosCollection.clipsToBounds = true
        }
        else{
            print("page \(pagenumber) not created")
        }

    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videos", for: indexPath) as! YoutubeCell
            cell.backgroundColor = UIColor.clear
            cell.ImageView.image = UIImage(named: "\(indexPath.row % 7)")
            cell.userProfileImageView.image = UIImage(named: "\(indexPath.row % 7)")
            cell.mainLabel.text = MainTitle
            cell.commentLabel.text = Comment
            return cell
        
     
        
    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
       
        let height = bounds.width * 9 / 16
        return CGSize(width: bounds.width, height: height + 85)
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     print("index \(indexPath.row) is selected by the user")
}



}
