import UIKit

class MenuBar: UIView,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    
    private var menu = menuImages()
    var page: PagesCollection!
    
    
    
   lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.red
        return cv
        
    }()
    
    
    
    var type : Int!
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(collectionView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil , views: ["v0" : collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : collectionView]))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menu")
        backgroundColor = UIColor.red
        
        
        //taking HomeController as Delegate
        
    }
    
    public func torch(i: Int) {
        
        let index = IndexPath(row: i, section: 0)
        collectionView.selectItem(at: index, animated: false, scrollPosition: [])
        
    }

   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCell
        menuCell.ImageView.image = menuCell.Img[indexPath.row].withRenderingMode(.alwaysTemplate)
        menuCell.ImageView.tintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        menuCell.ImageView.contentMode = .scaleAspectFit
        let index = NSIndexPath(row: 0, section: 0) as IndexPath
        collectionView.selectItem(at: index, animated: true, scrollPosition: .top)
        menuCell.backgroundColor = UIColor.red
        return menuCell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          print(frame.height)
        return CGSize(width: frame.width/4 , height: frame.height)
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        type = Int(indexPath.row)
        print("menu button \(type!) is selected")
        page.goTo(index: indexPath)
        
        
    }
   
 
    
    
}
