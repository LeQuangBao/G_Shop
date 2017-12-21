app.controller('chiTietController', function ($scope, $http) {
  var url = "http://localhost:60181/";
  
  var data = [];

  $scope.data = [];
  $scope.goiY = [];

  $scope.filter = "";

  // get maCay
  // var temp = window.location.href.split("=");
  // $scope.maCay = temp[temp.length - 1];
  var link = window.location.href;
  var objectLink = new URL(link);
  $scope.maCay = objectLink.searchParams.get("MaCay");
  //------------
  $http({
    method: "GET",
    url: url + "Cay/getCay"
  }).then(function (response) {
    data = response.data;
    //------------
    $http({
      method: "GET",
      url: url + "Cay/getLoai"
    }).then(function (response) {
      // scope
      $scope.loais = response.data;

      // Add Loai to Cay
      loais = response.data;
      data.forEach(function (Cay) {
        loais.forEach(function (loai) {
          if (loai.MaLoai === Cay.MaLoai) {
            Cay.MaLoai = loai;
          }
        })
      });
      //------------
      $http({
        method: "GET",
        url: url + "Cay/getGiong"
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

        // Add Giong to Cay
        data.forEach(function (Cay) {
          giongs.forEach(function (giong) {
            if (giong.MaGiong === Cay.MaLoai.MaGiong) {
              Cay.MaLoai.MaGiong = giong;
            }
          })
        });

        // get GoiY
        $http({
          method: "GET",
          url: url + "Cay/getGoiY"
        }).then(function (response) {
          var goiY = response.data;
          var l = [];
         
          goiY.forEach(function (g) {
            if (g.C1 === $scope.maCay * 1) {
              l.push(g.C2);
            }
          });
          data.forEach(function (Cay, i) {
            l.forEach(function(o) {
              if (o === Cay.MaCay) {
                $scope.goiY.push(Cay);
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

  function buildUrlChiTiet(maLoai, maCay) {
    var urlChiTiet = "/Home/ChiTiet?MaLoai=" + maLoai.MaLoai + "&MaCay=" + maCay;
    return urlChiTiet;
  }
});