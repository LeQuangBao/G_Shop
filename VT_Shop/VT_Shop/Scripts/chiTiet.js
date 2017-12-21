app.controller('chiTietController', function ($scope, $http) {
  var url = "http://localhost:60181/";
  
  var data = [];

  $scope.data = [];
  $scope.goiY = [];

  $scope.filter = "";

  // get maCaThe
  // var temp = window.location.href.split("=");
  // $scope.maCaThe = temp[temp.length - 1];
  var link = window.location.href;
  var objectLink = new URL(link);
  $scope.maCaThe = objectLink.searchParams.get("MaCaThe");
  //------------
  $http({
    method: "GET",
    url: url + "CaThe/getCaThe"
  }).then(function (response) {
    data = response.data;
    //------------
    $http({
      method: "GET",
      url: url + "CaThe/getLoai"
    }).then(function (response) {
      // scope
      $scope.loais = response.data;

      // Add Loai to CaThe
      loais = response.data;
      data.forEach(function (caThe) {
        loais.forEach(function (loai) {
          if (loai.MaLoai === caThe.MaLoai) {
            caThe.MaLoai = loai;
          }
        })
      });
      //------------
      $http({
        method: "GET",
        url: url + "CaThe/getGiong"
      }).then(function (response) {
        giongs = response.data;
        $scope.giongs = response.data;
        $scope.giongs.forEach(function (g, i) {
          $scope.giongs[i].loais = [];
          $scope.loais.forEach(function (l) {
            if (l.MaGiong === g.MaGiong) {
              $scope.giongs[i].loais.push(l);
            }
          });
        });

        // Add Giong to CaThe
        data.forEach(function (caThe) {
          giongs.forEach(function (giong) {
            if (giong.MaGiong === caThe.MaLoai.MaGiong) {
              caThe.MaLoai.MaGiong = giong;
            }
          })
        });

        // get GoiY
        $http({
          method: "GET",
          url: url + "CaThe/getGoiY"
        }).then(function (response) {
          var goiY = response.data;
          var l = [];
         
          goiY.forEach(function (g) {
            if (g.C1 === $scope.maCaThe * 1) {
              l.push(g.C2);
            }
          });
          data.forEach(function (caThe, i) {
            l.forEach(function(o) {
              if (o === caThe.MaCaThe) {
                $scope.goiY.push(caThe);
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

  function buildUrlChiTiet(maLoai, maCaThe) {
    var urlChiTiet = "/Home/ChiTiet?MaLoai=" + maLoai.MaLoai + "&MaCaThe=" + maCaThe;
    return urlChiTiet;
  }
});