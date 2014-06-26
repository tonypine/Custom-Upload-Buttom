(($) ->

  $.fn.customUploadButton = (settings) ->

    options = $.extend(
      placeholder: "Nenhum arquivo selecionado"
      name: 'fileupload'
    , settings)

    @each ->

      button = $(this)
      button
        .data(options)
        .addClass('file-button')
        .css
          position: 'relative'
          overflow: 'hidden'
      op = button.data()

      fileInput = $("<input>")
        .attr
          class: "input-file"
          type: "file"
          name: op.name
        .css
          position: 'absolute'
          opacity: 0
          cursor: 'pointer'

      button
        .bind "mousemove", (e) ->
          fileUpload = $(this).find('.input-file')
          fileUpload.css
            left: e.pageX - $(this).offset().left - fileUpload.width() + 10
            top: e.pageY - $(this).offset().top - 11
        .append fileInput

) jQuery
