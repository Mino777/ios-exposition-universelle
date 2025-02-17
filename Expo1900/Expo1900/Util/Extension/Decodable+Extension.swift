//
//  Decodable+Extension.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/13.
//

import UIKit

extension Decodable {
  
  static func parseJSON(with assetName: String) -> Result<Self, DecodeError> {
    let decoder = JSONDecoder()
    guard let asset = NSDataAsset(name: assetName) else {
      return .failure(.notFoundAsset)
    }
    guard let data = try? decoder.decode(Self.self, from: asset.data) else {
      return .failure(.decodeFail)
    }
    return .success(data)
  }
}
