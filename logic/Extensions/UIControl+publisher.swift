//
//  UIControl+publisher.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import UIKit

// https://www.avanderlee.com/swift/custom-combine-publisher/
// https://www.swiftbysundell.com/articles/building-custom-combine-publishers-in-swift/

extension UIControl {
    func publisher(for event: Event) -> AnyPublisher<Void, Never> {
        EventPublisher(
            control: self,
            event: event
        ).eraseToAnyPublisher()
    }

    private struct EventPublisher: Publisher {
        typealias Output = Void
        typealias Failure = Never

        private let event: Event
        private let control: UIControl

        init(control: UIControl, event: Event) {
            self.event = event
            self.control = control
        }

        func receive<S>(subscriber: S) where S: Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let subscription = EventSubscription(target: subscriber, control: control, event: event)
            subscriber.receive(subscription: subscription)
        }
    }

    private final class EventSubscription<Target: Subscriber>: Subscription where Target.Input == Void {
        private var target: Target?

        init(target: Target?, control: UIControl, event: Event) {
            self.target = target

            control.addTarget(self, action: #selector(eventHandler), for: event)
        }

        func request(_ demand: Subscribers.Demand) {}

        func cancel() {
            target = nil
        }

        @objc func eventHandler() {
            _ = target?.receive(())
        }
    }
}

