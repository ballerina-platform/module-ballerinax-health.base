// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Client class that handles calling the auth provider and enriching the request.
public isolated client class PkjwtAuthHandler {
    private final PkjwtAuthProvider provider;

    public isolated function init(PkjwtAuthConfig config) {
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
