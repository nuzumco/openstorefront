'use strict';

app.directive('selectall', function () {
  return {
    replace: true,
    restrict: 'E',
    scope: {
      checkboxes: '=',
      allselected: '=allSelected',
      allclear: '=allClear'
    },
    template: '<input type="checkbox" ng-model="master" ng-change="masterChange()">',
    controller: function ($scope, $element) {

      $scope.masterChange = function () {
        if ($scope.master) {
          angular.forEach($scope.checkboxes, function (cb, index) {
            cb.checked = true;
          });
        } else {
          angular.forEach($scope.checkboxes, function (cb, index) {
            cb.checked = false;
          });
        }
      };

      $scope.$watch('checkboxes', function () {
        var allSet = true,
        allClear = true;
        angular.forEach($scope.checkboxes, function (cb, index) {
          if (cb.checked) {
            allClear = false;
          } else {
            allSet = false;
          }
        });

        if ($scope.allselected !== undefined) {
          $scope.allselected = allSet;
        }
        if ($scope.allclear !== undefined) {
          $scope.allclear = allClear;
        }

        $element.prop('indeterminate', false);
        if (allSet) {
          $scope.master = true;
        } else if (allClear) {
          $scope.master = false;
        } else {
          $scope.master = false;
          $element.prop('indeterminate', true);
        }

      }, true);
    }
  };
});
