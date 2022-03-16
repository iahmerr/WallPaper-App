//
//  PagingViewModel.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 10/03/2022.
//

import Foundation
import Combine

class PagingViewModel: ObservableObject {

    private var subscriptions = Set<AnyCancellable>()
    let selectRowSubject = PassthroughSubject<Int, Never>()
    
   // var selectRowObserver = AnySubscriber<Int, Never>()
    
    var selectRow: AnyPublisher<Int, Never> { selectRowSubject.eraseToAnyPublisher() }
    
    init(){
        selectRow.sink(receiveValue: {
            print("here", $0)
        }).store(in: &subscriptions)
    }
}
