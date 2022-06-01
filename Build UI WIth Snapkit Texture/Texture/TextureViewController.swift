//
//  TextureViewController.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import AsyncDisplayKit

class TextureViewController: ASDKViewController<ASDisplayNode> {
    
    private let requstButton: ASButtonNode = {
        let btn = ASButtonNode()
        btn.backgroundColor = .systemBlue
        btn.onDidLoad {
            $0.layer.cornerRadius = 8
        }
        btn.style.preferredSize.height = 46
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor.white
        ]
        btn.setAttributedTitle(NSAttributedString(string: "Request change data", attributes: attributes) , for: .normal)
        return btn
    }()
    
    private let rootNode: ASDisplayNode = {
        let root = ASDisplayNode()
        root.automaticallyManagesSubnodes = true
        root.backgroundColor = .white
        return root
    }()
    
    private let changeTableNode: ChangeTableNode
    
    override init() {
        self.changeTableNode = ChangeTableNode(changes: ChangeDataManager.generateChangesData())
        super.init(node: rootNode)
        self.changeTableNode.onItemClicked = { [weak self] changeData in
            guard let self = self else { return }
            self.showAllert(title: changeData.title, message: changeData.changeTo)
        }
        requstButton.addTarget(self, action: #selector(requestPressed), forControlEvents: .touchUpInside)
        
        rootNode.layoutSpecBlock =  { [weak self] _, _ -> ASLayoutSpec in
            guard let self = self else { return .init() }
            
            return ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch, children: [
                self.changeTableNode,
                ASInsetLayoutSpec(
                    insets: .init(top: 20, left: 20, bottom: 20, right: 20),
                    child: self.requstButton
                )
            ])
        }
    }
    
    @objc func requestPressed() {
        self.showAllert(title:"", message: "Request Cange data button clicked")
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.topItem?.title = "Texture Change Data"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
