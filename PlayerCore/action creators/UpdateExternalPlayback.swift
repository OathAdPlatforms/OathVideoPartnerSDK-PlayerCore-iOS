//  Copyright 2018, Oath Inc.
//  Licensed under the terms of the MIT License. See LICENSE.md file in project root for terms.

public func update(externalPlaybackAllowance isAllowed: Bool) -> Action {
    return isAllowed ?
        UpdateExternalPlaybackPossible() :
        UpdateExternalPlaybackImpossible()
}
