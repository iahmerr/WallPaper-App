//
//  HorizontalTilesCollectionViewCellViewModel.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import Foundation
import Combine


class HorizontalTilesCollectionViewCellViewModel {
    
    var title: AnyPublisher<String?, Never> { titleSubject.eraseToAnyPublisher() }
    
    private var subscriptions = Set<AnyCancellable>()
    private let titleSubject = CurrentValueSubject<String?, Never>(nil)
    
    init(name: String) {
        self.titleSubject.send(name)
    }
}
