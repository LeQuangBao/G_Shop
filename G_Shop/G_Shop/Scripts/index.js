app.controller('indexController', function ($scope, $http) {
  var url = "http://localhost:60181/";
  var data = [];
 
  $scope.data = [];
  $scope.filter = "";
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
        $scope.giongs.forEach(function(g, i) {
          $scope.giongs[i].loais = [];
          $scope.loais.forEach(function(l){
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
        data.forEach(function (caThe) {
          caThe.image = caThe.HinhAnh.split("|")[0];
          caThe.url = buildUrlChiTiet(caThe.MaLoai, caThe.MaCaThe);
        });
        console.log(data);
        console.log($scope.giongs);
        $scope.data = data;
      }, function (response) {

      });
    }, function (response) {

    });
  }, function (response) {

  });
  
  $scope.setFilter = function (filter) {
    $scope.filter = filter;
  }
  $scope.setFilter({MaLoai: {MaLoai: 1}});
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