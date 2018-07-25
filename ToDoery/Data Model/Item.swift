//
//  Item.swift
//  ToDoery
//
//  Created by Denys Mashyr on 7/24/18.
//  Copyright © 2018 Denys Mashyr. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated : Date?
    //link to teh parent category
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
