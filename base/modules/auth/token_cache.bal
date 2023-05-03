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
