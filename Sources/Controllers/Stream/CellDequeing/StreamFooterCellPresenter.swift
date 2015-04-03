//
//  StreamFooterCellPresenter.swift
//  Ello
//
//  Created by Sean on 2/18/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Foundation

public struct StreamFooterCellPresenter {

    static func configure(
        cell:UICollectionViewCell,
        streamCellItem:StreamCellItem,
        streamKind: StreamKind,
        indexPath: NSIndexPath)
    {
        if let cell = cell as? StreamFooterCell {
            if let post = streamCellItem.jsonable as? Post {
                cell.comments = post.commentsCount?.localizedStringFromNumber()

                if streamKind.isDetail {
                    cell.commentsOpened = true
                }
                else {
                    let isLoading = streamCellItem.state == .Loading
                    let isExpanded = streamCellItem.state == .Expanded

                    if isLoading {
                        // this should be set via a custom accessor or method,
                        // me thinks.
                        // `StreamFooterCell.state = streamCellItem.state` ??
                        cell.commentsButton.animate()
                        cell.commentsButton.selected = true
                    }
                    else {
                        cell.commentsButton.finishAnimation()

                        if isExpanded {
                            cell.commentsButton.selected = true
                            cell.commentsOpened = true
                        }
                        else {
                            cell.commentsButton.selected = false
                            cell.commentsOpened = false
                            streamCellItem.state = .Collapsed
                        }
                    }
                }

                cell.scrollView.scrollEnabled = !streamKind.isGridLayout
                cell.chevronButton.hidden = streamKind.isGridLayout

                if streamKind.isGridLayout {
                    cell.views = ""
                    cell.reposts = ""
                }
                else {
                    cell.views = post.viewsCount?.localizedStringFromNumber()
                    cell.reposts = post.repostsCount?.localizedStringFromNumber()
                }
                cell.streamKind = streamKind
            }
        }
    }
}
