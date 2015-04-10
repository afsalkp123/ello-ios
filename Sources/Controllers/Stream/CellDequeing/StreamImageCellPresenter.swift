//
//  StreamImageCellPresenter.swift
//  Ello
//
//  Created by Sean on 2/18/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Foundation

public struct StreamImageCellPresenter {

    static func configure(
        cell:UICollectionViewCell,
        streamCellItem:StreamCellItem,
        streamKind: StreamKind,
        indexPath: NSIndexPath,
        currentUser: User?)
    {
        if let cell = cell as? StreamImageCell {
            if let photoData = streamCellItem.data as! ImageRegion? {

                if let isGif = photoData.asset?.isGif {
                    if let photoURL = photoData.asset?.optimized?.url {
                        cell.serverProvidedAspectRatio = StreamCellItemParser.aspectRatioForImageBlock(photoData)
                        cell.setImageURL(photoURL)
                    }
                    else if let photoURL = photoData.url {
                        cell.setImageURL(photoURL)
                    }
                }
                else {
                    let photoToLoad = streamKind.isGridLayout ? photoData.asset?.ldpi?.url : photoData.asset?.mdpi?.url
                    if let photoURL = photoToLoad {
                        cell.serverProvidedAspectRatio = StreamCellItemParser.aspectRatioForImageBlock(photoData)
                        cell.setImageURL(photoURL)
                    }
                    else if let photoURL = photoData.url {
                        cell.setImageURL(photoURL)
                    }
                }
            }
        }
    }

}
