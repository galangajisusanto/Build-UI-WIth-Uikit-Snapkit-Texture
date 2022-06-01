//
//  ChangeTableNode.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import AsyncDisplayKit

class ChangeTableNode: ASTableNode {
    private var changes: [ChangeDataModel]
    
    var onItemClicked: ((ChangeDataModel) -> Void)?
    
    init(changes: [ChangeDataModel]) {
        self.changes = changes
        super.init(style: .plain)
        self.delegate = self
        self.dataSource = self
        self.style.flexGrow = 1
    }
}

extension ChangeTableNode: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return changes.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let changeData = changes[indexPath.row]
        return {
            ChangeNode(changeModel: changeData)
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let changeData = changes[indexPath.row]
        onItemClicked?(changeData)
    }
    
}
