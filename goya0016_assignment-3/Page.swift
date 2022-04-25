//
//  Page.swift
//  goya0016_assignment-3
//
//  Created by Nipun Goyal on 2020-11-17.
//

import Foundation
class Page {
    var pageNumber:Int?
    var pageText:String?
    var pageChoiceA:Page?
    var pageChoiceB:Page?
    
    init(){}
  convenience init(pageNumber:Int,pageText:String,pageChoiceA:Page,pageChoiceB:Page){
    self.init()
        self.pageNumber = pageNumber
        self.pageText = pageText
        self.pageChoiceA = pageChoiceA
        self.pageChoiceB = pageChoiceB
    }
    convenience init(pageNumber:Int){
        self.init()
        self.pageNumber = pageNumber
    }
    
}
