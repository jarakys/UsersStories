//
//  GenericSectionIdentifierModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation
import CompositionalList

public class GenericSectionIdentifierModel<T: Hashable>: SectionIdentifierViewModel {
    public var sectionIdentifier: String
    
    public var cellIdentifiers: [T]
    
    init(sectionIdentifier: String, cellIdentifiers: [T]) {
        self.sectionIdentifier = sectionIdentifier
        self.cellIdentifiers = cellIdentifiers
    }
}
