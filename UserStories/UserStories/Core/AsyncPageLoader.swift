//
//  AsyncPageLoader.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

final class AsyncPageLoader<T: Codable> {
    private let fetchPage: (Int) async throws -> BasePaginatedResponseModel<T>
    private var currentPage = 1
    private var hasMoreData = true
    
    init(fetchPage: @escaping (Int) async throws -> BasePaginatedResponseModel<T>) {
        self.fetchPage = fetchPage
    }
    
    //We can easy extend this class to load previous pages, but for now we don't need it
    
    func loadNextPage() async throws -> [T] {
        guard hasMoreData else { return [] }
        
        let item = try await fetchPage(currentPage)
        hasMoreData = item.page < item.pageCount
        if hasMoreData {
            currentPage += 1
        }
        return item.data
    }
    
    var currentPageNumber: Int {
        return currentPage
    }
    
    var canLoadMore: Bool {
        return hasMoreData
    }
}
