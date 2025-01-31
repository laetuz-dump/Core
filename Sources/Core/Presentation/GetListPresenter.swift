//
//  File.swift
//  
//
//  Created by Ryo Martin on 07/07/24.
//

import SwiftUI
import Combine

public class GetListPresenter<Request, Response, Interactor: UseCase>: ObservableObject
where Interactor.Request == Request, Interactor.Response == [Response] {
    private var cancellables: Set<AnyCancellable> = []
    private let _useCase: Interactor
    
    @Published public var list: [Response] = []
    @Published public var errorMessage = ""
    @Published public var isLoading = false
    @Published public var isError = false
    
    public init(_useCase: Interactor) {
        self._useCase = _useCase
    }
    
    public func getList(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished: self.isLoading = false
                }
            }, receiveValue: { list in
                self.list = list
            })
            .store(in: &cancellables)
    }
}
