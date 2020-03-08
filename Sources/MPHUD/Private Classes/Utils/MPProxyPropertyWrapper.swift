//
//  MPProxyPropertyWrapper.swift
//  MPHUD
//
//  Created by Martin Púčik on 08/03/2020.
//

import Foundation

/// Proxy property from one object to another object
@propertyWrapper
public struct Proxy<ObjectType, PropertyType> {

    // MARK: - Public properties

    public var object: ObjectType?

    // MARK: - Private properties

    private let keyPath: ReferenceWritableKeyPath<ObjectType, PropertyType?>

    // MARK: - Lifecycle
    public init(object: ObjectType? = nil, keyPath: ReferenceWritableKeyPath<ObjectType, PropertyType?>) {
        self.object = object
        self.keyPath = keyPath
    }

    // MARK: - Public properties
    public var wrappedValue: PropertyType? {
        get {
            object?[keyPath: keyPath]
        }
        set {
            object?[keyPath: keyPath] = newValue
        }
    }
}
