//
//  ChangeDataModel.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//


struct ChangeDataModel {
    let title: String
    let status: String
    let changeTo: String
}

struct ChangeDataManager {
    static func generateChangesData() -> [ChangeDataModel] {
        var changes = [ChangeDataModel]()
        for _ in 0 ... 100 {
            changes.append(ChangeDataModel(title: "ID Expiration date", status: "Pending", changeTo: "25 May 2022"))
        }
        return changes
    }
}
