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

public const SEVERITY_FATAL = "fatal";
public const SEVERITY_ERROR = "error";
public const SEVERITY_WARNING = "warning";

public type Severity SEVERITY_FATAL | SEVERITY_ERROR | SEVERITY_WARNING;

# Represents the details of an Healthcare common error.
# 
# + severity - Severity of the error
# + errorCode - Error code
public type BaseErrorDetail record {
    Severity severity;
    string errorCode;
};

# Defines the common error type for the module.
public type HealthcareError distinct error;

// TODO add relevant error detail record as needed
# Parser related error type
public type ParserError HealthcareError;

// TODO add relevant error detail record as needed
# Serialization related error
public type SerializerError HealthcareError;
