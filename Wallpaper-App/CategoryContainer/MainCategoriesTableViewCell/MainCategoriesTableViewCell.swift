//
//  MainCategoriesTableViewCell.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import UIKit

class MainCategoriesTableViewCell: UITableViewCell {

    private var viewModel: MainCategoriesTableViewCellViewModel?
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(viewModel: MainCategoriesTableViewCellViewModel){
        self.viewModel = viewModel
    }
    
}

extension MainCategoriesTableViewCell {
    
    func setupViews(){
        
    }
    
    func bind() {
        
    }
}
