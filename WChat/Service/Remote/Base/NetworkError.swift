//
//  NetworkError.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//
import Foundation

extension Error
{
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}

public enum NetworkError: Error
{
    // MARK: Informational
    case `continue`
    case switchingProtocols
    case processing
    
    // MARK: Success
    case oK
    case created
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported
    case imUsed
    
    // MARK: Redirection
    case multipleChoices
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case temporaryRedirect
    case permanentRedirect
    
    // MARK: Client Error
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case requestURITooLong
    case unsupportedMediaType
    case requestedRangeNotSatisfiable
    case expectationFailed
    case i_am_a_Teapot
    case misdirectedRequest
    case unprocessableEntity
    case locked
    case failedDependency
    case upgradeRequired
    case preconditionRequired
    case tooManyRequests
    case requestrHeaderrFieldsrToorLarge
    case connectionClosedWithoutResponse
    case unavailableForLegalReasons
    case clientClosedRequest
    
    // MARK: Server Error
    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case variantAlsoNegotiates
    case insufficientStorage
    case loopDetected
    case notExtended
    case networkAuthenticationRequired
    case networkConnectTimeoutError
    
    case noConnection
    case noData
    case unknownError
    case parsingJSONError
        
    init(_ error: Error)
    {
        let error: NSError = error as NSError
        if error.domain == NSURLErrorDomain
        {
            switch error.code
            {
            case NSURLErrorResourceUnavailable:
                self = .noData
            case NSURLErrorNotConnectedToInternet:
                self = .noConnection
            case NSURLErrorCannotDecodeRawData, NSURLErrorCannotDecodeContentData, NSURLErrorCannotParseResponse:
                self = .parsingJSONError
            default:
                self = Self.init(error.code)
            }
            return
        }
        
        self = .unknownError
    }
    
    init(_ statusCode: Int)
    {
        switch statusCode
        {
            // MARK: Informational
            case 100: self = .continue
            case 101: self = .switchingProtocols
            case 102: self = .processing

            // MARK: Success
            case 200: self = .oK
            case 201: self = .created
            case 202: self = .accepted
            case 203: self = .nonAuthoritativeInformation
            case 204: self = .noContent
            case 205: self = .resetContent
            case 206: self = .partialContent
            case 207: self = .multiStatus
            case 208: self = .alreadyReported
            case 226: self = .imUsed

            // MARK: Redirection
            case 300: self = .multipleChoices
            case 301: self = .movedPermanently
            case 302: self = .found
            case 303: self = .seeOther
            case 304: self = .notModified
            case 305: self = .useProxy
            case 307: self = .temporaryRedirect
            case 308: self = .permanentRedirect

            // MARK: Client Error
            case 400: self = .badRequest
            case 401: self = .unauthorized
            case 402: self = .paymentRequired
            case 403: self = .forbidden
            case 404: self = .notFound
            case 405: self = .methodNotAllowed
            case 406: self = .notAcceptable
            case 407: self = .proxyAuthenticationRequired
            case 408: self = .requestTimeout
            case 409: self = .conflict
            case 410: self = .gone
            case 411: self = .lengthRequired
            case 412: self = .preconditionFailed
            case 413: self = .payloadTooLarge
            case 414: self = .requestURITooLong
            case 415: self = .unsupportedMediaType
            case 416: self = .requestedRangeNotSatisfiable
            case 417: self = .expectationFailed
            case 418: self = .i_am_a_Teapot
            case 421: self = .misdirectedRequest
            case 422: self = .unprocessableEntity
            case 423: self = .locked
            case 424: self = .failedDependency
            case 426: self = .upgradeRequired
            case 428: self = .preconditionRequired
            case 429: self = .tooManyRequests
            case 431: self = .requestrHeaderrFieldsrToorLarge
            case 444: self = .connectionClosedWithoutResponse
            case 451: self = .unavailableForLegalReasons
            case 499: self = .clientClosedRequest

            // MARK: Server Error
            case 500: self = .internalServerError
            case 501: self = .notImplemented
            case 502: self = .badGateway
            case 503: self = .serviceUnavailable
            case 504: self = .gatewayTimeout
            case 505: self = .httpVersionNotSupported
            case 506: self = .variantAlsoNegotiates
            case 507: self = .insufficientStorage
            case 508: self = .loopDetected
            case 510: self = .notExtended
            case 511: self = .networkAuthenticationRequired
            case 599: self = .networkConnectTimeoutError
            
        default:
            self = .unknownError
        }
    }
}

extension NetworkError: LocalizedError
{
    public var errorDescription: String?
    {
        switch self
        {
            // MARK: Informational
            case .continue:
                return NSLocalizedString("Continue", comment: "")
            case .switchingProtocols:
                return NSLocalizedString("Switching Protocols", comment: "")
            case .processing:
                return NSLocalizedString("Processing", comment: "")
                
            // MARK: Success
            case .oK:
                return NSLocalizedString("OK", comment: "")
            case .created:
                return NSLocalizedString("Created", comment: "")
            case .accepted:
                return NSLocalizedString("Accepted", comment: "")
            case .nonAuthoritativeInformation:
                return NSLocalizedString("Non-authoritative Information", comment: "")
            case .noContent:
                return NSLocalizedString("No Content", comment: "")
            case .resetContent:
                return NSLocalizedString("Reset Content", comment: "")
            case .partialContent:
                return NSLocalizedString("Partial Content", comment: "")
            case .multiStatus:
                return NSLocalizedString("Multi-Status", comment: "")
            case .alreadyReported:
                return NSLocalizedString("Already Reported", comment: "")
            case .imUsed:
                return NSLocalizedString("IM Used", comment: "")
                
            // MARK: Redirection
            case .multipleChoices:
                return NSLocalizedString("Multiple Choices", comment: "")
            case .movedPermanently:
                return NSLocalizedString("Moved Permanently", comment: "")
            case .found:
                return NSLocalizedString("Found", comment: "")
            case .seeOther:
                return NSLocalizedString("See Other", comment: "")
            case .notModified:
                return NSLocalizedString("Not Modified", comment: "")
            case .useProxy:
                return NSLocalizedString("Use Proxy", comment: "")
            case .temporaryRedirect:
                return NSLocalizedString("Temporary Redirect", comment: "")
            case .permanentRedirect:
                return NSLocalizedString("Permanent Redirect", comment: "")
                
            // MARK: Client Error
            case .badRequest:
                return NSLocalizedString("The data from the server is dammeged", comment: "")
            case .paymentRequired:
                return NSLocalizedString("Payment Required", comment: "")
            case .forbidden, .unauthorized:
                let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
                return NSLocalizedString("please check your authorization with ", comment: "") + appName
            case .notFound:
                return NSLocalizedString("seemes That your connection request un-avaliable link", comment: "")
            case .methodNotAllowed:
                return NSLocalizedString("Method Not Allowed", comment: "")
            case .notAcceptable:
                return NSLocalizedString("Not Acceptable", comment: "")
            case .proxyAuthenticationRequired:
                return NSLocalizedString("Proxy Authentication Required", comment: "")
            case .requestTimeout:
                return NSLocalizedString("It took us too long to load the data, please try again later", comment: "")
            case .conflict:
                return NSLocalizedString("server conflict error", comment: "")
            case .gone:
                return NSLocalizedString("Gone", comment: "")
            case .lengthRequired:
                return NSLocalizedString("Length Required", comment: "")
            case .preconditionFailed:
                return NSLocalizedString("Precondition Failed", comment: "")
            case .payloadTooLarge:
                return NSLocalizedString("Payload Too Large", comment: "")
            case .requestURITooLong:
                return NSLocalizedString("Request-URI Too Long", comment: "")
            case .unsupportedMediaType:
                return NSLocalizedString("Unsupported Media Type", comment: "")
            case .requestedRangeNotSatisfiable:
                return NSLocalizedString("Requested Range Not Satisfiable", comment: "")
            case .expectationFailed:
                return NSLocalizedString("Expectation Failed", comment: "")
            case .i_am_a_Teapot:
                return NSLocalizedString("I'm a teapot", comment: "")
            case .misdirectedRequest:
                return NSLocalizedString("Misdirected Request", comment: "")
            case .unprocessableEntity:
                return NSLocalizedString("Unprocessable Entity", comment: "")
            case .locked:
                return NSLocalizedString("Locked", comment: "")
            case .failedDependency:
                return NSLocalizedString("Failed Dependency", comment: "")
            case .upgradeRequired:
                return NSLocalizedString("Upgrade Required", comment: "")
            case .preconditionRequired:
                return NSLocalizedString("Precondition Required", comment: "")
            case .tooManyRequests:
                return NSLocalizedString("Too Many Requests", comment: "")
            case .requestrHeaderrFieldsrToorLarge:
                return NSLocalizedString("Request Header Fields Too Large", comment: "")
            case .connectionClosedWithoutResponse:
                return NSLocalizedString("Connection Closed Without Response", comment: "")
            case .unavailableForLegalReasons:
                return NSLocalizedString("Unavailable For Legal Reasons", comment: "")
            case .clientClosedRequest:
                return NSLocalizedString("Client Closed Request", comment: "")
                
            // MARK: Server Error
            case .internalServerError:
                return NSLocalizedString("Internal Server Error", comment: "")
            case .notImplemented:
                return NSLocalizedString("Not Implemented", comment: "")
            case .badGateway:
                return NSLocalizedString("Bad Gateway", comment: "")
            case .serviceUnavailable:
                return NSLocalizedString("Service Unavailable", comment: "")
            case .gatewayTimeout:
                return NSLocalizedString("Gateway Timeout", comment: "")
            case .httpVersionNotSupported:
                return NSLocalizedString("HTTP Version Not Supported", comment: "")
            case .variantAlsoNegotiates:
                return NSLocalizedString("Variant Also Negotiates", comment: "")
            case .insufficientStorage:
                return NSLocalizedString("Insufficient Storage", comment: "")
            case .loopDetected:
                return NSLocalizedString("Loop Detected", comment: "")
            case .notExtended:
                return NSLocalizedString("Not Extended", comment: "")
            case .networkAuthenticationRequired:
                return NSLocalizedString("Network Authentication Required", comment: "")
            case .networkConnectTimeoutError:
                return NSLocalizedString("Network Connect Timeout Error", comment: "")
    
            case .noConnection:
                return NSLocalizedString("Please check your internet connection and try again", comment: "")
            case .noData:
                let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
                return NSLocalizedString("can not get data from \(appName) server", comment: "")
            case .parsingJSONError:
                return "CHECK YOUR MODEL KEYS AND VALUES"
                
            default:
                return NSLocalizedString("There is something wrong please try again later", comment: "")
        }
    }
}

public enum APIError
{
    case internetError(String)
    case serverMessage(String)
}
