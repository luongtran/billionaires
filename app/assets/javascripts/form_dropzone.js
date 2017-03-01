// disable auto discover
Dropzone.autoDiscover = false;
// grap our upload form by its id
$("#car_attachments").dropzone({
  // restrict image size to a maximum 1MB
  maxFilesize: 10,
  acceptedFiles: "image/*, application/*",
  // changed the passed param to one accepted by
  // our rails app
  paramName: "attachments_attributes[file]",
  // show remove links on each image upload
  addRemoveLinks: true,
  success: function(file, response) {

    file._downloadLink = Dropzone.createElement('<a class="btn btn-default no-radius btn-xs"  style="margin-left:5px;" href="' + response.link + '" target="_blank" data-dz-download><i style="cursor:pointer" class="fa fa-download"></i></a>');
    file.previewElement.appendChild(file._downloadLink);

    $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID).append("<i style='cursor:pointer' class='fa fa-remove'></i>");
    // add the dz-success class (the green tick sign)
    $(file.previewElement).addClass("dz-success");

  },

  error: function(file, message) {
    toastr.error(message);
    this.removeFile(file);
  },
  //autoProcessQueue: true,
  //when the remove button is clicked
  removedfile: function(file) {
    // grap the id of the uploaded file we set earlier
    var id = $(file.previewTemplate).find('.dz-remove').attr('id');
    var name = file.name;
    $.ajax({
      type: 'DELETE',
      url: '/backend/cars/attachments/' + id,
      success: function(data) {
        console.log(data.message);
      }
    });
    var _ref;
    return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
  },
});
