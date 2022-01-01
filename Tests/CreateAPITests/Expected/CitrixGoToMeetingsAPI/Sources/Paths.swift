// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    public static var groups: Groups {
        Groups(path: "/groups")
    }

    public struct Groups {
        /// Path: `/groups`
        public let path: String

        /// Get groups
        ///
        /// List all groups for an account. This API call is only available to users with the admin role.
        public var get: Request<[CitrixGoToMeetingsAPI.Group]> {
            .get(path)
        }
    }
}

extension Paths.Groups {
    public func groupKey(_ groupKey: Int) -> WithGroupKey {
        WithGroupKey(path: "\(path)/\(groupKey)")
    }

    public struct WithGroupKey {
        /// Path: `/groups/{groupKey}`
        public let path: String
    }
}

extension Paths.Groups.WithGroupKey {
    public var attendees: Attendees {
        Attendees(path: path + "/attendees")
    }

    public struct Attendees {
        /// Path: `/groups/{groupKey}/attendees`
        public let path: String

        /// Get attendees by group
        ///
        /// Returns all attendees for all meetings within specified date range held by organizers within the specified group. This API call is only available to users with the admin role. This API call can be used only for groups with maximum 50 organizers.
        public func get(startDate: Date? = nil, endDate: Date? = nil) -> Request<[CitrixGoToMeetingsAPI.AttendeeByGroup]> {
            .get(path, query: makeGetQuery(startDate, endDate))
        }

        private func makeGetQuery(_ startDate: Date?, _ endDate: Date?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startDate, forKey: "startDate")
            encoder.encode(endDate, forKey: "endDate")
            return encoder.items
        }
    }
}

extension Paths.Groups.WithGroupKey {
    public var historicalMeetings: HistoricalMeetings {
        HistoricalMeetings(path: path + "/historicalMeetings")
    }

    public struct HistoricalMeetings {
        /// Path: `/groups/{groupKey}/historicalMeetings`
        public let path: String

        /// Get historical meetings by group
        ///
        /// Get historical meetings for the specified group that started within the specified date/time range. This API call is only available to users with the admin role. This API call is restricted to groups with a maximum of 50 organizers. Remark: Meetings which are still ongoing at the time of the request are NOT contained in the result array.
        public func get(startDate: Date, endDate: Date) -> Request<[CitrixGoToMeetingsAPI.HistoricalMeetingByGroup]> {
            .get(path, query: makeGetQuery(startDate, endDate))
        }

        private func makeGetQuery(_ startDate: Date, _ endDate: Date) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startDate, forKey: "startDate")
            encoder.encode(endDate, forKey: "endDate")
            return encoder.items
        }
    }
}

extension Paths.Groups.WithGroupKey {
    public var meetings: Meetings {
        Meetings(path: path + "/meetings")
    }

    public struct Meetings {
        /// Path: `/groups/{groupKey}/meetings`
        public let path: String

        /// DEPRECATED: Get historical meetings by group
        ///
        /// DEPRECATED: Please use the new API calls 'Get historical meetings by group' and 'Get upcoming meetings by group'. Get meetings for a specified group. Additional filters can be used to view only meetings within a specified date range. This API call is only available to users with the admin role.
        @available(*, deprecated, message: "Deprecated")
        public func get(parameters: GetParameters) -> Request<[CitrixGoToMeetingsAPI.HistoryMeetingByGroup]> {
            .get(path, query: parameters.asQuery)
        }

        public struct GetParameters {
            public var isHistory: Bool
            public var startDate: Date
            public var endDate: Date

            public init(isHistory: Bool, startDate: Date, endDate: Date) {
                self.isHistory = isHistory
                self.startDate = startDate
                self.endDate = endDate
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(isHistory, forKey: "history")
                encoder.encode(startDate, forKey: "startDate")
                encoder.encode(endDate, forKey: "endDate")
                return encoder.items
            }
        }
    }
}

extension Paths.Groups.WithGroupKey {
    public var organizers: Organizers {
        Organizers(path: path + "/organizers")
    }

    public struct Organizers {
        /// Path: `/groups/{groupKey}/organizers`
        public let path: String

        /// Get organizers by group
        ///
        /// Returns all the organizers within a specific group. This API call is only available to users with the admin role.
        public var get: Request<[CitrixGoToMeetingsAPI.OrganizerByGroup]> {
            .get(path)
        }

        /// Create organizer in group
        ///
        /// Creates a new organizer and sends an email to the email address defined in request. This API call is only available to users with the admin role. You may also pass 'G2W' or 'G2T' or 'OPENVOICE' as productType variables, creating organizers for those products. A G2W or G2T organizer will also have access to G2M.
        public func post(_ body: CitrixGoToMeetingsAPI.OrganizerReq) -> Request<[CitrixGoToMeetingsAPI.OrganizerShort]> {
            .post(path, body: body)
        }
    }
}

extension Paths.Groups.WithGroupKey {
    public var upcomingMeetings: UpcomingMeetings {
        UpcomingMeetings(path: path + "/upcomingMeetings")
    }

    public struct UpcomingMeetings {
        /// Path: `/groups/{groupKey}/upcomingMeetings`
        public let path: String

        /// Get upcoming meetings by group
        ///
        /// Get upcoming meetings for a specified group. This API call is only available to users with the admin role. This API call can be used only for groups with maximum 50 organizers.
        public var get: Request<[CitrixGoToMeetingsAPI.UpcomingMeetingByGroup]> {
            .get(path)
        }
    }
}

extension Paths {
    public static var historicalMeetings: HistoricalMeetings {
        HistoricalMeetings(path: "/historicalMeetings")
    }

    public struct HistoricalMeetings {
        /// Path: `/historicalMeetings`
        public let path: String

        /// Get historical meetings
        ///
        /// Get historical meetings for the currently authenticated organizer that started within the specified date/time range. Remark: Meetings which are still ongoing at the time of the request are NOT contained in the result array.
        public func get(startDate: Date, endDate: Date) -> Request<[CitrixGoToMeetingsAPI.HistoricalMeeting]> {
            .get(path, query: makeGetQuery(startDate, endDate))
        }

        private func makeGetQuery(_ startDate: Date, _ endDate: Date) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startDate, forKey: "startDate")
            encoder.encode(endDate, forKey: "endDate")
            return encoder.items
        }
    }
}

extension Paths {
    public static var meetings: Meetings {
        Meetings(path: "/meetings")
    }

    public struct Meetings {
        /// Path: `/meetings`
        public let path: String

        /// DEPRECATED: Get historical meetings
        ///
        /// DEPRECATED: Please use the new API calls 'Get historical meetings' and 'Get upcoming meetings'.  Gets historical meetings for the current authenticated organizer. Requires date range for filtering results to only meetings within specified dates. History searches will contain the parameter 'meetingInstanceKey' which is used in conjunction with the call 'Get Attendees by Meeting' to get attendee information for a past meeting.
        @available(*, deprecated, message: "Deprecated")
        public func get(parameters: GetParameters? = nil) -> Request<[CitrixGoToMeetingsAPI.MeetingHistory]> {
            .get(path, query: parameters?.asQuery)
        }

        public struct GetParameters {
            public var isHistory: Bool?
            public var startDate: Date?
            public var endDate: Date?

            public init(isHistory: Bool? = nil, startDate: Date? = nil, endDate: Date? = nil) {
                self.isHistory = isHistory
                self.startDate = startDate
                self.endDate = endDate
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(isHistory, forKey: "history")
                encoder.encode(startDate, forKey: "startDate")
                encoder.encode(endDate, forKey: "endDate")
                return encoder.items
            }
        }

        /// Create meeting
        ///
        /// Create a new meeting based on the parameters specified.
        public func post(_ body: CitrixGoToMeetingsAPI.MeetingReqCreate) -> Request<[CitrixGoToMeetingsAPI.MeetingCreated]> {
            .post(path, body: body)
        }
    }
}

extension Paths.Meetings {
    public func meetingID(_ meetingID: Int) -> WithMeetingID {
        WithMeetingID(path: "\(path)/\(meetingID)")
    }

    public struct WithMeetingID {
        /// Path: `/meetings/{meetingId}`
        public let path: String

        /// Get meeting
        ///
        /// Returns the meeting details for the specified meeting.
        public var get: Request<[CitrixGoToMeetingsAPI.MeetingByID]> {
            .get(path)
        }

        /// Update meeting
        ///
        /// Updates an existing meeting specified by meetingId.
        public func put(_ body: CitrixGoToMeetingsAPI.MeetingReqUpdate) -> Request<Void> {
            .put(path, body: body)
        }

        /// Delete meeting
        ///
        /// Deletes the meeting identified by the meetingId.
        public var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths.Meetings.WithMeetingID {
    public var attendees: Attendees {
        Attendees(path: path + "/attendees")
    }

    public struct Attendees {
        /// Path: `/meetings/{meetingId}/attendees`
        public let path: String

        /// Get attendees by meeting
        ///
        /// List all attendees for specified meetingId of historical meeting. The historical meetings can be fetched using 'Get historical meetings', 'Get historical meetings by organizer', and 'Get historical meetings by group'. For users with the admin role this call returns attendees for any meeting. For any other user the call will return attendees for meetings on which the user is a valid organizer.
        public var get: Request<[CitrixGoToMeetingsAPI.AttendeeByMeeting]> {
            .get(path)
        }
    }
}

extension Paths.Meetings.WithMeetingID {
    public var start: Start {
        Start(path: path + "/start")
    }

    public struct Start {
        /// Path: `/meetings/{meetingId}/start`
        public let path: String

        /// Start meeting
        ///
        /// Returns a host URL that can be used to start a meeting. When this URL is opened in a web browser, the GoToMeeting client will be downloaded and launched and the meeting will start. The end user is not required to login to a client.
        public var get: Request<CitrixGoToMeetingsAPI.StartURL> {
            .get(path)
        }
    }
}

extension Paths {
    public static var organizers: Organizers {
        Organizers(path: "/organizers")
    }

    public struct Organizers {
        /// Path: `/organizers`
        public let path: String

        /// Get organizer by email / Get all organizers
        ///
        /// Gets the individual organizer specified by the organizer's email address. If an email address is not specified, all organizers are returned. This API call is only available to users with the admin role.
        public func get(email: String? = nil) -> Request<[CitrixGoToMeetingsAPI.Organizer]> {
            .get(path, query: makeGetQuery(email))
        }

        private func makeGetQuery(_ email: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(email, forKey: "email")
            return encoder.items
        }

        /// Create organizer
        ///
        /// Creates a new organizer and sends an email to the email address defined in the request. This API call is only available to users with the admin role. You may also pass 'G2W' or 'G2T' or 'OPENVOICE' as productType variables, creating organizers for those products. A G2W or G2T organizer will also have access to G2M.
        public func post(_ body: CitrixGoToMeetingsAPI.OrganizerReq) -> Request<[CitrixGoToMeetingsAPI.OrganizerShort]> {
            .post(path, body: body)
        }

        /// Delete organizer by email
        ///
        /// Deletes the individual organizer specified by the email address. This API call is only available to users with the admin role.
        public func delete(email: String) -> Request<Void> {
            .delete(path, query: [("email", email)])
        }
    }
}

extension Paths.Organizers {
    public func organizerKey(_ organizerKey: Int) -> WithOrganizerKey {
        WithOrganizerKey(path: "\(path)/\(organizerKey)")
    }

    public struct WithOrganizerKey {
        /// Path: `/organizers/{organizerKey}`
        public let path: String

        /// Get organizer
        ///
        /// Returns the individual organizer specified by the key. This API call is only available to users with the admin role. Non-admin users can only make this call for their own organizerKey.
        public var get: Request<[CitrixGoToMeetingsAPI.Organizer]> {
            .get(path)
        }

        /// Update organizer
        ///
        /// Updates the products of the specified organizer. To add a product (G2M, G2W, G2T, OPENVOICE) for the organizer, the call must be sent once for each product you want to add. To remove all products for the organizer, set status to 'suspended'. The call is limited to users with the admin role.
        public func put(_ body: CitrixGoToMeetingsAPI.OrganizerStatus) -> Request<Void> {
            .put(path, body: body)
        }

        /// Delete organizer
        ///
        /// Deletes the individual organizer specified by the organizer key. This API call is only available to users with the admin role.
        public var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths.Organizers.WithOrganizerKey {
    public var attendees: Attendees {
        Attendees(path: path + "/attendees")
    }

    public struct Attendees {
        /// Path: `/organizers/{organizerKey}/attendees`
        public let path: String

        /// Get attendees by organizer
        ///
        /// Lists all attendees for all meetings within a specified date range for a specified organizer. This API call is only available to users with the admin role.
        public func get(startDate: Date, endDate: Date) -> Request<[CitrixGoToMeetingsAPI.AttendeeByOrganizer]> {
            .get(path, query: makeGetQuery(startDate, endDate))
        }

        private func makeGetQuery(_ startDate: Date, _ endDate: Date) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startDate, forKey: "startDate")
            encoder.encode(endDate, forKey: "endDate")
            return encoder.items
        }
    }
}

extension Paths.Organizers.WithOrganizerKey {
    public var historicalMeetings: HistoricalMeetings {
        HistoricalMeetings(path: path + "/historicalMeetings")
    }

    public struct HistoricalMeetings {
        /// Path: `/organizers/{organizerKey}/historicalMeetings`
        public let path: String

        /// Get historical meetings by organizer
        ///
        /// Get historical meetings for the specified organizer that started within the specified date/time range. Remark: Meetings which are still ongoing at the time of the request are NOT contained in the result array.
        public func get(startDate: Date, endDate: Date) -> Request<[CitrixGoToMeetingsAPI.HistoricalMeeting]> {
            .get(path, query: makeGetQuery(startDate, endDate))
        }

        private func makeGetQuery(_ startDate: Date, _ endDate: Date) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startDate, forKey: "startDate")
            encoder.encode(endDate, forKey: "endDate")
            return encoder.items
        }
    }
}

extension Paths.Organizers.WithOrganizerKey {
    public var meetings: Meetings {
        Meetings(path: path + "/meetings")
    }

    public struct Meetings {
        /// Path: `/organizers/{organizerKey}/meetings`
        public let path: String

        /// DEPRECATED: Get meetings by organizer
        ///
        /// DEPRECATED: Please use the new API calls 'Get historical meetings by organizer' and 'Get upcoming meetings by organizer'. Gets future (scheduled) or past (history) meetings for a specified organizer. Include 'history=true' and the past start and end dates in the URL to retrieve past meetings. Enter 'scheduled=true' (without dates) to get scheduled meetings.
        @available(*, deprecated, message: "Deprecated")
        public func get(parameters: GetParameters? = nil) -> Request<[CitrixGoToMeetingsAPI.MeetingByOrganizer]> {
            .get(path, query: parameters?.asQuery)
        }

        public struct GetParameters {
            public var isScheduled: Bool?
            public var isHistory: Bool?
            public var startDate: Date?
            public var endDate: Date?

            public init(isScheduled: Bool? = nil, isHistory: Bool? = nil, startDate: Date? = nil, endDate: Date? = nil) {
                self.isScheduled = isScheduled
                self.isHistory = isHistory
                self.startDate = startDate
                self.endDate = endDate
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(isScheduled, forKey: "scheduled")
                encoder.encode(isHistory, forKey: "history")
                encoder.encode(startDate, forKey: "startDate")
                encoder.encode(endDate, forKey: "endDate")
                return encoder.items
            }
        }
    }
}

extension Paths.Organizers.WithOrganizerKey {
    public var upcomingMeetings: UpcomingMeetings {
        UpcomingMeetings(path: path + "/upcomingMeetings")
    }

    public struct UpcomingMeetings {
        /// Path: `/organizers/{organizerKey}/upcomingMeetings`
        public let path: String

        /// Get upcoming meetings by organizer
        ///
        /// Get upcoming meetings for a specified organizer. This API call is only available to users with the admin role.
        public var get: Request<[CitrixGoToMeetingsAPI.UpcomingMeeting]> {
            .get(path)
        }
    }
}

extension Paths {
    public static var upcomingMeetings: UpcomingMeetings {
        UpcomingMeetings(path: "/upcomingMeetings")
    }

    public struct UpcomingMeetings {
        /// Path: `/upcomingMeetings`
        public let path: String

        /// Get upcoming meetings
        ///
        /// Gets upcoming meetings for the current authenticated organizer.
        public var get: Request<[CitrixGoToMeetingsAPI.UpcomingMeeting]> {
            .get(path)
        }
    }
}

public enum Paths {}
