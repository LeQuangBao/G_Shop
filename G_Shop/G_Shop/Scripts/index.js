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
            caThe.NgaySinh = caThe.NgaySinh.substring(6,19);
          caThe.image = caThe.HinhAnh.split("|")[0];
          caThe.url = buildUrlChiTiet(caThe.MaLoai, caThe.MaCaThe);
        });
        console.log($scope.giongs);
        $scope.data = data;
        console.log($scope.data);
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
  $scope.filterAge = function (prop,id) {
      function getAge(fromdate) {
          var todate = new Date();
          var age = [], fromdate = new Date(fromdate),
          y = [todate.getFullYear(), fromdate.getFullYear()],
          ydiff = y[0] - y[1],
          m = [todate.getMonth(), fromdate.getMonth()],
          mdiff = m[0] - m[1],
          d = [todate.getDate(), fromdate.getDate()],
          ddiff = d[0] - d[1];

          if (mdiff < 0 || (mdiff === 0 && ddiff < 0))--ydiff;
          if (mdiff < 0) mdiff += 12;
          if (ddiff < 0) {
              fromdate.setMonth(m[1] + 1, 0);
              ddiff = fromdate.getDate() - d[1] + d[0];
              --mdiff;
          }
          if (ydiff > 0) age.push(ydiff + ' y' );
          if (mdiff > 0) age.push(mdiff + ' m' );
          if (ddiff > 0) age.push(ddiff + ' d' );
          if (age.length > 1) age.splice(age.length - 1, 0, ' and ');
          return age.join('');
      }
      return function (item) {
          var bt = new Date();
          bt.setTime(item[prop]);
          var agestring = getAge(bt);
          var ageAray = agestring.split(' ');
          switch (id) {
              case 1: if ((agestring.includes('m') && !agestring.includes('y') && ageAray[0] <= 3) || (!agestring.includes('m') && !agestring.includes('y'))) return true;
                  break;
              case 2: if ((agestring.includes('m') && !agestring.includes('y') && ageAray[0] >= 3 && ageAray[0] < 12) || (agestring.includes('y') && !agestring.includes('m') && !agestring.includes('d') && ageAray[0] == 1)) return true;
                  break;
              case 3: if (agestring.includes('y') && (agestring.includes('m') || agestring.includes('d')) && ageAray[0] >= 1) return true;
                  break;
          }
      }
  }
  
  function buildUrlChiTiet(maLoai, maCaThe) {
    var urlChiTiet = "/Home/ChiTiet?MaLoai=" + maLoai.MaLoai + "&MaCaThe=" + maCaThe;
    return urlChiTiet;
  }
  
});