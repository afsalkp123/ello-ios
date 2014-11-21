//
//  DiscoverViewControllerSpec.swift
//  Ello
//
//  Created by Sean Dougherty on 11/21/14.
//  Copyright (c) 2014 Ello. All rights reserved.
//

import Quick
import Nimble


class DiscoverViewControllerSpec: QuickSpec {
    override func spec() {

        let storyboard = UIStoryboard.iPhone()
        var controller = DiscoverViewController.instantiateFromStoryboard(storyboard)
        describe("initialization", {

            beforeEach({
                controller = DiscoverViewController.instantiateFromStoryboard(storyboard)
            })

            it("can be instatiated from storyboard") {
                expect(controller).notTo(beNil())
            }

            it("is a BaseElloViewController", {
                expect(controller).to(beAKindOf(BaseElloViewController.self))
            })

            it("is a DiscoverViewController", {
                expect(controller).to(beAKindOf(DiscoverViewController.self))
            })
        })
    }
}

