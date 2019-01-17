//  Copyright 2018, Oath Inc.
//  Licensed under the terms of the MIT License. See LICENSE.md file in project root for terms.

import Foundation

public struct VRMProcessingResult {
    static let initial = VRMProcessingResult(processedAds: [])
    
    public struct Result: Hashable {
        let item: VRMCore.Item
        let inlineVAST: Ad.VASTModel
    }
    
    public let processedAds: Set<Result>
}

func reduce(state: VRMProcessingResult, action: Action) -> VRMProcessingResult {
    
    switch action {
    case let selectResult as VRMCore.SelectInlineItem:
     let result = VRMProcessingResult.Result(item: selectResult.originalItem,
                                             inlineVAST: selectResult.inlineVAST)
    
        return VRMProcessingResult(processedAds: state.processedAds.union([result]))
    default:
        return state
    }
}