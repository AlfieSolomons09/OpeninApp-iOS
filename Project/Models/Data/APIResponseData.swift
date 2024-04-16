//
//  APIResponseData.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation


struct ApiResponse: Codable {
    let appliedCampaign: Int
    let extraIncome: Double
    let totalClicks: Int
    let data: DataObject
    let totalLinks: Int
    let statusCode: Int
    let supportWhatsappNumber: Int
    let linksCreatedToday: Int
    let topLocation: String
    let message: String
    let startTime: String
    let status: Int
    let topSource: String
    let todayClicks: Int
    
    private enum CodingKeys: String, CodingKey {
        case appliedCampaign = "applied_campaign"
        case extraIncome = "extra_income"
        case totalClicks = "total_clicks"
        case data
        case totalLinks = "total_links"
        case statusCode
        case supportWhatsappNumber = "support_whatsapp_number"
        case linksCreatedToday = "links_created_today"
        case topLocation = "top_location"
        case message
        case startTime
        case status
        case topSource = "top_source"
        case todayClicks = "today_clicks"
    }
}

struct DataObject: Codable {
    let favouriteLinks: [String]
    let overallUrlChart: [String: Int]
    let recentLinks: [Link]
    let topLinks: [Link]
    
    private enum CodingKeys: String, CodingKey {
        case favouriteLinks = "favourite_links"
        case overallUrlChart = "overall_url_chart"
        case recentLinks = "recent_links"
        case topLinks = "top_links"
    }
}

struct Link: Codable {
    let app: String
    let createdAt: String
    let domainId: String
    let isFavourite: Int
    let originalImage: String
    let smartLink: String
    let thumbnail: String?
    let timesAgo: String
    let title: String
    let totalClicks: Int
    let urlId: Int
    let urlPrefix: String?
    let urlSuffix: String
    let webLink: String
    
    private enum CodingKeys: String, CodingKey {
        case app, createdAt, domainId, isFavourite = "is_favourite", originalImage = "original_image", smartLink = "smart_link", thumbnail, timesAgo = "times_ago", title, totalClicks = "total_clicks", urlId = "url_id", urlPrefix = "url_prefix", urlSuffix = "url_suffix", webLink = "web_link"
    }
}
