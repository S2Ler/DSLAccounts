//
//  DSLAccountStore.swift
//  DSLAccounts
//
//  Created by Alexander Belyavskiy on 3/20/17.
//  Copyright © 2017 Alexander Belyavskiy. All rights reserved.
//

import Foundation
import Accounts

public enum DSLAccountTypeIdentifier {
  case facebook
  case twitter
  case sinaWeibo
  case tencentWeibo

  internal var rawValue: String {
    switch self {
    case .facebook:
      return ACAccountTypeIdentifierFacebook
    case .twitter:
      return ACAccountTypeIdentifierTwitter
    case .sinaWeibo:
      return ACAccountTypeIdentifierSinaWeibo
    case .tencentWeibo:
      return ACAccountTypeIdentifierTencentWeibo
    }
  }
}

public final class DSLAccountStore {
  public let accountStore: ACAccountStore

  public init() {
    accountStore = ACAccountStore()
  }

  public var accounts: [ACAccount] {
    if let accounts = accountStore.accounts {
      return accounts as! [ACAccount]
    } else {
      return []
    }
  }

  public func account(withIdentifier identifier: String) -> ACAccount? {
    return accountStore.account(withIdentifier: identifier)
  }

  public func accounts(with accountType: ACAccountType) -> [ACAccount]? {
    if let accounts = accountStore.accounts(with: accountType) {
      return (accounts as! [ACAccount])
    } else {
      return nil
    }
  }

  public func requestAccessToAccounts(with accountType: ACAccountType,
                                      options: [AnyHashable : Any] = [:],
                                      completion: Accounts.ACAccountStoreRequestAccessCompletionHandler?) {
    accountStore.requestAccessToAccounts(with: accountType, options: options, completion: completion)
  }
}
