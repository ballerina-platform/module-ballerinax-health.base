// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

import ballerina/http;

# Client class that handles calling the auth provider and enriching the request.
public isolated client class PKJWTAuthHandler {
    private final PKJWTAuthProvider provider;

    public isolated function init(PKJWTAuthConfig config) {
        self.provider = new(config.cloneReadOnly());
    }

    # Add the OAuth2 token to the request.
    #
    # + req - The request to be enriched with the OAuth2 token.
    # + return - The request enriched with the OAuth2 token or an error if the token could not be retrieved.
    remote isolated function enrich(http:Request req) returns http:Request|HealthcareSecurityError {
        string|HealthcareSecurityError result = self.provider.getToken();
        if result is string {
            req.setHeader(http:AUTH_HEADER, http:AUTH_SCHEME_BEARER + " " + result);
            return req;
        }
        return prepareError("Failed to enrich request with OAuth2 token.", result);
    }

    # Add the OAuth2 token to the headers.
    #
    # + headers - The headers to be enriched with the OAuth2 token.
    # + return - The headers enriched with the OAuth2 token or an error if the token could not be retrieved.
    public isolated function enrichHeaders(map<string> headers) returns map<string>|HealthcareSecurityError {
        string|HealthcareSecurityError result = self.provider.getToken();
        if result is string {
            headers[http:AUTH_HEADER] = http:AUTH_SCHEME_BEARER + " " + result;
            return headers;
        }
        return prepareError("Failed to enrich headers with OAuth2 token.", result);   
    }
}
