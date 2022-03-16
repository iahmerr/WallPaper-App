//
//  HomeViewModel.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    var tabSelectedSubject = PassthroughSubject<Int,Never>()
    let pagingViewModel = PagingViewModel()
    init() {
        
        tabSelectedSubject
            .sink(receiveValue: {[weak self] tab in
                guard let self = self else { return }
                self.pagingViewModel.selectRowSubject.send(tab)
        }).store(in: &subscriptions)
        
    }
}
