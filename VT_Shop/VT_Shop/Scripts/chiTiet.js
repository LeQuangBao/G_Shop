app.controller('chiTietController', function ($scope, $http) {
  var url = "http://localhost:60181/";
  
  var data = [];

  $scope.data = [];
  $scope.goiY = [];

  $scope.filter = "";

  // get TreeId
  // var temp = window.location.href.split("=");
  // $scope.TreeId = temp[temp.length - 1];
  var link = window.location.href;
  var objectLink = new URL(link);
  $scope.TreeId = objectLink.searchParams.get("TreeId");
  //------------
  $http({
    method: "GET",
    url: url + "Tree/getTree"
  }).then(function (response) {
    data = response.data;
    //------------
    $http({
      method: "GET",
      url: url + "Tree/getLoai"
    }).then(function (response) {
      // scope
      $scope.loais = response.data;

      // Add Loai to Tree
      loais = response.data;
      data.forEach(function (Tree) {
        loais.forEach(function (loai) {
          if (loai.LoaiId === Tree.LoaiId) {
            Tree.LoaiId = loai;
          }
        })
      });
      //------------
      $http({
        method: "GET",
        url: url + "Tree/getGiong"
      }).then(function (response) {
        giongs = response.data;
        $scope.giongs = response.data;
        $scope.giongs.forEach(function (g, i) {
          $scope.giongs[i].loais = [];
          $scope.loais.forEach(function (l) {
            if (l.GiongId === g.GiongId) {
              $scope.giongs[i].loais.push(l);
            }
          });
        });

        // Add Giong to Tree
        data.forEach(function (Tree) {
          giongs.forEach(function (giong) {
            if (giong.GiongId === Tree.LoaiId.GiongId) {
              Tree.LoaiId.GiongId = giong;
            }
          })
        });

        // get GoiY
        $http({
          method: "GET",
          url: url + "Tree/getGoiY"
        }).then(function (response) {
          var goiY = response.data;
          var l = [];
         
          goiY.forEach(function (g) {
            if (g.C1 === $scope.TreeId * 1) {
              l.push(g.C2);
            }
          });
          data.forEach(function (Tree, i) {
            l.forEach(function(o) {
              if (o === Tree.TreeId) {
                $scope.goiY.push(Tree);
              }
            })
          });
          $scope.data = data;
          console.log($scope.data);
          console.log($scope.goiY);
        }, function (response) {

        });
      }, function (response) {

      });
    }, function (response) {

    });
  }, function (response) {

  });

 
  $scope.addToCart = function (id, event) {
    $http({
      url: "/Cart/Add",
      data: { id: id },
      method: "POST"
    }).then(function (response) {
      console.log(response);
    }, function (response) {
      console.log(response);
    });
    $(event.currentTarget).addClass("btn btn-success active");
  }

  function buildUrlChiTiet(LoaiId, TreeId) {
    var urlChiTiet = "/Home/ChiTiet?LoaiId=" + LoaiId.LoaiId + "&TreeId=" + TreeId;
    return urlChiTiet;
  }
});