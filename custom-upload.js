(function($) {

    $.fn.customUploadButton = function(options) {

        var opt = $.extend({
            placeholder: 'Nenhum arquivo selecionado'
        }, options);
        
        return this.each(function() {
            var container = $("<div>").attr('class', 'input-container'),
                fileName = $("<div>").attr('class', 'file-name').text(opt.placeholder),
                inputButton = $("<input>").attr('class', 'input-button').attr('type', 'button').val('Upload');
            $this = $(this);
            var ipt = $this.clone();
            ipt.data({
                text: fileName,
                btn: inputButton,
                container: container
            });
            ipt.data('container').append(ipt.data('text')).append(ipt.data('btn'));
            ipt.data('container').append(ipt);
            $this.after(ipt.data('container')).remove();

            var pl = parseInt(ipt.data('container').css('paddingLeft'));
            var pr = parseInt(ipt.data('container').css('paddingRight'));

            ipt.data('text').css({
                width: opt.width - pl - pr - ipt.data('btn').width(),
                height: opt.height,
                overflow: 'hidden'
            });

            ipt.change(function() {
                if ($(this).val() === '') {
                    $(this).data('text').text(opt.placeholder);
                    return;
                }
                $(this).data('text').text($(this).val());
            });

            ipt.data('container').bind('mousemove', function(e) {
                var C = ipt.data('container');
                // C == container
                ipt.css({
                    left: e.pageX - C.position().left - ipt.width() + 10,
                    top: e.pageY - C.position().top - 30
                });
            });
        });
    };

})(jQuery);