//
//  Category.swift
//  ToDoery
//
//  Created by Denys Mashyr on 7/24/18.
//  Copyright © 2018 Denys Mashyr. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    //link to the subcategory
    let items = List<Item>()
}
