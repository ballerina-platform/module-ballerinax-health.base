// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

import ballerina/time;

// This class stores the values received from the token/introspection endpoint to use them for the latter requests
// without requesting tokens again.
isolated class TokenCache {

    private string accessToken;
    private int expTime;

    isolated function init() {
        self.accessToken = "";
        self.expTime = -1;
    }

    isolated function getAccessToken() returns string {
        lock {
            return self.accessToken;
        }
    }

    // Checks the validity of the cached access token by analyzing the expiry time.
    isolated function isAccessTokenExpired() returns boolean {
        lock {
            [int, decimal] currentTime = time:utcNow();
            return currentTime[0] > self.expTime;
        }
    }

    // Updates the cache with the values received from JSON payload of the response.
    isolated function update(string accessToken, int expiresIn, decimal clockSkew = 0) {
        lock {
            self.accessToken = accessToken;
            [int, decimal] currentTime = time:utcNow();
            int issueTime = currentTime[0];
            self.expTime = issueTime + expiresIn - <int>clockSkew;
        }
    }
}
