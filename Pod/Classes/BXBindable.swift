//
//  BXBindable.swift
//  Pods
//
//  Created by Haizhen Lee on 15/11/8.
//
//

import Foundation

public protocol BXBindable{
    typealias ModelType
    func bind(item:ModelType)
}