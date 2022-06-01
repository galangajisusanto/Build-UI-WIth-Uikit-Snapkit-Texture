//
//  ChangeNode.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import AsyncDisplayKit

class ChangeNode: ASCellNode {
    
    private let changeModel: ChangeDataModel
    
    private lazy var titleNode: ASTextNode2 = {
        let titleNode = ASTextNode2()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        titleNode.attributedText = .init(string: changeModel.title, attributes: attributes )
        return titleNode
    }()
    
    private lazy var changesNode: ASTextNode2 = {
        let changesNode = ASTextNode2()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.black
        ]
        changesNode.attributedText = .init(string: "Change to \(changeModel.changeTo)", attributes: attributes )
        return changesNode
    }()
    
    private let detailButton: ASButtonNode = {
        let detailButton = ASButtonNode()
        detailButton.onDidLoad {
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray.cgColor
        }
        detailButton.style.preferredSize = .init(width: 100, height: 40)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor.gray
        ]
        detailButton.setAttributedTitle(NSAttributedString(string: "Detail", attributes: attributes), for: .normal)
        return detailButton
    }()
    
    private lazy var statusNode: ASTextNode2 = {
        let changesNode = ASTextNode2()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.gray
        ]
        changesNode.attributedText = .init(string: changeModel.status, attributes: attributes )
        return changesNode
    }()
    
    
    init(changeModel: ChangeDataModel) {
        self.changeModel = changeModel
        super.init()
        self.automaticallyManagesSubnodes = true
        selectionStyle = .none
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let dataStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [
            titleNode,
            changesNode,
            statusNode
        ])
        
        let layoutStack = ASStackLayoutSpec(direction: .horizontal , spacing: 8, justifyContent: .spaceBetween, alignItems: .center, children: [dataStack,detailButton])
        
        return ASInsetLayoutSpec(insets: .init(top: 20, left: 20, bottom: 20, right: 20), child: layoutStack)
        
    }
}
