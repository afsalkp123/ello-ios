//
//  StreamRepostHeaderCellPresenter.swift
//  Ello
//
//  Created by Ryan Boyajian on 4/23/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Foundation

public struct StreamRepostHeaderCellPresenter {

    static func configure(
        cell: UICollectionViewCell,
        streamCellItem: StreamCellItem,
        streamKind: StreamKind,
        indexPath: NSIndexPath,
        currentUser: User?)
    {
        if let cell = cell as? StreamRepostHeaderCell {
            let post = streamCellItem.jsonable as! Post
            cell.viaTextView.clearText()
            cell.sourceTextView.clearText()
            if let repostViaPath = post.repostViaPath, let repostViaId = post.repostViaId {
                if let username = (split(repostViaPath) { $0 == "/" }).first {
                    cell.viaTextViewHeight.constant = 15.0
                    cell.viaTextView.appendTextWithAction("Via: @\(username)", link: "post", object: repostViaId, extraAttrs: nil)
                } else {
                    cell.viaTextViewHeight.constant = 0.0
                }
            } else {
                cell.viaTextViewHeight.constant = 0.0
            }
            if let repostPath = post.repostPath, let repostId = post.repostId {
                if let username = (split(repostPath) { $0 == "/" }).first {
                    cell.sourceTextView.appendTextWithAction("Source: @\(username)", link: "post", object: repostId, extraAttrs: nil)
                }
            }
        }
    }
    
}