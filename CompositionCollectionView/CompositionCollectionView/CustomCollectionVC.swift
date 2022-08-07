//
//  CustomCollectionVC.swift
//  CompositionCollectionView
//
//  Created by 안지훈 on 8/6/22.
//

import UIKit

class CustomCollectionVC: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var MyindexPath = IndexPath()
    var int : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        let myCollectionViewCell = UINib(nibName: "CustomCell", bundle: nil)
        self.myCollectionView.register(myCollectionViewCell, forCellWithReuseIdentifier: String(describing: CustomCell.self))
        
        //콜렉션뷰 레이아웃 설정
        self.myCollectionView.collectionViewLayout = myCompositionLayout()

    }

    
    @IBAction func changeButton(_ sender: UIButton) {
        // 특정위치의 indexPath를 받아옴
        let indexPath = IndexPath(item: self.int, section: 0)
        // CustomCell형식의 Cell 만들고 거기에 접근~
        let cell = myCollectionView.cellForItem(at: indexPath) as! CustomCell
        cell.imageName = "xmark"
        if(int != 65 ){
            int += 1
        }
        
    }
}

extension CustomCollectionVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 66
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = String(describing: CustomCell.self)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCell
        
        cell.imageName = "circle"
        let collectionViewHeight = myCollectionView.frame.size.height
        print(collectionViewHeight)
        return cell
    }
    
    
    
}
// 컬렉션뷰 컴퍼지셔널 레이아웃 설정.
extension CustomCollectionVC {
    fileprivate func myCompositionLayout() -> UICollectionViewCompositionalLayout{
        
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex : Int, layoutEnvironment : NSCollectionLayoutEnvironment) ->
            NSCollectionLayoutSection in
            // item 사이즈 설정
            let itemSizeHeight = NSCollectionLayoutDimension.fractionalWidth(1/6)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/6), heightDimension: itemSizeHeight)
            // item 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // item간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            //그룹은 하나로 설정 item높이만큼 그룹설정
            let groupHeight =  NSCollectionLayoutDimension.fractionalHeight(1/6)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: itemSize.heightDimension )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 6)
            
            // 그룹으로 섹션만들기
            let section = NSCollectionLayoutSection(group: group)
            
            return section
            
             
            
        }
        return layout
    }
}
