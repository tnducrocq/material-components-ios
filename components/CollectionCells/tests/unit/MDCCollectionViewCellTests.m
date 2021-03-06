// Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <XCTest/XCTest.h>
#import "MaterialCollectionCells.h"

@interface MDCCollectionViewCellTests : XCTestCase

@end

@implementation MDCCollectionViewCellTests

- (void)testAccessoryChange {
  // Given
  MDCCollectionViewCell *cell = [[MDCCollectionViewCell alloc] initWithFrame:CGRectZero];
  cell.accessoryType = MDCCollectionViewCellAccessoryCheckmark;
  XCTAssertTrue([cell.accessoryView isKindOfClass:[UIImageView class]]);
  UIImageView *accessoryImageView = (UIImageView *)cell.accessoryView;
  UIImage *originalImage = accessoryImageView.image;

  // When
  cell.accessoryType = MDCCollectionViewCellAccessoryDetailButton;

  // Then
  UIImage *newImage = accessoryImageView.image;
  XCTAssertNotEqualObjects(originalImage, newImage);
}

- (void)testRippleViewIsNotActiveByDefault {
  // Given
  MDCCollectionViewCell *cell = [[MDCCollectionViewCell alloc] initWithFrame:CGRectZero];

  // Then
  XCTAssertNil(cell.rippleView.superview);
  XCTAssertNotNil(cell.inkView.superview);
  XCTAssertFalse(cell.enableRippleBehavior);
}

- (void)testSettingEnableRippleBehaviorToYes {
  // Given
  MDCCollectionViewCell *cell = [[MDCCollectionViewCell alloc] initWithFrame:CGRectZero];

  // When
  cell.enableRippleBehavior = YES;

  // Then
  XCTAssertEqual(cell.rippleView.superview, cell);
  XCTAssertNil(cell.inkView.superview);
}

@end
