(($) ->
  $.fn.customUploadButton = (settings) ->
    options = $.extend(
      placeholder: "Nenhum arquivo selecionado"
    , settings)
    @each ->
      container = $("<div>").attr("class", "input-container")
      fileName = $("<div>").attr("class", "file-name").text(options.placeholder)
      inputButton = $("<input>").attr("class", "input-button").attr("type", "button").val("Upload")
      $this = $(this)
      input = $this.clone()
      input.data
        text: fileName
        btn: inputButton
        container: container

      input.data("container").append(input.data("text")).append input.data("btn")
      input.data("container").append input
      $this.after(input.data("container")).remove()
      pl = parseInt(input.data("container").css("paddingLeft"))
      pr = parseInt(input.data("container").css("paddingRight"))
      input.data("text").css
        width: options.width - pl - pr - input.data("btn").width()
        height: options.height
        overflow: "hidden"

      input.change ->
        if $(this).val() is ""
          $(this).data("text").text options.placeholder
          return
        $(this).data("text").text $(this).val()
        return

      input.data("container").bind "mousemove", (e) ->
        C = input.data("container")

        # C == container
        input.css
          left: e.pageX - C.position().left - input.width() + 10
          top: e.pageY - C.position().top - 30

        return

      return


  return
) jQuery
