//
//  GameViewModelType.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import Foundation

protocol GameViewModelInputs {
    var infoTapped: PassthroughSubject<Void, Never> { get }
    var numberTapped: PassthroughSubject<Int, Never> { get }
    var newGameTapped: PassthroughSubject<Void, Never> { get }
    var cleanGuessTapped: PassthroughSubject<Void, Never> { get }
    var guessTapped: PassthroughSubject<Void, Never> { get }
}

protocol GameViewModelOutputs {
    var selectedNumbers: AnyPublisher<[Int], Never> { get }
    var guessCount: AnyPublisher<Int, Never> { get }
    var evaluation: AnyPublisher<([Int], Int, Int), Never> { get }
    var clearEvaluation: AnyPublisher<Void, Never> { get }
}

protocol GameViewModelActions {
    var showInfo: AnyPublisher<Void, Never> { get }
}

protocol GameViewModelType: GameViewModelInputs, GameViewModelOutputs {}
