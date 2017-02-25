

            var maloai = $("#getMaLoai").val();
            $("MaLoai").val(maloai);

            autoProcessQueue: false;
            Dropzone.autoDiscover = false;
            $("#dZUpload").dropzone({
                maxFilesize: 2,
                maxFiles: 4,
                acceptedFiles: "image/*",
                maxfilesexceeded: function (file) {
                    this.removeFile(file);
                    alert("Giới hạn số lượng hình ảnh là 4!");
                },
                url: "/AdminHome/SaveUploadedFile",
                addRemoveLinks: true,
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                    console.log("Successfully uploaded :" + imgName);
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                },
                removedfile: function (file) {
                    var name = file.name;
                    $.ajax({
                        type: 'POST',
                        url: '/AdminHome/DeleteFile',
                        data: "id=" + name,
                        dataType: 'html',
                        success: function () {
                        }
                    });
                    var _ref;
                    return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                },
            });
            $("#btnThem").off('click').on('click', function () {
                $("#form").submit();
            });
        
  
