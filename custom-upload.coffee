(($) ->

  $.fn.customUploadButton = (settings) ->

    options = $.extend(
      placeholder: "Nenhum arquivo selecionado"
    , settings)

    @each ->

      container = $("<div>").attr("class", "input-wrapper")
      fileName = $("<div>").attr("class", "file-name").text(options.placeholder)
      inputButton = $("<input>").attr("class", "input-button").attr("type", "button").val("Upload")

      input = $(this)

      # input = $this.clone()
      input
        .data(options)
        .addClass('file-upload')

      op = input.data()

      container
        .insertAfter(input)
        .append(fileName)
        .append(inputButton)
        .append(input)

      pl = parseInt container.css("paddingLeft")
      pr = parseInt container.css("paddingRight")

      fileName.css
        width: op.width - pl - pr - inputButton.width()
        height: op.height
        overflow: "hidden"

      input.change ->
        $(this).prev(".file-name").text( if $(this).val() is '' then $(this).data('placeholder') else $(this).val() )

      container.bind "mousemove", (e) ->
        fileUpload = $(this).find('.file-upload')
        fileUpload.css
          left: e.pageX - $(this).position().left - fileUpload.width() + 10
          top: e.pageY - $(this).position().top - 30

) jQuery
