var DropzoneExample = function () {
  var DropzoneDemos = function () {
      Dropzone.options.singleFileUpload = {
          paramName: "file",
          maxFiles: 1,
          accept:  async function (file, done) {
              var data = new FormData()
              data.append("file", file)
              const raw = await fetch("http://localhost:9597/upload/", {
                  method: 'POST',
                  mode: 'cors',
                  body: data
              })
              var response = await raw.json()
              document.getElementById("src-img").value = response.filename
              console.log(response)
          }
      };
      Dropzone.options.multiFileUpload = {
          paramName: "file",
          maxFiles: 10,
          maxFilesize: 10,
          accept:  async function (file, done) {
              var data = new FormData()
              data.append("file", file)
              const raw = await fetch("http://localhost:9597/upload/", {
                  method: 'POST',
                  mode: 'cors',
                  body: data
              })
              var response = await raw.json()
              debugger
              if( document.getElementById("src-img").value != ""){
                  document.getElementById("src-img").value += "/"
              }
              document.getElementById("src-img").value += response.filename
              console.log(response)
          }
      };
      Dropzone.options.fileTypeValidation = {
          paramName: "file",
          maxFiles: 10,
          maxFilesize: 10, 
          acceptedFiles: "image/*,application/pdf,.psd",
          accept: function(file, done) {
              if (file.name == "justinbieber.jpg") {
                  done("Naha, you don't.");
              } else {
                  done();
              }
          }
      };
  }
  return {
      init: function() {
          DropzoneDemos();
      }
  };
}();
DropzoneExample.init();