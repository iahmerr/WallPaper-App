//
//  PagingViewModel.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 10/03/2022.
//

import Foundation
import Combine

class PagingViewModel {

    private var subscriptions = Set<AnyCancellable>()
    let selectRow = CurrentValueSubject<Int, Never>(0)
    
    var cityName: AnyPublisher<Int, Never> { selectRow.eraseToAnyPublisher() }
    
    init(){
    
    }
}
