// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

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
