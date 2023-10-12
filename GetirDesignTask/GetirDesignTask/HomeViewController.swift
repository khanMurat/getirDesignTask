//
//  HomeViewController.swift
//  GetirDesignTask
//
//  Created by Murat on 12.10.2023.
//

import Foundation
import UIKit

class HomeViewController : UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarAppearance()
        collectionViewLayout()
    }
    
    
    func setupNavBarAppearance(){
        
        let image = UIImageView(image: UIImage(named: "getirlogo"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.systemIndigo
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    func collectionViewLayout(){
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let width = UIScreen.main.bounds.width
        
        let itemWidth = (width - 50) / 4
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        
        collectionView.collectionViewLayout = flowLayout
    }
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.homeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        cell.homeImage.image = viewModel.homeList[indexPath.row].image
        
        cell.homeLabel.text = viewModel.homeList[indexPath.row].name
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HomeHeaderCollectionReusableView
        
        return header
    }
        
}

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
    
}
