//
//  InfoViewModelType.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import Foundation

protocol InfoViewModelInputs {
    var dismissed: PassthroughSubject<Void, Never> { get }
}

protocol InfoViewModelOutputs {

}

protocol InfoViewModelActions {
    var dismiss: AnyPublisher<Void, Never> { get }
}

protocol InfoViewModelType: InfoViewModelInputs, InfoViewModelOutputs {}
