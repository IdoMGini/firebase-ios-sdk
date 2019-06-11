/*
 * Copyright 2019 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FIRInstallationsItem+Tests.h"
#import "FIRInstallationsStoredAuthToken.h"

@implementation FIRInstallationsItem (Tests)

+ (FIRInstallationsItem *)createValidInstallationItem {
  FIRInstallationsItem *item = [[FIRInstallationsItem alloc] initWithAppID:@"appID"
                                                           firebaseAppName:@"appName"];
  item.firebaseInstallationID = @"firebaseInstallationID";
  item.refreshToken = @"refreshToken";
  item.registrationStatus = FIRInstallationStatusUnregistered;

  return item;
}

+ (FIRInstallationsItem *)createRegisteredInstallationItem {
  FIRInstallationsItem *item = [[FIRInstallationsItem alloc] initWithAppID:@"appID"
                                                           firebaseAppName:@"appName"];
  item.firebaseInstallationID = @"firebaseInstallationID";
  item.refreshToken = @"refreshToken";
  item.registrationStatus = FIRInstallationStatusRegistered;

  return item;
}

+ (FIRInstallationsItem *)createRegisteredInstallationItemWithAppID:(NSString *)appID
                                                            appName:(NSString *)appName {
  FIRInstallationsItem *item = [[FIRInstallationsItem alloc] initWithAppID:appID
                                                           firebaseAppName:appName];
  item.firebaseInstallationID = [FIRInstallationsItem generateFID];
  item.refreshToken = @"refreshToken";
  item.registrationStatus = FIRInstallationStatusRegistered;

  FIRInstallationsStoredAuthToken *authToken = [[FIRInstallationsStoredAuthToken alloc] init];
  authToken.token = @"auth-token";
  authToken.expirationDate = [NSDate dateWithTimeIntervalSinceNow:1000];
  item.authToken = authToken;

  return item;
}

@end
