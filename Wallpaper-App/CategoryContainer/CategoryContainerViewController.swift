//
//  CategoryContainerViewController.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import UIKit

class CategoryContainerViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    private var selectedCell = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        setupViews()
    }
    
    func setupViews() {
       
        let nib = UINib(nibName: "HorizontalTilesCollectionViewCell", bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: "HorizontalTilesCollectionViewCell")
        
        colorsCollectionView.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        
        tableView.register(UINib(nibName: "MainCategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCategoriesTableViewCell")
    }

}

extension CategoryContainerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
           return getCategoriesCollectionViewCell(indexPath: indexPath)
        }
        else {
          return getColorsCollectionViewCell(indexPath: indexPath)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = indexPath.row
        DispatchQueue.main.async {[categoriesCollectionView] in
            categoriesCollectionView?.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 75, height: 40)
        }
        else {
            return CGSize(width: 70, height: 70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoriesCollectionView {
            return 2
        }
        else {
            return 10
        }
    }
}

extension CategoryContainerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVm = MainCategoriesTableViewCellViewModel()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCategoriesTableViewCell") as! MainCategoriesTableViewCell
        cell.configure(viewModel: cellVm)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    
}

extension CategoryContainerViewController {
    
    func getColorsCollectionViewCell(indexPath: IndexPath)-> ColorsCollectionViewCell {
        
        let colorViewModel = ColorsCollectionViewCellViewModel()
        let cell = colorsCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as! ColorsCollectionViewCell
        cell.configure(viewModel: colorViewModel)
        return cell
    }
    
    func getCategoriesCollectionViewCell(indexPath: IndexPath)-> UICollectionViewCell {
        let viewModel = HorizontalTilesCollectionViewCellViewModel(name: "Apple")
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalTilesCollectionViewCell", for: indexPath) as! HorizontalTilesCollectionViewCell
        cell.cardView.backgroundColor = .white
        cell.titleLabel.textColor = .black
        cell.titleLabel.font = UIFont(name: "PlusJakartaSans-Bold", size: 14)
        if indexPath.row == selectedCell {
            cell.cardView.backgroundColor = UIColor.appColor(ofType: .tileSoft)
        }
        cell.configure(viewModel: viewModel)
        return cell
    }
}
